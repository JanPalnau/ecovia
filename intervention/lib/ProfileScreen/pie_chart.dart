import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'pie_chart_color_extension.dart';

class FlPieChart extends StatefulWidget {
  final double? meatValue, fishValue, dairyAndEggsValue, fruitsAndVeggiesValue;
  const FlPieChart({Key? key, required this.meatValue, this.fishValue, this.dairyAndEggsValue, this.fruitsAndVeggiesValue}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FlPieChartState();
}

class FlPieChartState extends State<FlPieChart> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.2,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        }),
                        startDegreeOffset: 180,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 1,
                        centerSpaceRadius: 0,
                        sections: getshowingSections(widget.meatValue, widget.fishValue, widget.dairyAndEggsValue, widget.fruitsAndVeggiesValue)),
                  ),
                ),
                const SizedBox(width: 20,),
                // SizedBox(
                //   height: SizeConfig.defaultSize! * 20,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       SizedBox(
                //         height: SizeConfig.defaultSize! * 4.5,
                //       ),
                //       Indicator(
                //         color: const Color.fromARGB(255, 136, 31, 23),
                //         text: 'Fleisch',
                //         isSquare: false,
                //         size: touchedIndex == 0 ? 12 : 10,
                //         textColor:
                //             touchedIndex == 0 ? Colors.black : Colors.grey,
                //       ),
                //       Indicator(
                //         color: const Color.fromARGB(255, 227, 138, 5),
                //         text: 'Fisch',
                //         isSquare: false,
                //         size: touchedIndex == 1 ? 12 : 10,
                //         textColor:
                //             touchedIndex == 1 ? Colors.black : Colors.grey,
                //       ),
                //       Indicator(
                //         color: const Color.fromARGB(255, 255, 208, 0),
                //         text: 'Eier & Milchprodukte',
                //         isSquare: false,
                //         size: touchedIndex == 2 ? 12 : 10,
                //         textColor:
                //             touchedIndex == 2 ? Colors.black : Colors.grey,
                //       ),
                //       Indicator(
                //         color: kLightGreen,
                //         text: 'Obst & Gemüse',
                //         isSquare: false,
                //         size: touchedIndex == 3 ? 12 : 10,
                //         textColor:
                //             touchedIndex == 3 ? Colors.black : Colors.grey,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> getshowingSections(meatValue, fishValue, dairyAndEggsValue, fruitsAndVeggiesValue) {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;

        const color0 = Color.fromARGB(255, 136, 31, 23);
        const color1 = Color.fromARGB(255, 227, 138, 5);
        const color2 = Color.fromARGB(255, 255, 208, 0);
        const color3 = kLightGreen;
        double valueSum = meatValue + fishValue + dairyAndEggsValue + fruitsAndVeggiesValue;
        switch (i) {
          case 0:
            return PieChartSectionData(
              badgeWidget: BadgeWidget(color: color0, opacity: opacity, valueSum: valueSum, value: meatValue,),
              badgePositionPercentageOffset: 1.3,
              color: color0.withOpacity(opacity),
              value: meatValue,
              title: (meatValue/valueSum).toStringAsFixed(2),
              radius: 70,
              showTitle: false,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color0),
              titlePositionPercentageOffset: 1.3,
              borderSide: isTouched
                  ? BorderSide(color: color0.darken(40), width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              badgeWidget: BadgeWidget(color: color1, opacity: opacity, valueSum: valueSum, value: fishValue,),
              badgePositionPercentageOffset: 1.3,
              color: color1.withOpacity(opacity),
              value: fishValue,
              showTitle: false,
              title: (fishValue/valueSum).toStringAsFixed(2),
              radius: 70,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color1),
              titlePositionPercentageOffset: 1.3,
              borderSide: isTouched
                  ? BorderSide(color: color1.darken(40), width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              badgeWidget: BadgeWidget(color: color2, opacity: opacity, valueSum: valueSum, value: dairyAndEggsValue,),
              badgePositionPercentageOffset: 1.3,
              color: color2.withOpacity(opacity),
              value: dairyAndEggsValue,
              title: (dairyAndEggsValue/valueSum).toStringAsFixed(2),
              radius: 70,
              showTitle: false,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4c3788)),
              titlePositionPercentageOffset: 1.3,
              borderSide: isTouched
                  ? BorderSide(color: color2.darken(40), width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
               badgeWidget: BadgeWidget(color: color3, opacity: opacity, valueSum: valueSum, value: fruitsAndVeggiesValue,),
               badgePositionPercentageOffset: 1.3,
              color: color3.withOpacity(opacity),
              value: fruitsAndVeggiesValue,
              showTitle: false,
              title: (fruitsAndVeggiesValue/valueSum).toStringAsFixed(2),
              radius: 70,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0c7f55)),
              titlePositionPercentageOffset: 1.3,
              borderSide: isTouched
                  ? BorderSide(color: color3.darken(40), width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
    required this.color,
    required this.opacity,
    required this.valueSum,
    required this.value
  }) : super(key: key);

  final Color color;
  final double opacity;
  final double valueSum, value;

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white), child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Text('${(value/valueSum * 100).toStringAsFixed(1)}%', style: const TextStyle(color: kDarkGreen, fontSize: 14),),
    ));
  }
}
