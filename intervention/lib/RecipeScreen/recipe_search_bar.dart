import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../recipes.dart';
import 'recipe_categorie_selection.dart';

class RecipeSearchBar extends StatefulWidget {
  const RecipeSearchBar({Key? key}) : super(key: key);



  @override
  State<RecipeSearchBar> createState() => _RecipeSearchBarState();
}

class _RecipeSearchBarState extends State<RecipeSearchBar> {
  TextEditingController textEditingController = TextEditingController();
  late RecipeCategorieSelection categorieSelection;
  late dynamic recipes;
  @override
  void initState() {
    textEditingController = TextEditingController()
      ..addListener(() {
        if (textEditingController.text.isNotEmpty) {
          setState(() {
           List<Recipe> listOne = recipes
               .where((element) => element.title!
                   .toString()
                   .toUpperCase()
                   .contains(textEditingController.text.toUpperCase()))
               .toList();
           List<Recipe> listTwo = recipes
               .where((element) => element.ingredients!
                   .toString()
                   .toUpperCase()
                   .contains(textEditingController.text.toUpperCase()))
               .toList();
           List<Recipe> listThree = recipes
               .where((element) => element.categories!
                   .toString()
                   .toUpperCase()
                   .contains(textEditingController.text.toUpperCase()))
               .toList();
           categorieSelection.selectedRecipes =
               {...listOne, ...listTwo, ...listThree}.toList();
         });
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    categorieSelection = Provider.of<RecipeCategorieSelection>(context);
    recipes = Provider.of<RecipeCatalog>(context).recipes;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.02,
          vertical: SizeConfig.screenHeight * 0.01),
      child: SizedBox(
          height: SizeConfig.defaultSize! * 5,
          child: Center(
            child: AnimSearchBar(
              helpText: 'Suchen',
              color: kDarkGreen,
              style: const TextStyle(color: Colors.black),
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              onSuffixTap: () {
                setState(() {
                  textEditingController.clear();
                });
              },
              onSubmitted: (onSubmitted) {
                List<Recipe> listOne = recipes
                    .where((element) => element.title!
                        .toString()
                        .toUpperCase()
                        .contains(onSubmitted.toUpperCase()))
                    .toList();
                List<Recipe> listTwo = recipes
                    .where((element) => element.ingredients!
                        .toString()
                        .toUpperCase()
                        .contains(onSubmitted.toUpperCase()))
                    .toList();
                List<Recipe> listThree = recipes
                    .where((element) => element.categories!
                        .toString()
                        .toUpperCase()
                        .contains(onSubmitted.toUpperCase()))
                    .toList();
                return categorieSelection.selectedRecipes =
                    {...listOne, ...listTwo, ...listThree}.toList();
              },
              width: SizeConfig.screenWidth * 0.8,
              textController: textEditingController,
            ),
          )),
    );
  }
}
