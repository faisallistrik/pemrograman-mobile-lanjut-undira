import 'package:flutter/material.dart'; // langkah 6
import 'model/pizza.dart'; // langkah 6
import 'httphelper.dart'; // langkah 6

class PizzaDetailScreen extends StatefulWidget { // langkah 7
  // Catatan: Parameter pizza bersifat opsional.
  // - Jika null → mode tambah (add)
  // - Jika tidak null → mode edit (update)
  final Pizza? pizza;

  const PizzaDetailScreen({super.key, this.pizza});

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  // Catatan: Menentukan mode berdasarkan ada/tidaknya data pizza
  bool get isEditing => widget.pizza != null;

  final TextEditingController txtId = TextEditingController(); // langkah 8
  final TextEditingController txtName = TextEditingController(); // langkah 8
  final TextEditingController txtDescription = TextEditingController(); // langkah 8
  final TextEditingController txtPrice = TextEditingController(); // langkah 8
  final TextEditingController txtImageUrl = TextEditingController(); // langkah 8
  String operationResult = ''; // langkah 8
  bool isLoading = false; // untuk menampilkan loading saat POST/PUT

  @override
  void initState() {
    super.initState();
    // Catatan: Jika mode edit, isi field dengan data pizza yang ada (langkah 16)
    if (isEditing) {
      txtId.text = widget.pizza!.id.toString();
      txtName.text = widget.pizza!.pizzaName;
      txtDescription.text = widget.pizza!.description;
      txtPrice.text = widget.pizza!.price.toString();
      txtImageUrl.text = widget.pizza!.imageUrl;
    }
  }

  @override
  void dispose() { // langkah 9
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }

  // Catatan: Method untuk membuat pizza baru (POST) (langkah 12)
  Future<void> postPizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza(
      id: int.tryParse(txtId.text) ?? 0,
      pizzaName: txtName.text,
      description: txtDescription.text,
      price: double.tryParse(txtPrice.text) ?? 0.0,
      imageUrl: txtImageUrl.text,
    );
    setState(() => isLoading = true);
    String result = await helper.postPizza(pizza);
    setState(() {
      isLoading = false;
      operationResult = result;
    });
    // Catatan: Jika sukses, kembalikan pizza ke halaman utama
    final isSuccess = result.toLowerCase().contains('posted') || result.toLowerCase().contains('success');
    if (isSuccess && mounted) {
      Navigator.pop(context, pizza);
    }
  }

  // Catatan: Method untuk mengupdate pizza yang sudah ada (PUT) (langkah 17)
  Future<void> putPizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza(
      id: int.tryParse(txtId.text) ?? 0,
      pizzaName: txtName.text,
      description: txtDescription.text,
      price: double.tryParse(txtPrice.text) ?? 0.0,
      imageUrl: txtImageUrl.text,
    );
    setState(() => isLoading = true);
    String result = await helper.putPizza(pizza);
    setState(() {
      isLoading = false;
      operationResult = result;
    });
    // Catatan: WireMock mengembalikan "Pizza was updated" untuk PUT sukses
    final isSuccess = result.toLowerCase().contains('updated') || result.toLowerCase().contains('success');
    if (isSuccess && mounted) {
      Navigator.pop(context, pizza);
    }
  }

  @override
  Widget build(BuildContext context) { // langkah 10
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Pizza' : 'Pizza Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // langkah 11: result dari post/put
              Text(
                operationResult,
                style: TextStyle(
                  backgroundColor: Colors.green[200],
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtName,
                decoration: const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 48),
              // Catatan: Tombol berubah sesuai mode — "Send Post" atau "Update"
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : (isEditing ? putPizza : postPizza),
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(isEditing ? 'Update' : 'Send Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}