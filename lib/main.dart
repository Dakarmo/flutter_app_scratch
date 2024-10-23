import 'package:flutter/material.dart';
import 'package:flutter_app_scratch/views/galerie.view%20.dart';
import 'package:flutter_app_scratch/views/home.view.dart';
import 'package:flutter_app_scratch/views/meteo.view%20.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home" : (context) => const HomeView(),
        "/meteo" : (context) =>  MeteoView(),
        "/galerie" : (context) => GalerieView(),
      },
      theme: ThemeData(
         appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
      ), 
      // primarySwatch: Colors.green,
    ),
      // title: 'Flutter from scratch',
      initialRoute: "/home",
      // home: const HomeView(),
    );
  }
}