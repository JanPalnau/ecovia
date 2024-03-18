// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:co2_app/recipes.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseApi {
//   static Future<String> createRecipes(Recipe recipe) async {
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//     final CollectionReference users = FirebaseFirestore.instance.collection("users");
//     final docRecipes = users.doc(uid).collection('favoriteRecipes').doc();
    
//     recipe.id = docRecipes.id;
//     await docRecipes.set(recipe.toJson());

//     return docRecipes.id;
//   }


//   //static Stream<List<Recipe>> readRecipes() {
//     //final uid = FirebaseAuth.instance.currentUser.uid;
//    // FirebaseFirestore.instance.collection("users").doc(uid).collection('recipes')
//     //.snapshots()
//    // .transform(transformer(Recipe.fromJson());
    
//  // }

//  static Stream<List<Recipe>> readRecipes() {
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//     return FirebaseFirestore.instance.collection("users").doc(uid).collection('savedRecipes')
//     .snapshots()
//     .map((recipe) {
//     return recipe.docs
//       .map((e) => Recipe.fromJson(e.data()))
//       .toList();  
//     });
//   }


//  // static StreamTransformer transformer<T>(
//      //     T Function(Map<String, dynamic> json) fromJson) =>
//      // StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
//        // handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
//         //  final snaps = data.docs.map((doc) => doc.data()).toList();
//          // final objects = snaps.map((json) => fromJson(json)).toList();

//         //  sink.add(objects);
//        // },
//      // );
// }

// class FirebaseApiAllRecipes {
//   // ignore: missing_return
//   static Future<String> createRecipes(Recipe recipe, bool data) async {
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//     final CollectionReference users = FirebaseFirestore.instance.collection("users");
//     final docRecipes = users.doc(uid).collection('savedRecipes').doc("$recipe.id");
//     //final DocumentReference favoriteRecipes = FirebaseFirestore.instance.collection('users').doc(uid).collection('favoriteRecipes').doc('favoriteRecipes');
//     if (data == false) {
//       recipe.id = docRecipes.id;
//       await docRecipes.set(recipe.toJson());
//       return docRecipes.id;
//     } else {
//       await docRecipes.delete();
//     } return "nothing here";
//     //if (data == false) {
//       //await docRecipes.delete(recipe());
//     //}
//   }
// }