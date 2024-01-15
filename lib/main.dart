import 'package:flutter/material.dart';
import 'package:salaya/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salaya',
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: true,
        fontFamily:'ComicNeue',
      ),
      home: login(),
      debugShowCheckedModeBanner: false,
    );
  }
}