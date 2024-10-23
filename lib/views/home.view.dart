import 'package:flutter/material.dart';
import 'package:flutter_app_scratch/component/drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body:  Center(
        child: Text(
          'Home page', 
          // style: TextStyle(color: Colors.green, fontSize: 26), 
          style: Theme.of(context).textTheme.headlineMedium, 
        ),
      ),
    );
  }
}