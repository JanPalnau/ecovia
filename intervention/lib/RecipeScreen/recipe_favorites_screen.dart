import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/JsonObjects/favorite_recipe.dart';
import 'package:ecovia/RecipeScreen/recipe_details.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/recipes.dart';
import 'package:provider/provider.dart';
import 'recipe_card.dart';

import '../References/references.dart';

class RecipeFavoritesScreen extends StatefulWidget {
  const RecipeFavoritesScreen({Key? key, this.isFavorized}) : super(key: key);

  final bool? isFavorized;

  @override
  State<RecipeFavoritesScreen> createState() => _RecipeFavoritesScreenState();
}

class _RecipeFavoritesScreenState extends State<RecipeFavoritesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    //final uid = FirebaseAuth.instance.currentUser!.uid;
    // final DocumentReference recipes = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uid)
    //     .collection('favoriteRecipes')
    //     .doc('favoriteRecipes');
    // final CollectionReference savedRecipes = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uid)
    //     .collection('savedRecipes');

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: backgroundGradient()),
        child: Consumer<RecipeCatalog>(
          builder: (context, recipeCatalog, _) => ListView(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * 2),
                  child: Consumer<List<FavoriteRecipe>>(
                      builder: (context, favoriteRecipes, _) {
                    List<Recipe> favoriteRecipesList = recipeCatalog.recipes
                        .where((element) =>
                            favoriteRecipes[int.parse(element.id!)]
                                .isFavorized ==
                            true)
                        .toList();

                    return favoriteRecipesList.isEmpty
                        ? Column(
                            children: [
                              SizedBox(
                                height: SizeConfig.defaultSize! * 30,
                              ),
                              const Center(
                                child: Text(
                                  'Du hast noch keine Rezepte gespeichert.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: favoriteRecipesList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(12),
                                child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RecipeDetails(
                                              recipe:
                                                  favoriteRecipesList[index],
                                              tag: favoriteRecipesList[index]
                                                  .title!,
                                            ),
                                          ),
                                        ),
                                    child: RecipeCard(
                                      imageName: favoriteRecipesList[index]
                                          .imgSrc!
                                          .replaceAll('assets/', ''),
                                      recipe: favoriteRecipesList[index],
                                      tag: favoriteRecipesList[index].title!,
                                      onTap: () {
                                        userCollection
                                          ..doc(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                              .collection('favoriteRecipes')
                                              .doc(
                                                  '${favoriteRecipesList[index].id}')
                                              .update({
                                            '${favoriteRecipesList[index].id}':
                                                false,
                                          });
                                        userCollection
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .collection('userBehavior')
                                            .doc('userBehavior')
                                            .set({'recipeInfo_$index': true},
                                                SetOptions(merge: true));
                                      },
                                      trailing: true,
                                    )),
                              );
                            });
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class SavedRecipeCard extends StatefulWidget {
//   final String altImgSrc, author, categorie, description, id, imgSrc, title;

//   final int cookingTime, servings, calories;

//   const SavedRecipeCard({
//     Key? key,
//     required this.altImgSrc,
//     required this.author,
//     required this.calories,
//     required this.categorie,
//     required this.cookingTime,
//     required this.description,
//     required this.id,
//     required this.imgSrc,
//     required this.servings,
//     required this.title,
//   }) : super(key: key);

//   final bool recipeSaved = false;

//   @override
//   State<SavedRecipeCard> createState() => _SavedRecipeCardState();
// }

// class _SavedRecipeCardState extends State<SavedRecipeCard> {
//   @override
//   Widget build(BuildContext context) {
//     //var favoritesSelection = Provider.of<FavoritesSelection>(context);
//     //var recipeProvider = Provider.of<Recipe>(context);
//     //var isFavorized = recipeProvider.isFavorized;
//     //isFavorized = true;
//     return Column(
//       children: [
//         Stack(children: [
//           Align(
//             alignment: Alignment.topCenter,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(25),
//               child: Hero(
//                 transitionOnUserGestures: false,
//                 tag: widget.id,
//                 child: Image(
//                   height: SizeConfig.defaultSize! * 35,
//                   width: SizeConfig.defaultSize! * 35,
//                   fit: BoxFit.cover,
//                   image: AssetImage(widget.altImgSrc),
//                 ),
//               ),
//             ),
//           ),
//         ]),
//         SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//             Flexible(
//               flex: 1,
//               child: Column(
//                 children: [
//                   Text(widget.title,
//                       style: Theme.of(context).textTheme.subtitle1),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text(widget.author,
//                       style: Theme.of(context).textTheme.caption),
//                 ],
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Icon(Icons.timer),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   Text("${widget.cookingTime.toString()} Min | "),
//                   Text("${widget.calories.toString()} Kalorien"),
//                 ],
//               ),
//             ),
//           ]),
//         ),
//       ],
//     );
//   }
// }
