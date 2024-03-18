import 'package:ecovia/JsonObjects/favorite_recipe.dart';
import 'package:ecovia/References/references.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteRecipesStream extends ChangeNotifier {
  Stream<List<FavoriteRecipe>> fetchFavoriteRecipesData() {
    return userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('favoriteRecipes')
        .orderBy('id')
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) =>
                FavoriteRecipe.fromJson(document.data() as dynamic))
            .toList());
  }
}
