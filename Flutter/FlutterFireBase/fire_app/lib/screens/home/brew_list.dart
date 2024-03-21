import 'package:fire_app/model/brew.dart';
import 'package:fire_app/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrewList extends StatelessWidget {
  final List<Brew> brews;
  const BrewList({super.key, required this.brews});

  //overiding inistState method
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
