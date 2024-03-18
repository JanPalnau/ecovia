import 'package:ecovia/recipes.dart';
import 'package:flutter/foundation.dart';



class RecipeCategorieSelection with ChangeNotifier{
  
  bool _favorizedRecipes = false;
  int _selectedCategorie = 10;
  List<Recipe> _selectedRecipes = RecipeCatalog().recipes;

  bool get favorizedRecipes => _favorizedRecipes;

  int get selectedCategorie => _selectedCategorie;

  List<Recipe> get selectedRecipes => _selectedRecipes;

  set favorizedRecipes(bool newValue) {
    _favorizedRecipes = newValue;
    notifyListeners();
  }

  set selectedCategorie(int newValue) {
    _selectedCategorie = newValue;
    notifyListeners();
  }

  set selectedRecipes(List<Recipe> newValue) {
    _selectedRecipes = newValue;
    notifyListeners();
  }

}