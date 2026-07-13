import 'package:flutter/material.dart';

class MyFABWidget extends StatelessWidget {
  const MyFABWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.thumb_up),
      ),
    );
  }
}
