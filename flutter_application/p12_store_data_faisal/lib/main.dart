import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  late Future<List<Pizza>> _pizzaFuture;

  @override
  void initState() {
    super.initState();
    _pizzaFuture = _readJsonFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza List', style: TextStyle(fontWeight: FontWeight.bold))),
      body: FutureBuilder<List<Pizza>>(
        future: _pizzaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final pizzas = snapshot.data!;
            return ListView.builder(
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
                  trailing: Text('£${p.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                );
              },
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }

  Future<List<Pizza>> _readJsonFile() async {
    try {
      debugPrint('_readJsonFile: start');
      final String myString = await rootBundle.loadString('assets/pizzalist.json');
      debugPrint('_readJsonFile: loaded asset, length=${myString.length}');
      final List<dynamic> pizzaMapList = jsonDecode(myString);
      final List<Pizza> pizzas = [];
      for (final pizza in pizzaMapList) {
        pizzas.add(Pizza.fromJson(pizza as Map<String, dynamic>));
      }
      debugPrint('_readJsonFile: parsed ${pizzas.length} pizzas');
      return pizzas;
    } catch (e, st) {
      debugPrint('_readJsonFile: error: $e');
      debugPrint('stacktrace: $st');
      rethrow;
    }
  }
}


