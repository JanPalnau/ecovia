import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/JsonObjects/diet_goal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DietGoalsStream extends ChangeNotifier{
  final CollectionReference dietGoalsReference = FirebaseFirestore.instance
    .collection('users')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection('dietGoals');
  Stream<List<DietGoal>> fetchDietGoalsData() {
    return dietGoalsReference.orderBy('id', descending: true).snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => DietGoal.fromJson(document.data() as dynamic))
            .toList());
  }
  // @override
  // void disposeValues() {
  //   DietGoalsStream().dispose();
  // }
}



