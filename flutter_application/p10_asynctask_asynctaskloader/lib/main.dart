import 'package:flutter/material.dart';

void main() {
  runApp(
    // 1. Memasang provider di puncak root aplikasi agar bisa diakses semua layar
    CounterProvider(
      notifier: CounterState(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}

// ==========================================
// LAPISAN DATA (MODEL & STATE)
// ==========================================
class CounterState extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Memberitahu semua widget yang mendengarkan bahwa data berubah
  }
}

// ==========================================
// PENGELOLA DATA LAYER (INHERITEDNOTIFIER)
// ==========================================
class CounterProvider extends InheritedNotifier<CounterState> {
  const CounterProvider({
    super.key,
    required CounterState super.notifier,
    required super.child,
  });

  // Fungsi helper (of) agar widget anak di bawahnya mudah memanggil provider ini
  static CounterState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!.notifier!;
  }
}

// ==========================================
// LAYAR 1: HALAMAN UTAMA (VIEW 1)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil state dari CounterProvider
    final counterState = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layar Utama'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Angka saat ini:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '${counterState.count}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Berpindah ke Layar Kedua
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DetailScreen()),
                );
              },
              child: const Text('Pergi ke Layar Detail'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterState.increment(), // Menambah angka
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ==========================================
// LAYAR 2: HALAMAN DETAIL (VIEW 2)
// ==========================================
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengakses data yang sama tanpa perlu lempar data lewat constructor
    final counterState = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layar Detail'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Angka dari Layar Utama: ${counterState.count}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => counterState.increment(), // Mengubah angka dari layar berbeda
              child: const Text(
                'Tambah Angka dari Sini',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}