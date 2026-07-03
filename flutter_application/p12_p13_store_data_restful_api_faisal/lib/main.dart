import 'package:flutter/material.dart';
import 'httphelper.dart';
import 'model/pizza.dart';
import 'pizza_detail.dart'; // langkah 13

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Catatan: Data pizza dikelola sebagai state lokal karena WireMock
  // tidak benar-benar menyimpan data. Pizza baru dari form ditambahkan
  // ke list ini secara lokal agar tampak di UI.
  List<Pizza> pizzas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPizzas();
  }

  Future<void> loadPizzas() async {
    setState(() => isLoading = true);
    HttpHelper helper = HttpHelper();
    List<Pizza> result = await helper.getPizzaList();
    setState(() {
      pizzas = result;
      isLoading = false;
    });
  }

  // Catatan: Method untuk membuka layar tambah pizza.
  // Jika PizzaDetailScreen mengembalikan data pizza baru (via Navigator.pop),
  // pizza tersebut ditambahkan ke list lokal.
  Future<void> openAddPizzaScreen() async {
    final Pizza? newPizza = await Navigator.push<Pizza>(
      context,
      MaterialPageRoute(builder: (context) => const PizzaDetailScreen()),
    );

    if (newPizza != null) {
      setState(() {
        // Catatan: Karena WireMock tidak menyimpan data, pizza baru
        // ditambahkan ke list lokal agar langsung terlihat di UI.
        pizzas.add(newPizza);
      });
    }
  }

  // Catatan: Method untuk membuka layar edit pizza (langkah 18).
  // Menerima data pizza yang akan diedit, mengirimkannya ke PizzaDetailScreen,
  // lalu memperbarui list lokal dengan hasil edit.
  Future<void> openEditPizzaScreen(Pizza pizza) async {
    final Pizza? updatedPizza = await Navigator.push<Pizza>(
      context,
      MaterialPageRoute(
        builder: (context) => PizzaDetailScreen(pizza: pizza),
      ),
    );

    if (updatedPizza != null) {
      setState(() {
        // Catatan: Cari index pizza lama berdasarkan ID, lalu ganti dengan data baru
        final index = pizzas.indexWhere((p) => p.id == updatedPizza.id);
        if (index != -1) {
          pizzas[index] = updatedPizza; // (langkah 19)
        }
      });
    }
  }

  // Catatan: Method untuk menghapus pizza (langkah 21).
  // Menampilkan dialog konfirmasi, lalu memanggil API DELETE dan
  // menghapus dari list lokal.
  Future<void> deletePizza(Pizza pizza) async {
    // Catatan: Konfirmasi sebelum menghapus
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Pizza'),
        content: Text('Yakin ingin menghapus "${pizza.pizzaName}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      HttpHelper helper = HttpHelper();
      String result = await helper.deletePizza(pizza.id);
      // Catatan: WireMock mengembalikan "Pizza was deleted" untuk DELETE sukses
      final isSuccess = result.toLowerCase().contains('deleted') || result.toLowerCase().contains('success');
      if (isSuccess) {
        setState(() {
          // Catatan: Hapus pizza dari list lokal (langkah 22)
          pizzas.removeWhere((p) => p.id == pizza.id);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza List', style: TextStyle(fontWeight: FontWeight.bold))),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : pizzas.isEmpty
              ? const Center(child: Text('No data'))
              : ListView.builder(
                  itemCount: pizzas.length,
                  itemBuilder: (context, index) {
                    final p = pizzas[index];
                    return ListTile(
                      // Catatan: Tap pada item → buka layar edit (langkah 18)
                      onTap: () => openEditPizzaScreen(p),
                      leading: Container(
                        width: 64,
                        height: 64,
                        padding: const EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            p.assetPath,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
                          ),
                        ),
                      ),
                      title: Text(p.pizzaName),
                      subtitle: Text(p.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('€${p.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          // Catatan: Tombol hapus pizza (langkah 21)
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                            onPressed: () => deletePizza(p),
                          ),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton( // langkah 14
        onPressed: openAddPizzaScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}


