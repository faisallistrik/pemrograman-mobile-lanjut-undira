import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'geolocation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P11 - Pemrograman Asynchronous',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LocationScreen(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  late Completer<int> completer;

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future<void> count() async {
    int total = 0;

    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();

    setState(() {
      result = total.toString();
    });
  }

  Future<http.Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/junbDwAAQBAJ';

    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  Future<int> getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future<void> calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);

      // Untuk mengetes error, aktifkan baris di bawah ini
      // throw Exception();
    } catch (_) {
      completer.completeError({});
    }
  }

  void returnFG() {
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);

    futures.then((List<int> value) {
      int total = 0;

      for (var element in value) {
        total += element;
      }

      setState(() {
        result = total.toString();
      });
    });
  }

  Future<void> returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  Future<void> handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('Complete');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back From Future'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),

            ElevatedButton(
              onPressed: () {
                handleError();

                /*
                Kode dari langkah returnError().then().catchError()
                sebelumnya. Untuk langkah terbaru, kode ini tidak dipakai dulu.

                returnError()
                    .then((value) {
                      setState(() {
                        result = 'Success';
                      });
                    })
                    .catchError((onError) {
                      setState(() {
                        result = onError.toString();
                      });
                    })
                    .whenComplete(() => print('complete'));
                */

                /*
                Kode dari langkah returnFG() sebelumnya.
                Untuk langkah terbaru, kode ini tidak dipakai dulu.

                returnFG();
                */

                /*
                Kode dari langkah getNumber() sebelumnya.
                Untuk langkah terbaru, kode ini tidak dipakai dulu.

                getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                }).catchError((e) {
                  setState(() {
                    result = 'An error occurred';
                  });
                });
                */

                /*
                Kode dari langkah count() sebelumnya.
                Untuk langkah terbaru, kode ini tidak dipakai dulu.

                count();
                */

                /*
                Kode dari langkah getData() sebelumnya.
                Untuk langkah terbaru, kode ini tidak dipakai dulu.

                getData().then((value) {
                  setState(() {
                    result = value.body.toString().substring(0, 450);
                  });
                }).catchError((_) {
                  setState(() {
                    result = 'An error occurred';
                  });
                });
                */
              },
              child: const Text('Go!'),
            ),

            const Spacer(),

            Text(result),

            const Spacer(),

            const CircularProgressIndicator(),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}