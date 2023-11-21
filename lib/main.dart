import 'package:flutter/material.dart';
import 'package:latihan_responsi/ui/home_page.dart';
import 'package:latihan_responsi/ui/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}