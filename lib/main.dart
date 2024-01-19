import 'package:flutter/material.dart';
import 'package:salaya/constant/constant.dart';
import 'package:salaya/splash.dart';

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
        primaryColor: ColorConstants.themeColor,
        primarySwatch: MaterialColor(0xFF0FADF1, ColorConstants.swatchColor),
        useMaterial3: true,
        fontFamily:'ComicNeue',
      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}