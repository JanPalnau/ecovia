import 'package:ecovia/JsonObjects/favorite_recipe.dart';
import 'package:ecovia/MapsUrl/application_bloc.dart';
import 'package:ecovia/RecipeScreen/animated_gradient_box.dart';
import 'package:ecovia/RecipeScreen/favorites_selection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/RecipeScreen/recipe_details.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:ecovia/showcase_labels_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/size_config.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/recipes.dart';
import 'package:ecovia/MapsUrl/maps.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:ecovia/References/references.dart';
import 'package:showcaseview/showcaseview.dart';
import '../JsonObjects/user_data.dart';
import 'recipe_card.dart';

class RecipeSuggestionScreen extends StatefulWidget {
  const RecipeSuggestionScreen({Key? key}) : super(key: key);

  @override
  State<RecipeSuggestionScreen> createState() => _RecipeSuggestionScreenState();
}

class _RecipeSuggestionScreenState extends State<RecipeSuggestionScreen>
    with SingleTickerProviderStateMixin {
  // Position? _position;

  // void _getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     _position = position;
  //   });
  // }

  // List<Recipe> dailyRecipes = RecipeCatalog()
  //     .recipes
  //     .where((element) => element.categories!.contains('Hauptmahlzeit'))
  //     .toList();
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Future<void> _addRecipeList() async {
  //   const String recipeListGenerated = 'recipeListGenerated';
  //   final SharedPreferences prefs = await _prefs;
  //   await prefs.setBool(recipeListGenerated, false);
  //   if (prefs.getBool(recipeListGenerated) == false) {
  //     List<int> recipeIDs = [];
  //     for (var element in RecipeCatalog().recipes) {
  //       recipeIDs.add((int.parse(element.id!)) - 1);
  //     }
  //   }

  //   final int counter = (prefs.getInt('counter') ?? 0) + 1;

  //   setState(() {
  //     _counter = prefs.setInt('counter', counter).then((bool success) {
  //       return counter;
  //     });
  //   });
  // }

  late AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DocumentReference userReference =
        userCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    //final recipeProvider = Provider.of<RecipeCatalog>(context);
    final container = StateContainer.of(context);
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    //super.build(context); USE WITH AutomaticKeepAliveMixin
    //final uid = FirebaseAuth.instance.currentUser!.uid;
    // final Stream<DocumentSnapshot> _userStream = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uid)
    //     .collection('favoriteRecipes')
    //     .doc('favoriteRecipes')
    //     .snapshots();
    //late List<Recipe> selectedRecipes = [];
    // List<Recipe> randomRecipes(int n, List<Recipe> source) {
    //   selectedRecipes = source.sample(n);
    //   //source.removeWhere((element) => selectedRecipes.contains(element));
    //   return selectedRecipes;
    // }

    return Consumer<UserData>(builder: (context, userSnapshot, child) {
      if (userSnapshot.dailyRecipesGenerated == false) {
        List<int> recipeIDs = userSnapshot.recipeIDs!.sample(3);
        for (var element in recipeIDs) {
          userReference.update({
            'recipeIDs': FieldValue.arrayRemove([element])
          });
        }
        userReference.set({'recipeList': {}}, SetOptions(merge: true));

        List<int> dailyRecipesID = [];
        for (var element in recipeIDs) {
          dailyRecipesID.add(element);
        }
        userReference.set({
          'dailyRecipesGenerated': true,
          'dailyRecipes': {
            'recipeOne': dailyRecipesID[0],
            'recipeTwo': dailyRecipesID[1],
            'recipeThree': dailyRecipesID[2]
          }
        }, SetOptions(merge: true));
      }
      List<Recipe> selectedRecipes = [
        RecipeCatalog().recipes[userSnapshot.dailyRecipes!['recipeOne']!],
        RecipeCatalog().recipes[userSnapshot.dailyRecipes!['recipeTwo']!],
        RecipeCatalog().recipes[userSnapshot.dailyRecipes!['recipeThree']!]
      ];
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: backgroundGradient()),
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                child: Text(
                  "Deine heutigen Rezeptvorschläge",
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * 0.06,
                      fontWeight: FontWeight.bold,
                      color: kDarkGreen),
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * 2,
                ),
                child: Consumer2<FavoritesSelection, List<FavoriteRecipe>>(
                    builder: (context, favoritesSelection, favoriteRecipes, _) {
                  if (favoriteRecipes.isEmpty) {}
                  if (favoriteRecipes.isNotEmpty) {
                    return Stack(
                      children: [
                        Showcase(
                          key: container.recipesKeyTwo,
                          description: showCaseLabels[14],
                          targetBorderRadius: BorderRadius.circular(16),
                          tooltipBorderRadius: BorderRadius.circular(16),
                          targetPadding: const EdgeInsets.all(8),
                          tooltipPadding: const EdgeInsets.all(8),
                          child: ListView.builder(
                            itemCount: selectedRecipes.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecipeDetails(
                                      recipe: selectedRecipes[index],
                                      tag: selectedRecipes[index].imgSrc!,
                                    ),
                                  ),
                                ),
                                child: RecipeCard(
                                    imageName: selectedRecipes[index]
                                        .imgSrc!
                                        .replaceAll('assets/', ''),
                                    recipe: selectedRecipes[index],
                                    trailing: favoriteRecipes[int.parse(
                                            selectedRecipes[index].id!)]
                                        .isFavorized!,
                                    tag: selectedRecipes[index].imgSrc!,
                                    onTap: () {
                                      //recipeCatalog.recipes[index].isFavorized = !recipeCatalog.recipes[index].isFavorized;
                                      //recipeCatalog.addItem(
                                      //index, favoritesSelection.favorizedRecipes);
                                      //print(recipeCatalog.recipes[index]);
                                      //recipeCatalog.addItem(index, favoritesSelection.favorizedRecipes);
                                      userCollection
                                          .doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .collection('favoriteRecipes')
                                          .doc(
                                              '${int.parse(selectedRecipes[index].id!)}')
                                          .update({
                                        'isFavorized': !favoriteRecipes[
                                                int.parse(
                                                    selectedRecipes[index].id!)]
                                            .isFavorized!,
                                      });
                                      userCollection
                                          .doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .collection('userBehavior')
                                          .doc('userBehavior')
                                          .set({'recipeInfo_$index': true},
                                              SetOptions(merge: true));
                                      //FirebaseApiAllRecipes.createRecipes(selectedRecipes[index], snapshot.data['${selectedRecipes[index].id}']);
                                    }),
                              ),
                            ),
                            //RecipeSuggestionCard(
                            //recipes: selectedRecipes[index],
                            //trailing: snapshot.data['${index + 1}'],
                            //press: () {},
                            //onTap: () {
                            //recipeCatalog.recipes[index].isFavorized = !recipeCatalog.recipes[index].isFavorized;
                            //recipeCatalog.addItem(
                            //index, favoritesSelection.favorizedRecipes);
                            //print(recipeCatalog.recipes[index]);
                            //recipeCatalog.addItem(index, favoritesSelection.favorizedRecipes);
                            //recipes.update({
                            //'${selectedRecipes[index].id}': !snapshot.data['${selectedRecipes[index].id}'],
                            //});
                            //FirebaseApiAllRecipes.createRecipes(selectedRecipes[index], snapshot.data['${selectedRecipes[index].id}']);
                            //}),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Showcase(
                              key: container.recipesKeyThree,
                              description: showCaseLabels[15],
                              targetBorderRadius: BorderRadius.circular(16),
                              tooltipBorderRadius: BorderRadius.circular(16),
                              targetPadding: const EdgeInsets.all(8),
                              tooltipPadding: const EdgeInsets.all(8),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AnimatedGradientBox(
                                    boxShadowList: animatedGradientBoxShadow,
                                    //boxHeight: SizeConfig.screenHeight * 0.05,
                                    //width: SizeConfig.screenWidth * 0.5,
                                    child: InkWell(
                                      onTap: () {
                                        try {
                                          MapUtils.openMap(
                                              applicationBloc
                                                  .currentLocation.latitude,
                                              applicationBloc
                                                  .currentLocation.longitude);
                                        } catch (e) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  12))),
                                                  elevation: 10,
                                                  title: Center(
                                                      child: Text(
                                                    "Erlaube ECOVIA auf deinen Standort zuzugreifen und stelle eine aktive Internetverbindung sicher.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .screenHeight *
                                                            0.016,
                                                        color: Colors.red),
                                                  )),
                                                  alignment: Alignment.center,
                                                );
                                              });
                                        }
                                      },
                                      child: Text(
                                        "Oder finde passende Restaurants",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                SizeConfig.defaultSize! * 2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // child: Container(
                              //   margin: EdgeInsets.all(
                              //       SizeConfig.defaultSize! * 1),
                              //   padding: EdgeInsets.all(
                              //       SizeConfig.defaultSize! * 1),
                              //   width: SizeConfig.defaultSize! * 70,
                              //   decoration: BoxDecoration(
                              //       //color: kDarkGreen,
                              //       gradient: LinearGradient(
                              //           colors: const [
                              //             Color.fromRGBO(48, 84, 70, 1),
                              //             Color.fromARGB(255, 56, 105, 86),
                              //             Color.fromARGB(255, 57, 127, 100),
                              //             Color.fromARGB(255, 63, 173, 120)
                              //           ],
                              //           begin: Alignment.bottomCenter,
                              //           end: Alignment.topLeft,
                              //           stops: const [0.1, 0.3, 0.7, 1.0]),
                              //       borderRadius: BorderRadius.circular(16),
                              //       boxShadow: const [
                              //         BoxShadow(
                              //           color: Color.fromARGB(182, 0, 0, 0),
                              //           blurRadius: 15.0,
                              //           spreadRadius: 0,
                              //           offset: Offset(0,
                              //               4), // shadow direction: bottom right
                              //         )
                              //       ]),
                              //   child: InkWell(
                              //     onTap: () {
                              //       MapUtils.openMap(
                              //           applicationBloc
                              //               .currentLocation.latitude,
                              //           applicationBloc
                              //               .currentLocation.longitude);
                              //     },
                              //     child: Text.rich(
                              //       TextSpan(
                              //           text: "Oder finde passende ",
                              //           style: TextStyle(
                              //               color: Colors.white,
                              //               fontSize: 20,
                              //               fontWeight: FontWeight.bold),
                              //           children: const [
                              //             TextSpan(
                              //               text: "Restaurants!",
                              //               style: TextStyle(
                              //                   color: Colors.white,
                              //                   fontSize: 20,
                              //                   fontWeight: FontWeight.bold,
                              //                   decoration:
                              //                       TextDecoration.underline),
                              //             ),
                              //           ]),
                              //     ),
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
              ),
            ),
          ]),
        ),
      );
    });
  }

  bool get wantKeepAlive => true;
}
