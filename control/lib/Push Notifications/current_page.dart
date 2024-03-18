import 'package:flutter/cupertino.dart';

class PageNotifier with ChangeNotifier {

  int _currentPage = 0;
  int get currentPage => _currentPage;

  set setCurrentPage(val) {
    _currentPage = val;
    notifyListeners();
  }
}