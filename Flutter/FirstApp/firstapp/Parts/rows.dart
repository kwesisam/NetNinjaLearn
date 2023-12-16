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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Hello world"),
          const ElevatedButton(onPressed: hello, child: Text("click me")),
          Container(
            color: Colors.cyan,
            padding: const EdgeInsets.all(30),
            child: const Text("Container text"),
          )
        ],
      ),
    );
  }
}

void hello() {
  print('dddd');
}
