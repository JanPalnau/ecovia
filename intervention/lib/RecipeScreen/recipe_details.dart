import 'package:ecovia/recipes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ecovia/size_config.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({Key? key, required this.recipe, required this.tag}) : super(key: key);
  final Recipe recipe;
  final String tag;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SlidingUpPanel(
        backdropEnabled: true,
        minHeight: SizeConfig.defaultSize! * 55,
        maxHeight: SizeConfig.defaultSize! * 70,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: tag,
                  child: Image(
                    height: SizeConfig.defaultSize! * 55,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(recipe.imgSrc!),
                  ),
                ),
              ),
              //Positioned(
                //top: SizeConfig.defaultSize * 4,
                //right: SizeConfig.defaultSize * 4,
                //child: InkWell(
                  //child: Icon(
                    //Icons.bookmark_border,
                    //color: Colors.white,
                    //size: SizeConfig.defaultSize * 4,
                  //),
                //),
              //),
              Positioned(
                top: SizeConfig.defaultSize! * 5,
                left: SizeConfig.defaultSize! * 4,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    shadows: const <Shadow> [Shadow(color: Colors.black, blurRadius: 15.0)],
                    color: Colors.white,
                    size: SizeConfig.defaultSize! * 4,
                  ),
                ),
              ),
            ],
          ),
        ),
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),
              Text(recipe.title!, style: textTheme.titleLarge),
              const SizedBox(height: 10),
              Text(recipe.author!, style: textTheme.bodySmall),
              const SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.timer,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(children: [
                      Text(
                          "${recipe.preparationTime.toString()} Min Vorbereitung"),
                    ]),
                    Row(children: [
                      Text("${recipe.cookingTime.toString()} Min Zubereitung"),
                    ]),
                  ]),
                  const SizedBox(width: 30),
                  Container(
                    color: Colors.black,
                    height: 50,
                    width: 2,
                  ),
                  const SizedBox(width: 30),
                  Text("${recipe.servings.toString()} Portionen"),
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                color: Colors.black.withOpacity(0.4),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                          labelColor: Colors.black,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(width: 2),
                              insets: EdgeInsets.symmetric(horizontal: 30)),
                          unselectedLabelColor: Colors.black.withOpacity(0.3),
                          tabs: [
                            Tab(
                              text: "Zutaten".toUpperCase(),
                            ),
                            Tab(
                              text: "Zubereitung".toUpperCase(),
                            )
                          ]),
                      const SizedBox(height: 10),
                      Divider(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          RecipeIngredients(recipe: recipe),
                          RecipeInstructions(recipe: recipe),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({
    Key? key,
    this.recipe,
  }) : super(key: key);
  final Recipe? recipe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      child: Column(
        children: [
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(0, 0, 0, SizeConfig.defaultSize! * 20),
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  //'• ' + 
                  recipe!.ingredients![index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                );
              },
              itemCount: recipe!.ingredients!.length)
        ],
      ),
    );
  }
}

class RecipeInstructions extends StatelessWidget {
  const RecipeInstructions({
    Key? key,
    this.recipe,
  }) : super(key: key);
  final Recipe? recipe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(0, 0, 0, SizeConfig.defaultSize! * 20),
              itemBuilder: (BuildContext context, int index) {
                return Text(recipe!.instructions![index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                );
              },
              itemCount: recipe!.instructions!.length)
        ],
      ),
    );
  }
}
