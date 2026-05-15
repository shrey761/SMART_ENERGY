import 'package:flutter/material.dart';
import 'screens/home_screens.dart';
void main() {
  runApp(const VoltixApp());
}

class VoltixApp extends StatelessWidget {
  const VoltixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voltix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}