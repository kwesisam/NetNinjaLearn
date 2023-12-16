import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

//for stateless widget "stl"

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // ..... body
        );
  }
}
