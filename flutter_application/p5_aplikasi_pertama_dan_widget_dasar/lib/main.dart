import 'package:flutter/material.dart';
import 'basic_widgets/text_widget.dart';
import 'basic_widgets/image_widget.dart';
import 'basic_widgets/loading_cupertino.dart';
import 'basic_widgets/fab_widget.dart';
import 'basic_widgets/scaffold_widget.dart';
import 'basic_widgets/dialog_widget.dart';
import 'basic_widgets/input_widget.dart';
import 'basic_widgets/date_picker_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Praktikum',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Praktikum Flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pilih Langkah Praktikum:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasicWidgetsPage(),
                  ),
                );
              },
              child: const Text('Langkah 1&2: Text & Image Widget'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CupertinoWidgetPage(),
                  ),
                );
              },
              child: const Text('Langkah 3: Cupertino Widget'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFABWidget()),
                );
              },
              child: const Text('Langkah 4: FAB Widget'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyScaffoldWidget(),
                  ),
                );
              },
              child: const Text('Langkah 5: Scaffold Widget'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyDialogWidget(),
                  ),
                );
              },
              child: const Text('Langkah 6: Dialog Widget'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyInputWidget(),
                  ),
                );
              },
              child: const Text('Langkah 7: Input Widget'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyDatePickerWidget(),
                  ),
                );
              },
              child: const Text('Langkah 8: Date Picker Widget'),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicWidgetsPage extends StatelessWidget {
  const BasicWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text & Image Widget')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyTextWidget(),
            SizedBox(height: 20),
            MyImageWidget(),
          ],
        ),
      ),
    );
  }
}

class CupertinoWidgetPage extends StatelessWidget {
  const CupertinoWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cupertino Widget')),
      body: const MyCupertinoLoading(),
    );
  }
}
