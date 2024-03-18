import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/References/references.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../JsonObjects/user_data.dart';

class TestingWidget extends StatefulWidget {
  const TestingWidget({Key? key}) : super(key: key);

  @override
  State<TestingWidget> createState() => _TestingWidgetState();
}

class _TestingWidgetState extends State<TestingWidget> {
  @override
  Widget build(BuildContext context) {
    //final DateTime date = DateTime.now();
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    DocumentReference userReference =
        userCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    return Consumer<UserData>(builder: (context, userSnapshot, child) {
      DateTime loginDate = dateFormat.parse(userSnapshot.loginDate!);
      return TextButton(
          onPressed: () {
            final newLoginDate = loginDate.add(const Duration(days: 1));
            userReference.set({'loginDate': dateFormat.format(newLoginDate)},
                SetOptions(merge: true));
          },
          child: const Text('interventionday++'));
    });
  }
}
