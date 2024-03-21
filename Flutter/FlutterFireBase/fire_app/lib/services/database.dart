import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/model/brew.dart';

class DatabaseService {
  late String uid;

  void setID(String userUid) {
    uid = userUid;
  }

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> upDateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }



  //get document streams
  final Stream<QuerySnapshot> documentStream =
      FirebaseFirestore.instance.collection('brews').snapshots();
}
