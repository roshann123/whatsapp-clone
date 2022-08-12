import 'package:flutter/material.dart';
import 'package:whatsapp/home/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'whatsApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme:const AppBarTheme(
          color: Color(0xFF075E50),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
