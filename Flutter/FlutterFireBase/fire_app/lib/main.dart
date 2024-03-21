import 'package:fire_app/model/user.dart';
import 'package:fire_app/screens/wrapper.dart';
import 'package:fire_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().authStateChanges,
      initialData: null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


/**
 * return StreamProvider<UserCurrent?>.value(
      value: AuthService().auser,
      initialData: null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
 */