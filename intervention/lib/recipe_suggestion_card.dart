import 'package:flutter/material.dart';
import 'package:ecovia/size_config.dart';
import 'package:ecovia/recipes.dart';

class RecipeSuggestionCard extends StatefulWidget {
  const RecipeSuggestionCard(
      {Key? key, this.recipes, this.press, this.onTap, this.trailing})
      : super(key: key);
  final Recipe? recipes;
  final void Function()? press;
  final dynamic onTap;
  final dynamic trailing;
  final bool recipeSaved = false;

  @override
  State<RecipeSuggestionCard> createState() => _RecipeSuggestionCardState();
}

class _RecipeSuggestionCardState extends State<RecipeSuggestionCard> {
  @override
  Widget build(BuildContext context) {
    //var recipeProvider = Provider.of<Recipe>(context);
    //final favoritesSelection = Provider.of<FavoritesSelection>(context);
    double defaultSize = SizeConfig.defaultSize!;
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        decoration: BoxDecoration(
            color: widget.recipes!.color,
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1.8)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      widget.recipes!.title!,
                      style: TextStyle(
                        fontSize: SizeConfig.defaultSize! * 2.2,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: defaultSize * 0.5,
                    ),
                    // Text(
                    //   widget.recipes!.description!,
                    //   style: TextStyle(
                    //     fontSize: SizeConfig.defaultSize! * 1.5,
                    //     color: Colors.white,
                    //   ),
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 4,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: SizeConfig.defaultSize! * 2,
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Icon(
                      (widget.trailing)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      size: SizeConfig.defaultSize! * 4,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 20,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: SizeConfig.defaultSize! * 2,
                        ),
                        child: Image(
                          height: SizeConfig.defaultSize! * 35,
                          width: SizeConfig.defaultSize! * 35,
                          fit: BoxFit.cover,
                          image: AssetImage(widget.recipes!.imgSrc!),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
