import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter'
        ),
      ),
      body: Center(
        child: Text('Counter value => $counter', style: const TextStyle(fontSize: 22, color: Colors.green) ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: (){
              setState(() {
                ++counter;  
              });
            }
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: (){
              setState(() {
                --counter;  
              });
            }
          ),
        ],
      ),
      
    );
  }
}