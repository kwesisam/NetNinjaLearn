import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/model/brew.dart';
import 'package:fire_app/screens/home/brew_list.dart';
import 'package:fire_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_app/services/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: const Text('bottom sheet '),
            );
          });
    }

    return StreamBuilder<QuerySnapshot>(
        stream: _databaseService.documentStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          List<Brew> brews = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Brew(
                name: data['name'] ?? '',
                sugars: data['sugars'] ?? '',
                strength: data['strength'] ?? 0);
          }).toList();

          return Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              title: const Text('Brew Crew'),
              elevation: 0,
              actions: [
                TextButton.icon(
                    onPressed: () {
                      _showSettingPanel();
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Settings",
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            body: BrewList(brews: brews),
          );
        });
  }
}
