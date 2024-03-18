import 'package:flutter/material.dart';

class SurveyPageControllerNotifier with ChangeNotifier {

  final PageController pageController = PageController();
  @override
  notifyListeners();
}