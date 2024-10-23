import 'package:flutter/material.dart';


class MeteoView extends StatelessWidget {
  

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