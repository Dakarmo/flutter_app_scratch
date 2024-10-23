import 'package:flutter/material.dart';
import 'package:flutter_app_scratch/views/homeView.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
      ), 
    ),
      title: 'Flutter from scratch',
      home: const Homeview(),
    );
  }
}