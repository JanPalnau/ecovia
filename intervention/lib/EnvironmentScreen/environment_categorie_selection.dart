import 'package:ecovia/EnvironmentScreen/graph_article.dart';
import 'package:flutter/foundation.dart';



class EnvironmentCategorieSelection with ChangeNotifier{
  
  int _selectedCategorie = 0;
  List<GraphArticle> _selectedGraphArticles = allGraphArticles;

  int get selectedCategorie => _selectedCategorie;

  List<GraphArticle> get selectedGraphArticles => _selectedGraphArticles;

  set selectedCategorie(int newValue) {
    _selectedCategorie = newValue;
    notifyListeners();
  }

  set selectedGraphArticles(List<GraphArticle> newValue) {
    _selectedGraphArticles = newValue;
    notifyListeners();
  }

}