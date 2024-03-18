import 'package:ecovia/EnvironmentScreen/environment_categorie_selection.dart';
import 'package:ecovia/EnvironmentScreen/graph_article.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:provider/provider.dart';

class EnvironmentCategories extends StatefulWidget {
  EnvironmentCategories({Key? key}) : super(key: key);

  final List<String> environmentCategories = [
    "Alle",
    "Umweltauswirkungen",
    "Gesundheit"
  ];
  @override
  State<EnvironmentCategories> createState() => _EnvironmentCategoriesState();
}

class _EnvironmentCategoriesState extends State<EnvironmentCategories> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.defaultSize! * 2,
      ),
      child: SizedBox(
        height: SizeConfig.defaultSize! * 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.environmentCategories.length,
          itemBuilder: (context, index) => buildCategoriItem(index),
        ),
      ),
    );
  }

  Widget buildCategoriItem(int index) {
    var categorieSelection =
        Provider.of<EnvironmentCategorieSelection>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
          categorieSelection.selectedCategorie = index;
        });
        setState(() {
          (index) => categorieSelection.selectedCategorie = index;
          if (index == 0) {
            categorieSelection.selectedGraphArticles = allGraphArticles;
          } else {
            categorieSelection.selectedGraphArticles = allGraphArticles
                .where((element) => element.categories.contains(index))
                .toList();
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize! * 2,
          vertical: SizeConfig.defaultSize! * 0.5,
        ),
        decoration: BoxDecoration(
          color: kDarkGreen,
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultSize! * 1.6,
          ),
        ),
        child: Text(
          widget.environmentCategories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectIndex == index ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
