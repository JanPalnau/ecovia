import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/JsonObjects/favorite_recipe.dart';
import 'package:ecovia/RecipeScreen/recipe_categorie_selection.dart';
import 'package:ecovia/RecipeScreen/recipe_details.dart';
import 'package:ecovia/RecipeScreen/recipe_search_bar.dart';
import 'package:ecovia/References/references.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/recipe_categories.dart';
import 'package:ecovia/recipes.dart';
import 'package:provider/provider.dart';
import 'recipe_card.dart';

class RecipeSearchScreen extends StatefulWidget {
  const RecipeSearchScreen({Key? key}) : super(key: key);

  @override
  State<RecipeSearchScreen> createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final recipes = RecipeCatalog().recipes;
    // final Stream<DocumentSnapshot> _userStream = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .collection('favoriteRecipes')
    //     .doc('favoriteRecipes')
    //     .snapshots();
    //final databaseService = Provider.of<DatabaseService>(context);
    //bool _selected = false;
    super.build(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: backgroundGradient()),
        child: Consumer3<RecipeCatalog, RecipeCategorieSelection,
                List<FavoriteRecipe>>(
            builder: (context, recipeCatalog, categorieSelection,
                favoriteRecipes, _) {
          // List<FavoriteRecipe> favoriteRecipes = [];
          // recipeData.favoriteRecipes!.forEach((key, value) {favoriteRecipes.add(FavoriteRecipe(id: int.parse(key), isFavorized: value));});
          //favoriteRecipes.removeWhere((element) => element.isFavorized == false);

          // List<FavoriteRecipe> favoriteRecipes = [];
          // for (var e in recipeData.favoriteRecipes.entries) {
          //   favoriteRecipes.add(FavoriteRecipe(id: e.key, isFavorized: e.value));
          // }
          if (favoriteRecipes.isNotEmpty) {
            return ListView(
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const RecipeSearchBar(),
                    IconButton(
                        onPressed: () {
                          categorieSelection.favorizedRecipes =
                              !categorieSelection.favorizedRecipes;
                          if (categorieSelection.selectedCategorie == 0) {
                            if (categorieSelection.favorizedRecipes == true) {
                              categorieSelection.selectedRecipes = recipes
                                  .where((element) =>
                                      favoriteRecipes[int.parse(element.id!)]
                                          .isFavorized ==
                                      true)
                                  .toList();
                            } else {
                              categorieSelection.selectedRecipes = recipes;
                            }
                          } else {
                            if (categorieSelection.favorizedRecipes == true) {
                              categorieSelection.selectedRecipes = recipes
                                  .where((element) =>
                                      favoriteRecipes[int.parse(element.id!)]
                                          .isFavorized ==
                                      true)
                                  .toList()
                                  .where((element) => element.categories!
                                      .contains(
                                          RecipeCategories().recipeCategories[
                                              categorieSelection
                                                  .selectedCategorie]))
                                  .toList();
                            } else {
                              categorieSelection.selectedRecipes = recipes
                                  .where((element) => element.categories!
                                      .contains(
                                          RecipeCategories().recipeCategories[
                                              categorieSelection
                                                  .selectedCategorie]))
                                  .toList();
                            }
                          }
                        },
                        icon: Icon(
                          categorieSelection.favorizedRecipes == true
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          color: kDarkGreen,
                          size: SizeConfig.screenWidth * 0.1,
                        )),
                  ],
                ),
                RecipeCategories(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * 2),
                  child: ListView.builder(
                      cacheExtent: 5,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: categorieSelection.selectedRecipes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecipeDetails(
                                      recipe: categorieSelection
                                          .selectedRecipes[index],
                                      tag: categorieSelection
                                          .selectedRecipes[index].id!,
                                    ),
                                  ),
                                );
                                userCollection
                                  ..doc(FirebaseAuth.instance.currentUser!.uid)
                                      .collection('userBehavior')
                                      .doc('userBehavior')
                                      .set({'recipeInfo_$index': true},
                                          SetOptions(merge: true));
                              },
                              child: RecipeCard(
                                  imageName: categorieSelection
                                      .selectedRecipes[index].imgSrc!
                                      .replaceAll('assets/', ''),
                                  //categorieSelection.selectedRecipes[index].imgSrc!.replaceAll('assets/', ''),
                                  recipe:
                                      categorieSelection.selectedRecipes[index],
                                  tag: categorieSelection
                                      .selectedRecipes[index].id!,
                                  trailing: favoriteRecipes[int.parse(
                                          categorieSelection
                                              .selectedRecipes[index].id!)]
                                      .isFavorized!,
                                  //recipeCatalog.recipes[index].isFavorized,
                                  onTap: () {
                                    //recipeCatalog.toggle(index);
                                    //recipeCatalog.addItem(index, favoritesSelection.favorizedRecipes);
                                    //recipeCatalog.addItemTwo(categorieSelection.selectedRecipes.isEmpty? recipeCatalog.recipes[index] : categorieSelection.selectedRecipes[index], snapshot.data['${index + 1}']);

                                    //databaseService.getFavoritesFromFirebase();

                                    //recipeCatalog.recipes[index].iFavorized = !recipeCatalog.recipes[index].iFavorized;
                                    //if(recipeCatalog.recipes[index].iFavorized == true) {
                                    //favoritesSelection.favorizedRecipes.add(recipeCatalog.recipes[index]);
                                    //} else if (recipeCatalog.recipes[index].iFavorized == false) {
                                    //favoritesSelection.favorizedRecipes.remove(recipeCatalog.recipes[index]);
                                    //}
                                    // print(favoritesSelection.favorizedRecipes);
                                    // print(recipeCatalog.recipes[index].isFavorized);
                                    //String jsonRecipes = jsonEncode(recipeCatalog.recipes);
                                    //print(jsonRecipes);
                                    //print(index);
                                    //print(snapshot.data['1']);
                                    userCollection
                                      ..doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .collection('favoriteRecipes')
                                          .doc(categorieSelection
                                              .selectedRecipes[index].id!)
                                          .set({
                                        'isFavorized':
                                            //'${categorieSelection.selectedRecipes[index].id}':
                                            !favoriteRecipes[int.parse(
                                                    categorieSelection
                                                        .selectedRecipes[index]
                                                        .id!)]
                                                .isFavorized!
                                      }, SetOptions(merge: true));
                                    //FirebaseApiAllRecipes.createRecipes(categorieSelection.selectedRecipes.isEmpty? recipeCatalog.recipes[index] : categorieSelection.selectedRecipes[index], snapshot.data['${recipeCatalog.recipes[index].id}']);
                                  })),
                        );
                      }),
                ),
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
