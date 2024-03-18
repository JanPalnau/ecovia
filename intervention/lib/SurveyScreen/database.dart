import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/References/references.dart';

import '../recipes.dart';

final CollectionReference users =
    FirebaseFirestore.instance.collection("users");

Future<void> userSetup() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.add({
    'uid': uid,
  });
  return;
}

class DatabaseService extends ChangeNotifier {
  final String? uid;
  DatabaseService({this.uid});

  Future updateUserData(List<Recipe> recipes) async {
    Map<String, bool> favoriteRecipesMap = {};

    for (int i = 1; i < 209; i++) {
      favoriteRecipesMap.addEntries([MapEntry(i.toString(), false)]);
    }
    //favoriteRecipesReference.set({'favoriteRecipes': favoriteRecipesMap});
    //Map<String?, dynamic> recipeMap = {};
    //recipes.forEach((element) {recipeMap[element.id] = element.isFavorized;});
    for (var recipe in recipes) {
      //recipeMap[recipe.id] = recipe.isFavorized;
      userCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favoriteRecipes')
          .doc(recipe.id!)
          .set({'id': int.parse(recipe.id!), 'isFavorized': false});
      //favoriteRecipesReference.set({'${recipe.id}' : recipe.isFavorized}, SetOptions(merge: true));
    }
  }

  // Future updateStatementsData(List<PaulaStatementsFinished> statementsList) async {
  //   //Map<String?, dynamic>  finishedStatementsMap = {};
  //  //recipes.forEach((element) {recipeMap[element.id] = element.isFavorized;});
  //   for (var statement in statementsList) {
  //     //finishedStatementsMap[statement.name] = false;
  //     paulaStatementsReference.set({'${statement.name}' : false}, SetOptions(merge: true));
  //   }
  // }

  // Future<void> getFavoritesFromFirebase() async {
  //   final uid = FirebaseAuth.instance.currentUser.uid;
  //   final CollectionReference favoriteRecipes = users.doc(uid).collection('favoriteRecipes');
  //   DocumentSnapshot snapshot = await favoriteRecipes.doc('favoriteRecipes').get();
  //   var data = snapshot.data();
  //   print(data);
  // }
}
