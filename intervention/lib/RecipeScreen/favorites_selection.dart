import 'package:ecovia/recipes.dart';
import 'package:flutter/foundation.dart';

class FavoritesSelection extends ChangeNotifier{
  bool _isFavorized = false;
  List<Recipe> _favorizedRecipes = [];

  bool get isFavorized => _isFavorized;
  

  List<Recipe> get favorizedRecipes => _favorizedRecipes;

  set isFavorized(bool newValue) {
    _isFavorized = newValue;
    notifyListeners();
  }

  set favorizedRecipes(List<Recipe> newValue) {
    _favorizedRecipes = newValue;
    notifyListeners();
  }

  void toggleTodo(Recipe recipe) {
    final recipeIndex = _favorizedRecipes.indexOf(recipe);
    _favorizedRecipes[recipeIndex].isFavorized = !_favorizedRecipes[recipeIndex].isFavorized!;
    notifyListeners();
  }

}