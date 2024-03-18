import 'package:flutter/material.dart';
import 'package:ecovia/ProfileScreen/profile_body.dart';
import 'package:ecovia/SurveyScreen/survey_body.dart';
import 'package:ecovia/home_body.dart';
import 'package:ecovia/recipe_body.dart';


class NavItem {
  final int? id;
  final String? icon;
  final Widget? destination;


  NavItem({this.id, this.icon, this.destination});

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItems extends ChangeNotifier {
  int? selectIndex = 0;

  void changeNavIndex({int? index}) {
    selectIndex = index;
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/fi-rr-home.svg",
      destination: const HomeBody(),
    ),
    NavItem(
      id: 2,
      icon: "assets/fi-rr-notebook.svg",
      destination: const SurveyBody(),
    ),
    NavItem(
      id: 3, 
      icon: "assets/fi-rr-box.svg",
      destination: const RecipeBody(),
    ),
    NavItem(
      id: 4,
      icon: "assets/fi-rr-world.svg",
      destination: const RecipeBody(),
    ),
    NavItem(
      id: 5,
      icon: "assets/fi-rr-user.svg",
      destination: ProfileBody(),
    ),
  ];

}