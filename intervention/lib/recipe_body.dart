import 'package:ecovia/IngredientsScreen/diet_change_screen.dart';
import 'package:ecovia/RecipeScreen/recipe_search_screen.dart';
import 'package:ecovia/RecipeScreen/recipe_suggestion_screen.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:ecovia/recipes.dart';
import 'package:ecovia/showcase_labels_list.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/size_config.dart';
import 'package:showcaseview/showcaseview.dart';

class RecipeBody extends StatefulWidget {
  const RecipeBody({Key? key}) : super(key: key);

  @override
  State<RecipeBody> createState() => _RecipeBodyState();
}

class _RecipeBodyState extends State<RecipeBody>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final stateContainer = StateContainer.of(context);
    super.build(context);
    return StreamBuilder<List<Recipe>>(
        //stream: FirebaseApi.readRecipes(recipe),
        builder: (context, snapshot) {
      return Container(
        color: Colors.transparent,
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.defaultSize! * 0.5),
              TabBar(
                controller: stateContainer.recipesTabController,
                tabs: [
                  Showcase(
                    key: stateContainer.recipesKeyOne,
                    description: showCaseLabels[13],
                    targetBorderRadius: BorderRadius.circular(16),
                    targetPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    tooltipBorderRadius: BorderRadius.circular(16),
                    tooltipPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    // shapeBorder: const CircleBorder(),
                    // overlayPadding:
                    //     const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Tab(
                      //text: "Vorschläge".toUpperCase(),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Vorschläge".toUpperCase()),
                      ),
                    ),
                  ),
                  Showcase(
                    key: stateContainer.recipesKeyFour,
                    description: showCaseLabels[16],
                    targetBorderRadius: BorderRadius.circular(16),
                    tooltipBorderRadius: BorderRadius.circular(16),
                    targetPadding: const EdgeInsets.all(8),
                    tooltipPadding: const EdgeInsets.all(8),
                    //shapeBorder: const CircleBorder(),
                    //overlayPadding:
                    //    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Tab(
                      //text: "Rezepte".toUpperCase(),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Rezepte".toUpperCase()),
                      ),
                    ),
                  ),
                  Showcase(
                    key: stateContainer.recipesKeyFive,
                    description: showCaseLabels[17],
                    targetBorderRadius: BorderRadius.circular(16),
                    tooltipBorderRadius: BorderRadius.circular(16),
                    targetPadding: const EdgeInsets.all(8),
                    tooltipPadding: const EdgeInsets.all(8),
                    // shapeBorder: const CircleBorder(),
                    // overlayPadding:
                    //     const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Tab(
                      //text: "Zutaten".toUpperCase(),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Zutaten".toUpperCase()),
                      ),
                    ),
                  )
                ],
                labelColor: Colors.black,
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2),
                    insets: EdgeInsets.symmetric(horizontal: 10)),
                unselectedLabelColor: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: TabBarView(
                  controller: stateContainer.recipesTabController,
                  children: const [
                    RecipeSuggestionScreen(),
                    RecipeSearchScreen(),
                    DietchangeScreen()
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
