import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecovia/ProfileScreen/pie_chart.dart';
import 'package:ecovia/RecipeScreen/animated_gradient_box.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';

class StatBoxWithPie extends StatefulWidget {
  const StatBoxWithPie(
      {Key? key,
      this.statCategorieOne,
      this.statCategorieTwo,
      this.meatLabel,
      this.fishLabel,
      this.dairyAndEggsLabel,
      this.fruitsAndVeggiesLabel,
      this.userStatMeatKG,
      this.userStatFishKG,
      this.userStatDairyAndEggsKG,
      this.userStatMeatCO2,
      this.userStatFishCO2,
      this.userStatDairyAndEggsCO2,
      this.userStatFruitsAndVeggiesKG,
      this.userStatFruitsAndVeggiesCO2,
      this.statSummary,
      this.userStatSummary,
      this.color,
      required this.isSelected,
      required this.onPressed,
      required this.summaryVisible,
      required this.gradient, this.summaryPlaceholderText, this.dateText, required this.dataIsEmpty})
      : super(key: key);

  final String? statCategorieOne,
      statCategorieTwo,
      meatLabel,
      fishLabel,
      dairyAndEggsLabel,
      fruitsAndVeggiesLabel,
      statSummary,
      userStatSummary,
      summaryPlaceholderText,
      dateText;
  final double? userStatMeatKG,
      userStatFishKG,
      userStatDairyAndEggsKG,
      userStatFruitsAndVeggiesKG,
      userStatMeatCO2,
      userStatFishCO2,
      userStatDairyAndEggsCO2,
      userStatFruitsAndVeggiesCO2;
  final List<bool> isSelected;
  final dynamic onPressed;
  final bool summaryVisible, dataIsEmpty;
  final LinearGradient gradient;

  final Color? color;

  @override
  State<StatBoxWithPie> createState() => _StatBoxWithPieState();
}


class _StatBoxWithPieState extends State<StatBoxWithPie> {
  @override
  Widget build(BuildContext context) {
    // Map<String, double> _dataMap = {
    //   'Fleisch': widget.userStatMeatKG!,
    //   'Fisch': widget.userStatFishKG!,
    //   'Milchprodukte\n& Eier': widget.userStatDairyAndEggsKG!,
    //   'Obst\n& Gemüse': widget.userStatFruitsAndVeggiesKG!
    // };
    return Container(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.01, horizontal: SizeConfig.screenWidth * 0.02),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.01, horizontal: SizeConfig.screenWidth * 0.02),
      //height: SizeConfig.screenHeight * 0.45,
      //width: SizeConfig.defaultSize! * 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          //border: Border.all(color: kDarkGreen, width: 2.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(104, 0, 0, 0),
              blurRadius: 7.0,
              spreadRadius: 0.0,
              offset: Offset(0, 0), // shadow direction: bottom right
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider(height: 3, thickness: 3,),
          Center(child: Text(widget.dateText!, style: TextStyle(fontSize: SizeConfig.screenHeight * 0.02, fontWeight: FontWeight.bold),)),
          Flexible(
            flex: 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: widget.isSelected[0]? Text(
                    widget.statCategorieOne!,
                    style:
                        TextStyle(fontSize: SizeConfig.defaultSize! * 2, fontWeight: FontWeight.bold, color: kDarkGreen),
                  ) : Text(
                    widget.statCategorieTwo!,
                    style:
                        TextStyle(fontSize: SizeConfig.defaultSize! * 2, fontWeight: FontWeight.bold, color: kDarkGreen),
                  )
                ),
                ToggleButtons(
                  isSelected: widget.isSelected,
                  onPressed: widget.onPressed,
                  color: kDarkGreen,
                  focusColor: kNeonGreen,
                  hoverColor: kNeonGreen,
                  highlightColor: kNeonGreen,
                  selectedColor: Colors.white,
                  fillColor: kDarkGreen,
                  borderRadius: BorderRadius.circular(16),
                  splashColor: kNeonGreen,
                  borderWidth: 2,
                  children: const [Text('CO₂'), Text('kg')],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.05, top: SizeConfig.screenHeight * 0.05),
            child: widget.dataIsEmpty? Text("Keine Kohlenstoffemissionen in den aufgeführten Lebensmittelkategorien", style: TextStyle(color: kDarkGreen, fontSize: SizeConfig.screenHeight * 0.02), textAlign: TextAlign.center,) : FlPieChart(
                meatValue: widget.userStatMeatKG,
                fishValue: widget.userStatFishKG,
                dairyAndEggsValue: widget.userStatDairyAndEggsKG,
                fruitsAndVeggiesValue: widget.userStatFruitsAndVeggiesKG),
          ),
          // PieChart(
          //   dataMap: _dataMap,
          //   colorList: _colorList,
          //   chartRadius: SizeConfig.defaultSize! * 20,
          //   legendOptions: LegendOptions(
          //     legendPosition: LegendPosition.right,
          //     showLegendsInRow: false,
          //   ),
          //   chartValuesOptions: ChartValuesOptions(
          //       showChartValuesOutside: true,
          //       showChartValueBackground: false,
          //       chartValueStyle: TextStyle(
          //           color: kDarkGreen, fontWeight: FontWeight.bold)),
          // ),
          // SizedBox(
          //   height: SizeConfig.defaultSize! * 2,
          // ),
          // Row(
          //   children: [
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              //   child: Text(
              //     widget.statCategorieTwo!,
              //     style:
              //         TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              // ),
              const Divider(
                height: 3,
                thickness: 2,
                //color: kDarkGreen,
              ),
              //const SizedBox(height: 10,),
            // ],
          // ),
          Flexible(
            flex: 12,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      widget.meatLabel!,
                      style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 136, 31, 23), fontSize: SizeConfig.defaultSize! * 1.7),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      '${widget.userStatMeatCO2!.toStringAsFixed(2)} kg',
                      style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.7),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      widget.fishLabel!,
                      style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 227, 138, 5), fontSize: SizeConfig.defaultSize! * 1.7),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      '${widget.userStatFishCO2!.toStringAsFixed(2)} kg',
                      style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.7),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      widget.dairyAndEggsLabel!,
                      style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 208, 0), fontSize: SizeConfig.defaultSize! * 1.7),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      '${widget.userStatDairyAndEggsCO2!.toStringAsFixed(2)} kg',
                      style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.7),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      widget.fruitsAndVeggiesLabel!,
                      style: TextStyle(fontWeight: FontWeight.bold, color: kLightGreen, fontSize: SizeConfig.defaultSize! * 1.7),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      '${widget.userStatFruitsAndVeggiesCO2!.toStringAsFixed(2)} kg',
                      style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.7),
                    ),
                  ),
                ],
              ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 3,
            thickness: 3,
          ),
          const Expanded(child: SizedBox()),
          Flexible(
            flex: 8,
            child: AnimatedGradientBox(
              boxShadowList: const [],
              child: widget.summaryVisible? Padding(
                padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.01, horizontal: SizeConfig.screenWidth * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Text(
                        widget.statSummary!,
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * 1.7,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.userStatSummary!,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ) : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                        widget.summaryPlaceholderText!,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * 1.7,
                          color: Colors.white,
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
