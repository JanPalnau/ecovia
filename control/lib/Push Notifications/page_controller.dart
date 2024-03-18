import 'package:flutter/cupertino.dart';

class ControllerNotifier with ChangeNotifier {

  final PageController pageController = PageController();
  @override
  notifyListeners();
}