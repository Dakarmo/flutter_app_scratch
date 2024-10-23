import 'package:flutter/material.dart';


class GalerieView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Galerie'),
      ),
      body:  Center(
        child: Text(
          'Galerie page', 
          // style: TextStyle(color: Colors.green, fontSize: 26), 
          style: Theme.of(context).textTheme.headlineMedium, 
        ),
      ),
    );
  }
}