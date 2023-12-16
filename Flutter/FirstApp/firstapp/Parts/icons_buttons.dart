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
    return const Scaffold(
      body: Center(
        // Icons
        child: Icon(
          Icons.access_alarm,
          size: 50,
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
/*
 ElevatedButton(
            onPressed: helloo, 
            child: Text('Click me'),
            )

            */

/**
 * MaterialButton(
        onPressed: hello,
        color: Colors.green,
        child: Text(
          'Click me',
          style: TextStyle(color: Colors.red),
        ),
 * 
 */
/**
 * ElevatedButton.icon(
              onPressed: hello,
              icon: const Icon(Icons.mail),
              label: const Text("mail me"),
              )
 */

/**
 * conButton(
        onPressed: hello,
        icon: Icon(Icons.alternate_email),
        color: Colors.amber,
      )
 */