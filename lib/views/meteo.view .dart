import 'package:flutter/material.dart';
import 'package:flutter_app_scratch/component/drawer.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('Météo'),
      ),
      body:  Center(
        child: Text(
          'Météo page', 
          // style: TextStyle(color: Colors.green, fontSize: 26), 
          style: Theme.of(context).textTheme.headlineMedium, 
        ),
      ),
    );
  }
}