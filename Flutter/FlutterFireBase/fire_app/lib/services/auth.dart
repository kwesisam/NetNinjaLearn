import 'package:fire_app/model/user.dart';
import 'package:fire_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService _databaseService = DatabaseService();
  //create user object
  UserCurrent? createUser(User? info) {
    //print('from create user');
    if (info != null) {
      //print(info.uid);
      return UserCurrent(uid: info.uid); // Use ! to assert that uid is not null
    } else {
      return null;
    }
  }

  // auth change user
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  //sign in anom
  Future signInAnom() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      //print('User signed in anonymously');
      User? user = userCredential.user;

      if (user != null) {
        //print(user);
        return createUser(user); // Assuming createUser() returns UserCurrent?
      } else {
        //print('User object is null');
        return null; // or handle the null case accordingly
      }
    } catch (e) {
      //print('Error signing in anonymously: $e');
      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;

      return createUser(user);
    } catch (e) {
      //print(e);
      return null;
    }
  }

  //sign up with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;
      print('----------');
      _databaseService.setID(user!.uid);
      await _databaseService.upDateUserData('0', 'new crew member', 100);
      return createUser(user);
    } catch (e) {
      //print(e);
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      //print('check where');
      return await _auth.signOut();
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }
}
