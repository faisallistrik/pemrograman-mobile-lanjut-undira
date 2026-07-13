// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum Vitae'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(20),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(height: 15),
                Text(
                  'Your Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Your Position',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your professional summary goes here.',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
                SizedBox(height: 30),
                Text(
                  'Skills',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(label: Text('Flutter')),
                    Chip(label: Text('Dart')),
                    Chip(label: Text('UI/UX')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
