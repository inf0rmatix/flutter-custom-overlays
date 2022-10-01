import 'package:flutter/material.dart';
import 'package:flutter_custom_overlays/home_page.dart';

final theme = ThemeData(
  primarySwatch: Colors.teal,
  useMaterial3: true,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Overlays',
      theme: theme,
      home: const HomePage(),
    );
  }
}
