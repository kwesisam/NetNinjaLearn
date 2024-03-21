import 'package:fire_app/model/user.dart';
import 'package:fire_app/screens/authenticate/authenticate.dart';
import 'package:fire_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user =
        context.watch<User?>(); // Listen to user authentication state

    //print('from wrapper');
    //print(user);

    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
    //will return home or authenticate base on user logins status

    //return const Authenticate();
  }
}
