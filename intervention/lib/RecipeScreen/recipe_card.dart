import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/recipes.dart';

// ignore: must_be_immutable
class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final dynamic onTap;
  final bool trailing;
  final String tag;
  final String imageName;
  RecipeCard({
    Key? key,
    required this.recipe,
    required this.onTap,
    required this.trailing,
    required this.tag,
    required this.imageName,
  }) : super(key: key);

  bool recipeSaved = false;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    //final container = StateContainer.of(context);
    //var favoritesSelection = Provider.of<FavoritesSelection>(context);
    //var recipeProvider = Provider.of<Recipe>(context);
    //var isFavorized = recipeProvider.isFavorized;
    //isFavorized = true;
    return Column(
      children: [
        Stack(children: [
          Hero(
            transitionOnUserGestures: true,
            tag: widget.tag,
            child: Container(
              height: SizeConfig.screenHeight * 0.25,
              width: SizeConfig.screenWidth * 0.9,
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                //color: Colors.transparent,
                boxShadow: const [standardBoxShadow],
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: AssetImage(widget.recipe.imgSrc!),
                // ),
              ),
              child: Stack(
                children: [
                  // FutureBuilder(
                  //     future: FirebaseStorageService()
                  //         .downloadURL(widget.imageName),
                  //     builder: (context, AsyncSnapshot<String> snapshot) {
                  //       if (snapshot.connectionState == ConnectionState.done &&
                  //           snapshot.hasData) {
                  //         return
                  Container(
                    height: SizeConfig.screenHeight * 0.25,
                    width: SizeConfig.screenWidth * 0.9,
                    margin: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      //color: Colors.transparent,
                      boxShadow: const [standardBoxShadow],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.recipe.imgSrc!),
                      ),
                    ),
                  ),
                  //   } else if (snapshot.connectionState ==
                  //           ConnectionState.waiting ||
                  //       !snapshot.hasData) {
                  //     return const Center(
                  //         child: CircularProgressIndicator(
                  //       color: kDarkGreen,
                  //     ));
                  //   }
                  //   return Container();
                  // }),
                ],
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.defaultSize! * 2,
            right: SizeConfig.defaultSize! * 2,
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  (widget.trailing)
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  size: SizeConfig.defaultSize! * 4,
                  color: Colors.grey[800],
                ),
              ),

              //favoritesSelection.toggleTodo(widget.recipe);
              //setState(() {
              //widget.recipe.isFavorized = !widget.recipe.isFavorized;
              //});
              //recipeProvider.isFavorized = widget.recipe.isFavorized;
              //print(recipeProvider.isFavorized);
              //if(recipeProvider.isFavorized == true) {
              //favoritesSelection.favorizedRecipes.add(widget.recipe);
              //} else if (recipeProvider.isFavorized == false) {
              //favoritesSelection.favorizedRecipes.remove(widget.recipe);
              // }
              //print(favoritesSelection.favorizedRecipes);

              //favoritesSelection.toggleTodo(widget.recipe);
              //setState(() {
              //widget.recipe.isFavorized = !widget.recipe.isFavorized;
              //if (widget.recipe.isFavorized = true) {
              //favoritesSelection.favorizedRecipes.add(widget.recipe);
              //} else if (widget.recipe.isFavorized = false) {
              //favoritesSelection.favorizedRecipes.remove(widget.recipe);

              //}

              //});
              //if (widget.recipe.isFavorized = true) {
              //favoritesSelection.favorizedRecipes = recipes.where((element) => element.isFavorized = true).toList();
              //}
              //print(widget.recipe.isFavorized);
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(widget.recipe.title!,
                      style: TextStyle(fontSize: SizeConfig.screenHeight * 0.018)),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.recipe.author!,
                    style: TextStyle(fontSize: SizeConfig.screenHeight * 0.015, color: Colors.grey)),
                const Expanded(child: SizedBox()),
                Icon(Icons.timer, size: SizeConfig.screenHeight * 0.03),
                Text(
                    "${(widget.recipe.cookingTime! + widget.recipe.preparationTime!).toString()} Min"),
                //Text("${widget.recipe.calories.toString()}  | Kalorien"),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
