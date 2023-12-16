import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        color: Colors.yellowAccent,
        child: const Text('hello'),
      ),
    );
  }
}

/**
 * You can use it to add padding to elements
 *  const Padding(
        padding: EdgeInsets.all(20),
        child: Text("hello "),
      )
 */