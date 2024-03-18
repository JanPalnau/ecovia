import 'package:ecovia/JsonObjects/favorite_recipe.dart';
import 'package:ecovia/RecipeScreen/recipe_categorie_selection.dart';
import 'package:ecovia/recipes.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:provider/provider.dart';

class RecipeCategories extends StatefulWidget {
  RecipeCategories({Key? key}) : super(key: key);

  final List<String> recipeCategories = [
    "Alle",
    "Frühstück",
    "Hauptmahlzeit",
    "Snacks",
    "Deutsche Küche",
    "Vegane Basics",
    "Süßigkeiten",
    "Salate",
    "Bowls",
    "Suppen",
    "Asiatisch",
    "Türkisch",
    "Französisch",
    "Amerikanisch",
    "Indisch",
    "Spanisch-Mexikanisch",
    "Orientalisch",
    "Griechisch",
    "Schwedisch",
  ];

  @override
  State<RecipeCategories> createState() => _RecipeCategoriesState();
}

class _RecipeCategoriesState extends State<RecipeCategories> {
  // CategorieSelection model = CategorieSelection();
  //@override
  //void didChangeDependencies() {
  // super.didChangeDependencies();
  // model.selectedRecipes = Provider.of<RecipeCatalog>(context).recipes;
  //}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.defaultSize! * 1,
      ),
      child: SizedBox(
        height: SizeConfig.defaultSize! * 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.recipeCategories.length,
          itemBuilder: (context, index) => buildCategoriItem(index),
        ),
      ),
    );
  }

  //void _categorieFilter(int index) {
  //List<Recipes> results = Provider.of<CategorieSelection>(context).selectedRecipes;
  //if (index == 0) {
  // if the search field is empty or only contains white-space, we'll display all users
  //results = recipes;
  //} else if (index == 1) {
  //results = recipes.where((element) => element.categorie.contains("Hausmannskost")).toList();
  //} else if (index == 2) {
  //results = recipes.where((element) => element.categorie.contains("Indisch")).toList();
  //} else if (index == 3) {
  //results = recipes.where((element) => element.categorie.contains("Italienisch")).toList();
  //}
  //}

  Widget buildCategoriItem(int index) {
    var categorieSelection = Provider.of<RecipeCategorieSelection>(context);
    var recipes = Provider.of<RecipeCatalog>(context).recipes;
    return Consumer<List<FavoriteRecipe>>(
      builder: (context, favoriteRecipes, _) {
        return GestureDetector(
          onTap: () {
            setState(() {
              categorieSelection.selectedCategorie = index;
            });
            setState(() {
              //(index) => categorieSelection.selectedCategorie = index;
              if (index == 0) {
                if(categorieSelection.favorizedRecipes == true){
                  categorieSelection.selectedRecipes = recipes.where((element) => favoriteRecipes[int.parse(element.id!)].isFavorized == true).toList();
                } else {
                  categorieSelection.selectedRecipes = recipes;
                }
                
              } else {
                if(categorieSelection.favorizedRecipes == true){
                  categorieSelection.selectedRecipes = recipes.where((element) => favoriteRecipes[int.parse(element.id!)].isFavorized == true).toList().where((element) => element.categories!.contains(widget.recipeCategories[index])).toList();
                } else {
                  categorieSelection.selectedRecipes = recipes.where((element) => element.categories!.contains(widget.recipeCategories[index])).toList();
                }
              }
              
              // else if (index == 1) {
              //   categorieSelection.selectedRecipes = recipes
              //       .where((element) => element.categories!.contains("Frühstück"))
              //       .toList();
              //   //print(categorieSelection.selectedRecipes.length);
              // } else if (index == 2) {
              //   categorieSelection.selectedRecipes = recipes
              //       .where(
              //           (element) => element.categories!.contains("Hauptmahlzeit"))
              //       .toList();
              //   //print(categorieSelection.selectedRecipes.length);
              // } else if (index == 3) {
              //   categorieSelection.selectedRecipes = recipes
              //       .where((element) => element.categories!.contains("Snacks"))
              //       .toList();
              //   //print(categorieSelection.selectedRecipes.length);
              // } else if (index == 4) {
              //   categorieSelection.selectedRecipes = recipes
              //       .where(
              //           (element) => element.categories!.contains("Deutsche Küche"))
              //       .toList();
              //   //print(categorieSelection.selectedRecipes.length);
              // }
              //print(categorieSelection.selectedCategorie);
              // print(categorieSelection.selectedRecipes);
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
              //vertical: SizeConfig.defaultSize! * 0.5,
            ),
            decoration: BoxDecoration(
              color: kDarkGreen,
              borderRadius: BorderRadius.circular(
                SizeConfig.defaultSize! * 1.6,
              ),
            ),
            child: Text(
              widget.recipeCategories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: categorieSelection.selectedCategorie == index
                    ? Colors.white
                    : Colors.grey[400],
              ),
            ),
          ),
        );
      }
    );
  }
}
