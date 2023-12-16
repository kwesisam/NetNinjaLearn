import 'package:flutter/material.dart';
import 'quotes.dart';

class QuotesCard extends StatelessWidget {
  final Quotes quote;
  final Function delete;
  const QuotesCard(this.quote, this.delete, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              quote.author,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton.icon(
                onPressed: () {
                  delete();
                },
                icon: const Icon(Icons.delete),
                label: const Text("Delete Quotes")),
          ],
        ),
      ),
    );
  }
}
