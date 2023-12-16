import 'package:flutter/material.dart';
import 'package:firstapp/quotes.dart';
import 'package:firstapp/quotes_card.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quotes> quotes = [
    Quotes('Be yourself; everyone else is already taken', 'Oscar Wilde'),
    Quotes('I have nothing to declare except my genius', 'Oscar Wilde'),
    Quotes('The truth is rarely pure and never simple', 'Oscar Wilde')
  ];

  Widget quotesTemplate(quote) {
    return QuotesCard(quote, () {
      if (mounted) {
        setState(() {
          quotes.remove(quote);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Awesome Quots"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: quotes.map((e) => quotesTemplate(e)).toList(),
        ));
  }
}
