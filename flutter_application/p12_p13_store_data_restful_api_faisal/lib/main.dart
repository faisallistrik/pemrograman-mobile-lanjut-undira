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

  // Catatan: Method ini dipanggil saat navigasi ke PizzaDetailScreen.
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
                      trailing: Text('€${p.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
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


