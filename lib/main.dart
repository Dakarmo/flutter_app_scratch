import 'package:flutter/material.dart';
import 'package:flutter_app_scratch/views/home.view.dart';

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
      // primarySwatch: Colors.green,
    ),
      title: 'Flutter from scratch',
      home: const Homeview(),
    );
  }
}