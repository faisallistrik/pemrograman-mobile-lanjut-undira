import 'package:flutter/material.dart';
import 'package:uts_curriculum_vitae/screens/home_screen.dart';
import 'package:uts_curriculum_vitae/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'UTS Curriculum Vitae',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
}
