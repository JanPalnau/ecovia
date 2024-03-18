import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/References/references.dart';

import '../JsonObjects/user_data.dart';

class UserDataStream extends ChangeNotifier {
  Stream<UserData> fetchUserData() {
    return (userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((document) => UserData.fromJson(document.data() as dynamic)));
  }
}
