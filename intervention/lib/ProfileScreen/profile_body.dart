import 'package:ecovia/JsonObjects/survey_answers_post_data.dart';
import 'package:ecovia/ProfileScreen/statistic_box_with_pie_chart.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/showcase_labels_list.dart';
import 'package:ecovia/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:showcaseview/showcaseview.dart';
import 'dart:core';
import 'add_foods_functions.dart';

import 'package:provider/provider.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({Key? key}) : super(key: key);

  //List lastWeek = [
  //DateTime.now(),
  //DateTime.now().subtract(Duration(days: 1)),
  //DateTime.now().subtract(Duration(days: 2)),
  //DateTime.now().subtract(Duration(days: 3)),
  //DateTime.now().subtract(Duration(days: 4)),
  //DateTime.now().subtract(Duration(days: 5)),
  //DateTime.now().subtract(Duration(days: 6)),
  //];

  //addAllMeat(var days) {
  //final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  //for (var i = 0; i < 6; i++) {
  //dateFormat.format(DateTime.now().subtract(Duration(days: i)));
  //weeklyMeat += days[i]['questionOne'] * 3 +
  //  days[i]['questionTwo'] +
  //days[i]['questionThree'];
  // return weeklyMeat;
  //}
  //}
  final List<Color> gradientColors = [const Color(0xFF02D39A), kLightGreen];

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final DateTime date = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final DateFormat dateFormatTwo = DateFormat('dd.MM.yyyy');
  //final CollectionReference emissionStats = FirebaseFirestore.instance
  //  .collection("users")
  // .doc(FirebaseAuth.instance.currentUser.uid)
  //.collection('emissionStats');
  //final Stream<QuerySnapshot> _userStreamOne = FirebaseFirestore.instance
  //  .collection("users")
  //.doc(FirebaseAuth.instance.currentUser.uid)
  //.collection('emissionStats')
  //.orderBy('date', descending: true)
  //.snapshots();
  double meatSum = 0;
  double fishSum = 0;
  double dairySum = 0;

  double? meat = 0;
  double? fish = 0;
  double? dairy = 0;
  double? fruitsAndVeggies = 0;
  double? replacementFoods = 0;
  double? drinks = 0;
  double? otherFoods = 0;

  final List<bool> _isSelectedLineChart = [true, false];
  final List<bool> _isSelectedPieChartDay = [true, false];
  final List<bool> _isSelectedPieChartWeek = [true, false];
  int _spotListsListIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final String answerDate = dateFormat.format(date);
    final container = StateContainer.of(context);
    //final String answerDate = dateFormatTwo.format(date);
    double? dailyCO2Difference = 0;
    double? weeklyCO2Difference = 0;
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(gradient: backgroundGradient()),
          child: Consumer<List<SurveyAnswersPostData>>(
              builder: (context, snapshot, child) {
            // if (snapshotOne.hasError) {
            //   return Text("Etwas ist schiefgelaufen.");
            // }
            // if (snapshotOne.connectionState == ConnectionState.waiting) {
            //   return Center(
            //     child: CircularProgressIndicator(color: kLightGreen),
            //   );
            // }
            if (snapshot.length > 1) {
              dailyCO2Difference =
                  snapshot[0].totalSafeCO2! - snapshot[1].totalSafeCO2!;
            }
            if (snapshot.length > 13) {
              weeklyCO2Difference = (snapshot[0].totalSafeCO2! +
                      snapshot[1].totalSafeCO2! +
                      snapshot[2].totalSafeCO2! +
                      snapshot[3].totalSafeCO2! +
                      snapshot[4].totalSafeCO2! +
                      snapshot[5].totalSafeCO2! +
                      snapshot[6].totalSafeCO2!) -
                  (snapshot[7].totalSafeCO2! +
                      snapshot[8].totalSafeCO2! +
                      snapshot[9].totalSafeCO2! +
                      snapshot[10].totalSafeCO2! +
                      snapshot[11].totalSafeCO2! +
                      snapshot[12].totalSafeCO2! +
                      snapshot[13].totalSafeCO2!);
            }
            bool? moreThanSixDays = snapshot.length >= 7;
            List<double?> meatListKG = [];
            List<double?> fishListKG = [];
            List<double?> dairyListKG = [];
            List<double?> fruitsAndVeggiesListKG = [];
            List<double?> replacementFoodsListKG = [];
            List<double?> drinksListKG = [];
            List<double?> otherFoodsListKG = [];

            List<double?> meatListCO2 = [];
            List<double?> fishListCO2 = [];
            List<double?> dairyListCO2 = [];
            List<double?> fruitsAndVeggiesListCO2 = [];
            List<double?> replacementFoodsListCO2 = [];
            List<double?> drinksListCO2 = [];
            List<double?> otherFoodsListCO2 = [];

            addMeat(snapshot, meatListCO2, "CO2");
            addFish(snapshot, fishListCO2, "CO2");
            addDairy(snapshot, dairyListCO2, "CO2");
            addFruitsAndVeggies(snapshot, fruitsAndVeggiesListCO2, "CO2");
            addReplacementFoods(snapshot, replacementFoodsListCO2, "CO2");
            addDrinks(snapshot, drinksListCO2, "CO2");
            addOtherFoods(snapshot, otherFoodsListCO2, "CO2");

            addMeat(snapshot, meatListKG, "KG");
            addFish(snapshot, fishListKG, "KG");
            addDairy(snapshot, dairyListKG, "KG");
            addFruitsAndVeggies(snapshot, fruitsAndVeggiesListKG, "KG");
            addReplacementFoods(snapshot, replacementFoodsListKG, "KG");
            addDrinks(snapshot, drinksListKG, "KG");
            addOtherFoods(snapshot, otherFoodsListKG, "KG");

            List<double?> weeklyMeatKG = [];
            List<double?> weeklyFishKG = [];
            List<double?> weeklyDairyKG = [];
            List<double?> weeklyFruitsAndVeggiesKG = [];
            List<double?> weeklyReplacementFoodsKG = [];
            List<double?> weeklyDrinksKG = [];
            List<double?> weeklyOtherFoodsKG = [];

            List<double?> weeklyMeatCO2 = [];
            List<double?> weeklyFishCO2 = [];
            List<double?> weeklyDairyCO2 = [];
            List<double?> weeklyFruitsAndVeggiesCO2 = [];
            List<double?> weeklyReplacementFoodsCO2 = [];
            List<double?> weeklyDrinksCO2 = [];
            List<double?> weeklyOtherFoodsCO2 = [];

            List<double?> previousWeekMeatKG = [];
            List<double?> previousWeekFishKG = [];
            List<double?> previousWeekDairyKG = [];
            List<double?> previousWeekFruitsAndVeggiesKG = [];
            List<double?> previousWeekReplacementFoodsKG = [];
            List<double?> previousWeekDrinksKG = [];
            List<double?> previousWeekOtherFoodsKG = [];

            List<double?> previousWeekMeatCO2 = [];
            List<double?> previousWeekFishCO2 = [];
            List<double?> previousWeekDairyCO2 = [];
            List<double> previousWeekFruitsAndVeggiesCO2 = [];
            List<double> previousWeekReplacementFoodsCO2 = [];
            List<double?> previousWeekDrinksCO2 = [];
            List<double?> previousWeekOtherFoodsCO2 = [];

            createThisWeekList(List<double?> newList, List<double?> oldList) {
              if (snapshot.length >= 7) {
                for (var i = 0; i < 6; i++) {
                  newList.add(oldList[i]);
                }
              }
            }

            createPreviousWeekList(
                List<double?> newList, List<double?> oldList) {
              if (snapshot.length >= 14) {
                for (var i = 7; i < 13; i++) {
                  newList.add(oldList[i]);
                }
              }
            }

            // createWeeklyListXD(List<double?> newList, List<double?> oldList,
            //     List<double?> previousList) {
            //   if (snapshot.length >= 7) {
            //     for (var i = 0; i < 6; i++) {
            //       newList.add(oldList[i]);
            //     }
            //     if (snapshot.length >= 14) {
            //       for (var i = 7; i < 13; i++) {
            //         previousList.add(oldList[i]);
            //       }
            //     }
            //   } else if (snapshot.length < 7) {
            //     for (var i = 0; i < snapshot.length; i++) {
            //       newList.add(oldList[i]);
            //       previousList.add(999);
            //     }
            //   }
            // }

            createThisWeekList(weeklyMeatKG, meatListKG);
            createThisWeekList(weeklyFishKG, fishListKG);
            createThisWeekList(weeklyDairyKG, dairyListKG);
            createThisWeekList(
                weeklyFruitsAndVeggiesKG, fruitsAndVeggiesListKG);
            createThisWeekList(
                weeklyReplacementFoodsKG, replacementFoodsListKG);
            createThisWeekList(weeklyDrinksKG, drinksListKG);
            createThisWeekList(weeklyOtherFoodsKG, otherFoodsListKG);

            createThisWeekList(weeklyMeatCO2, meatListCO2);
            createThisWeekList(weeklyFishCO2, fishListCO2);
            createThisWeekList(weeklyDairyCO2, dairyListCO2);
            createThisWeekList(
                weeklyFruitsAndVeggiesCO2, fruitsAndVeggiesListCO2);
            createThisWeekList(
                weeklyReplacementFoodsCO2, replacementFoodsListCO2);
            createThisWeekList(weeklyDrinksCO2, drinksListCO2);
            createThisWeekList(weeklyOtherFoodsCO2, otherFoodsListCO2);

            createPreviousWeekList(previousWeekMeatKG, meatListKG);
            createPreviousWeekList(previousWeekFishKG, fishListKG);
            createPreviousWeekList(previousWeekDairyKG, dairyListKG);
            createPreviousWeekList(
                previousWeekFruitsAndVeggiesKG, fruitsAndVeggiesListKG);
            createPreviousWeekList(
                previousWeekReplacementFoodsKG, replacementFoodsListKG);
            createPreviousWeekList(previousWeekDrinksKG, drinksListKG);
            createPreviousWeekList(previousWeekOtherFoodsKG, otherFoodsListKG);

            createPreviousWeekList(previousWeekMeatCO2, meatListCO2);
            createPreviousWeekList(previousWeekFishCO2, fishListCO2);
            createPreviousWeekList(previousWeekDairyCO2, dairyListCO2);
            createPreviousWeekList(
                previousWeekFruitsAndVeggiesCO2, fruitsAndVeggiesListCO2);
            createPreviousWeekList(
                previousWeekReplacementFoodsCO2, replacementFoodsListCO2);
            createPreviousWeekList(previousWeekDrinksCO2, drinksListCO2);
            createPreviousWeekList(
                previousWeekOtherFoodsCO2, otherFoodsListCO2);

            double meatSumKG = weeklyMeatKG.fold(
                0, (previousValue, element) => (previousValue + element!));
            double fishSumKG = weeklyFishKG.fold(
                0, (previousValue, element) => (previousValue + element!));
            double dairySumKG = weeklyDairyKG.fold(
                0, (previousValue, element) => (previousValue + element!));
            double fruitsAndVeggiesSumKG = weeklyFruitsAndVeggiesKG.fold(
                0, (previousValue, element) => (previousValue + element!));
            // double replacementFoodsSumKG = weeklyReplacementFoodsKG.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double drinksSumKG = weeklyDrinksKG.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double otherFoodsSumKG = weeklyOtherFoodsKG.fold(
            //     0, (previousValue, element) => (previousValue + element));

            double meatSumCO2 = weeklyMeatCO2.fold(
                0, (previousValue, element) => (previousValue + element!));
            double fishSumCO2 = weeklyFishCO2.fold(
                0, (previousValue, element) => (previousValue + element!));
            double dairySumCO2 = weeklyDairyCO2.fold(
                0, (previousValue, element) => (previousValue + element!));
            double fruitsAndVeggiesSumCO2 = weeklyFruitsAndVeggiesCO2.fold(
                0, (previousValue, element) => (previousValue + element!));
            // double replacementFoodsSumCO2 = weeklyReplacementFoodsCO2.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double drinksSumCO2 = weeklyDrinksCO2.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double otherFoodsSumCO2 = weeklyOtherFoodsCO2.fold(
            //     0, (previousValue, element) => (previousValue + element));

            // double previousMeatSumKG = previousWeekMeatKG.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double previousFishSumKG = previousWeekFishKG.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double previousDairySumKG = previousWeekDairyKG.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double previousFruitsAndVeggiesSumKG =
            //     previousWeekFruitsAndVeggiesKG.fold(0,
            //         (previousValue, element) => (previousValue + element));
            // double previousReplacementFoodsSumKG =
            //     previousWeekReplacementFoodsKG.fold(0,
            //         (previousValue, element) => (previousValue + element));
            // double previousDrinksSumKG = previousWeekDrinksKG.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double previousOtherFoodsSumKG = previousWeekOtherFoodsKG.fold(
            //     0, (previousValue, element) => (previousValue + element));

            // double previousMeatSumCO2 = previousWeekMeatCO2.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double previousFishSumCO2 = previousWeekFishCO2.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double previousDairySumCO2 = previousWeekDairyCO2.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double previousFruitsAndVeggiesSumCO2 =
            //     previousWeekFruitsAndVeggiesCO2.fold(0,
            //         (previousValue, element) => (previousValue + element));
            // double previousReplacementFoodsSumCO2 =
            //     previousWeekReplacementFoodsCO2.fold(0,
            //         (previousValue, element) => (previousValue + element));
            // double previousDrinksSumCO2 = previousWeekDrinksCO2.fold(
            //     0, (previousValue, element) => (previousValue + element));
            // double previousOtherFoodsSumCO2 =
            //     previousWeekOtherFoodsCO2.fold(0,
            //         (previousValue, element) => (previousValue + element));

            double dayOneSum = 0;
            double dayTwoSum = 0;
            double thisWeekSum = 0;
            double previousWeekSum = 0;
            List<double?> totalSumCO2List = [];
            List<double?> totalSumKGList = [];

            List<FlSpot> allFoodsCO2SpotsList = [];
            List<FlSpot> meatCO2SpotsList = [];
            List<FlSpot> fishCO2SpotsList = [];
            List<FlSpot> dairyCO2SpotsList = [];
            List<FlSpot> fruitsAndVeggiesCO2SpotsList = [];
            List<FlSpot> allFoodsKGSpotsList = [];
            List<FlSpot> meatKGSpotsList = [];
            List<FlSpot> fishKGSpotsList = [];
            List<FlSpot> dairyKGSpotsList = [];
            List<FlSpot> fruitsAndVeggiesKGSpotsList = [];

            createTotalSumCO2List(List<double?> totalSumCO2List) {
              for (var i = 0; i < snapshot.length; i++) {
                double? totalSumCO2 = snapshot[i].animalDeliCO2! +
                    snapshot[i].beefCO2! +
                    snapshot[i].porkCO2! +
                    snapshot[i].poultryCO2! +
                    snapshot[i].sausagesCO2! +
                    snapshot[i].fishCO2! +
                    snapshot[i].animalCheeseCO2! +
                    snapshot[i].butterCO2! +
                    snapshot[i].animalJogurtCO2! +
                    snapshot[i].animalMilkCO2! +
                    snapshot[i].animalCreamCO2! +
                    snapshot[i].eggsCO2! +
                    snapshot[i].fruitsCO2! +
                    snapshot[i].vegetablesCO2! +
                    snapshot[i].margarineCO2! +
                    snapshot[i].meatSubstitutesCO2! +
                    snapshot[i].plantCheeseCO2! +
                    snapshot[i].plantCreamCO2! +
                    snapshot[i].plantDeliCO2! +
                    snapshot[i].plantJogurtCO2! +
                    snapshot[i].plantMilkCO2! +
                    snapshot[i].tofuCO2! +
                    snapshot[i].legumesCO2! +
                    snapshot[i].alcDrinksCO2! +
                    snapshot[i].freeDrinksCO2! +
                    snapshot[i].teaCO2! +
                    snapshot[i].breadCO2! +
                    snapshot[i].cerealCO2! +
                    snapshot[i].nutsCO2! +
                    snapshot[i].pastaCO2! +
                    snapshot[i].potatoesCO2! +
                    snapshot[i].riceCO2! +
                    snapshot[i].saltySnacksCO2! +
                    snapshot[i].spreadCO2!;
                totalSumCO2List.add(totalSumCO2);
              }
            }

            createTotalSumKGList(List<double?> totalSumKGList) {
              for (var i = 0; i < snapshot.length; i++) {
                double? totalSumKG = snapshot[i].animalDeliKG! +
                    snapshot[i].beefKG! +
                    snapshot[i].porkKG! +
                    snapshot[i].poultryKG! +
                    snapshot[i].sausagesKG! +
                    snapshot[i].fishKG! +
                    snapshot[i].animalCheeseKG! +
                    snapshot[i].butterKG! +
                    snapshot[i].animalJogurtKG! +
                    snapshot[i].animalMilkKG! +
                    snapshot[i].animalCreamKG! +
                    snapshot[i].eggsKG! +
                    snapshot[i].fruitsKG! +
                    snapshot[i].vegetablesKG! +
                    snapshot[i].margarineKG! +
                    snapshot[i].meatSubstitutesKG! +
                    snapshot[i].plantCheeseKG! +
                    snapshot[i].plantCreamKG! +
                    snapshot[i].plantDeliKG! +
                    snapshot[i].plantJogurtKG! +
                    snapshot[i].plantMilkKG! +
                    snapshot[i].tofuKG! +
                    snapshot[i].legumesKG! +
                    snapshot[i].alcDrinksKG! +
                    snapshot[i].freeDrinksKG! +
                    snapshot[i].teaKG! +
                    snapshot[i].breadKG! +
                    snapshot[i].cerealKG! +
                    snapshot[i].nutsKG! +
                    snapshot[i].pastaKG! +
                    snapshot[i].potatoesKG! +
                    snapshot[i].riceKG! +
                    snapshot[i].saltySnacksKG! +
                    snapshot[i].spreadKG!;
                totalSumKGList.add(totalSumKG);
              }
            }

            createTotalSumCO2List(totalSumCO2List);
            createTotalSumKGList(totalSumKGList);

            createSpotsList() {
              for (var i = 0; i < snapshot.length; i++) {
                allFoodsCO2SpotsList.add(FlSpot(
                    (i).toDouble(), List.from(totalSumCO2List.reversed)[i]!));
                meatCO2SpotsList.add(FlSpot(
                    (i).toDouble(), List.from(meatListCO2.reversed)[i]!));
                fishCO2SpotsList.add(FlSpot(
                    (i).toDouble(), List.from(fishListCO2.reversed)[i]!));
                dairyCO2SpotsList.add(FlSpot(
                    (i).toDouble(), List.from(dairyListCO2.reversed)[i]!));
                fruitsAndVeggiesCO2SpotsList.add(FlSpot((i).toDouble(),
                    List.from(fruitsAndVeggiesListCO2.reversed)[i]!));
                allFoodsKGSpotsList.add(FlSpot(
                    (i).toDouble(), List.from(totalSumKGList.reversed)[i]!));
                meatKGSpotsList.add(
                    FlSpot((i).toDouble(), List.from(meatListKG.reversed)[i]!));
                fishKGSpotsList.add(
                    FlSpot((i).toDouble(), List.from(fishListKG.reversed)[i]!));
                dairyKGSpotsList.add(FlSpot(
                    (i).toDouble(), List.from(dairyListKG.reversed)[i]!));
                fruitsAndVeggiesKGSpotsList
                    .add(FlSpot((i).toDouble(), fruitsAndVeggiesListKG[i]!));
              }
            }

            createSpotsList();

            List<List<FlSpot>> co2SpotsListsList = [
              [],
              meatCO2SpotsList,
              fishCO2SpotsList,
              dairyCO2SpotsList,
              fruitsAndVeggiesCO2SpotsList
            ];
            List<List<FlSpot>> kgSpotsListsList = [
              [],
              meatKGSpotsList,
              fishKGSpotsList,
              dairyKGSpotsList,
              fruitsAndVeggiesKGSpotsList
            ];

            List<FlSpot> allFoodsSpotsList = [];
            List<List<FlSpot>> spotsListsList = [];
            List<double?> totalSumList = [];

            if (_isSelectedLineChart[0] == true) {
              allFoodsSpotsList = allFoodsCO2SpotsList;
              spotsListsList = co2SpotsListsList;
              totalSumList = totalSumCO2List;
            } else if (_isSelectedLineChart[0] == false) {
              allFoodsSpotsList = allFoodsKGSpotsList;
              spotsListsList = kgSpotsListsList;
              totalSumList = totalSumKGList;
            }

            // List<double> reversedTotalSumList =
            //     List.from(totalSumCO2List.reversed);

            //createSpotsList(reversedTotalSumList);

            // if (snapshot.length < 2) {
            //   // double dayOneSum = 0;
            //   // double dayTwoSum = 0;
            //   // double thisWeekSum = 0;
            //   // double previousWeekSum = 0;
            // } else if (snapshot.length >= 2) {
            //   if (snapshot.length < 7) {
            //     // double dayOneSum = meatListCO2[0] +
            //     //     fishListCO2[0] +
            //     //     dairyListCO2[0] +
            //     //     fruitsAndVeggiesListCO2[0] +
            //     //     replacementFoodsListCO2[0] +
            //     //     drinksListCO2[0] +
            //     //     otherFoodsListCO2[0];
            //     // double dayTwoSum = (meatListCO2[1] +
            //     //     fishListCO2[1] +
            //     //     dairyListCO2[1] +
            //     //     fruitsAndVeggiesListCO2[1] +
            //     //     replacementFoodsListCO2[1] +
            //     //     drinksListCO2[1]);
            //   } else if (snapshot.length >= 7) {
            //     if (snapshot.length >= 14) {
            //       // double dayOneSum = meatListCO2[0] +
            //       //     fishListCO2[0] +
            //       //     dairyListCO2[0] +
            //       //     fruitsAndVeggiesListCO2[0] +
            //       //     replacementFoodsListCO2[0] +
            //       //     drinksListCO2[0] +
            //       //     otherFoodsListCO2[0];
            //       // double dayTwoSum = (meatListCO2[1] +
            //       //     fishListCO2[1] +
            //       //     dairyListCO2[1] +
            //       //     fruitsAndVeggiesListCO2[1] +
            //       //     replacementFoodsListCO2[1] +
            //       //     drinksListCO2[1]);
            //       // double thisWeekSum = meatSumCO2 +
            //       //     fishSumCO2 +
            //       //     dairySumCO2 +
            //       //     fruitsAndVeggiesSumCO2 +
            //       //     replacementFoodsSumCO2 +
            //       //     drinksSumCO2 +
            //       //     otherFoodsSumCO2;
            //       // double previousWeekSum = previousMeatSumCO2 +
            //       //     previousFishSumCO2 +
            //       //     previousDairySumCO2 +
            //       //     previousFruitsAndVeggiesSumCO2 +
            //       //     previousReplacementFoodsSumCO2 +
            //       //     previousDrinksSumCO2 +
            //       //     previousOtherFoodsSumCO2;
            //     } else {
            //       // double dayOneSum = meatListCO2[0] +
            //       //     fishListCO2[0] +
            //       //     dairyListCO2[0] +
            //       //     fruitsAndVeggiesListCO2[0] +
            //       //     replacementFoodsListCO2[0] +
            //       //     drinksListCO2[0] +
            //       //     otherFoodsListCO2[0];
            //       // double dayTwoSum = (meatListCO2[1] +
            //       //     fishListCO2[1] +
            //       //     dairyListCO2[1] +
            //       //     fruitsAndVeggiesListCO2[1] +
            //       //     replacementFoodsListCO2[1] +
            //       //     drinksListCO2[1]);
            //       // double thisWeekSum = meatSumCO2 +
            //       //     fishSumCO2 +
            //       //     dairySumCO2 +
            //       //     fruitsAndVeggiesSumCO2 +
            //       //     replacementFoodsSumCO2 +
            //       //     drinksSumCO2 +
            //       //     otherFoodsSumCO2;
            //     }
            //  }
            // }
            //EmissionData emissionData = EmissionData.fromJson(days[0] as dynamic);
            //print(emissionData);
            if (snapshot.isEmpty) {
              return Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.5),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        padding: const EdgeInsets.all(15.0),
                        width: SizeConfig.defaultSize! * 75,
                        child: Text(
                            "Sobald du am Ernährungsprotokoll teilgenommen hast, wird dir hier dein geschätzer CO2-Verbrauch angezeigt!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: SizeConfig.screenHeight * 0.025,
                                color: kDarkGreen)),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (snapshot.isNotEmpty) {
              return DefaultTabController(
                length: 3,
                child: FutureBuilder(
                    future: Future.delayed(Duration.zero),
                    builder: (context, async) {
                      return Column(children: [
                        Expanded(
                          child: PageView(
                              onPageChanged: (index) {
                                DefaultTabController.of(context).index = index;
                              },
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // SizedBox(
                                    //   height: SizeConfig.defaultSize! * 1,
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     const Text("Tagesstatistik",
                                    //         textAlign: TextAlign.center,
                                    //         style: TextStyle(
                                    //             fontWeight: FontWeight.bold,
                                    //             //fontSize: 18
                                    //             )),
                                    //     Text("($answerDate)",
                                    //         textAlign: TextAlign.center,
                                    //         style: const TextStyle(
                                    //             fontWeight: FontWeight.bold,
                                    //             //fontSize: 16
                                    //             )),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: SizeConfig.defaultSize! * 1,
                                    // ),
                                    //const Flexible(flex: 1, child: SizedBox()),

                                    Expanded(
                                      //flex: 8,
                                      child: StatBoxWithPie(
                                        dataIsEmpty: (meatListKG[0]! +
                                                fishListKG[0]! +
                                                dairyListKG[0]! +
                                                fruitsAndVeggiesListKG[0]!) ==
                                            0,
                                        dateText:
                                            "Tagesstatistik (${dateFormatTwo.format(dateFormat.parse(snapshot[0].date!))})",
                                        summaryPlaceholderText:
                                            "Tagesvergleich morgen verfügbar",
                                        gradient: snapshot.length < 2
                                            ? flashyRedGradient
                                            : flashyGradient,
                                        summaryVisible: snapshot.length > 1,
                                        onPressed: (int index) {
                                          setState(() {
                                            if (index == 0) {
                                              _isSelectedPieChartDay[0] = true;
                                              _isSelectedPieChartDay[1] = false;
                                            } else if (index == 1) {
                                              _isSelectedPieChartDay[1] = true;
                                              _isSelectedPieChartDay[0] = false;
                                            }
                                          });
                                        },
                                        isSelected: _isSelectedPieChartDay,
                                        statCategorieOne: "Emissionen (kg CO₂)",
                                        statCategorieTwo:
                                            "Verzehrte Produkte (kg)",
                                        meatLabel: "Fleisch:",
                                        fishLabel: "Fisch:",
                                        dairyAndEggsLabel:
                                            "Milchprodukte und Eier:",
                                        fruitsAndVeggiesLabel:
                                            "Obst und Gemüse:",
                                        userStatMeatKG:
                                            _isSelectedPieChartDay[0]
                                                ? meatListCO2[0]!
                                                : meatListKG[0],
                                        userStatFishKG:
                                            _isSelectedPieChartDay[0]
                                                ? fishListCO2[0]!
                                                : fishListKG[0],
                                        userStatDairyAndEggsKG: dairyListKG[0]!,
                                        userStatMeatCO2:
                                            _isSelectedPieChartDay[0]
                                                ? meatListCO2[0]!
                                                : meatListKG[0],
                                        userStatFishCO2:
                                            _isSelectedPieChartDay[0]
                                                ? fishListCO2[0]!
                                                : fishListKG[0],
                                        userStatDairyAndEggsCO2:
                                            _isSelectedPieChartDay[0]
                                                ? dairyListCO2[0]!
                                                : dairyListKG[0],
                                        userStatFruitsAndVeggiesKG:
                                            _isSelectedPieChartDay[0]
                                                ? fruitsAndVeggiesListCO2[0]!
                                                : fruitsAndVeggiesListKG[0],
                                        userStatFruitsAndVeggiesCO2:
                                            _isSelectedPieChartDay[0]
                                                ? fruitsAndVeggiesListCO2[0]!
                                                : fruitsAndVeggiesListKG[0],
                                        statSummary: dayOneSum > dayTwoSum
                                            ? "Zusätzliche CO₂-Emissionen\n (Vergleich zum Vortag):"
                                            : "Eingesparte CO₂-Emissionen\n(Vergleich zum Vortag):",
                                        userStatSummary: snapshot.length < 2
                                            ? "0 kg"
                                            : "${((dailyCO2Difference!)).toStringAsFixed(2)} kg",
                                        //-
                                        //(days[1]['animalMilk'] +
                                        //days[1]['animalMilk'] +
                                        //days[1]['animalMilk']))
                                        //.abs()
                                        //.toString() +
                                        //" kg",
                                        color: dayOneSum > dayTwoSum
                                            ? Colors.red
                                            : kDarkGreen,
                                      ),
                                    ),
                                    // StatBoxTwo(
                                    //   statCategorieOne:
                                    //       "Verzehrte Produkte",
                                    //   statCategorieTwo:
                                    //       "Verursachte Emissionen (kg CO2)",
                                    //   statTypeOne: "Fleisch:",
                                    //   statTypeTwo: "Fisch:",
                                    //   statTypeThree:
                                    //       "Milchprodukte und Eier:",
                                    //   statTypeFour: "Obst und Gemüse:",
                                    //   userStatOne: meatListKG[0]!
                                    //           .toStringAsFixed(2) +
                                    //       " kg",
                                    //   userStatTwo: fishListKG[0]!
                                    //           .toStringAsFixed(2) +
                                    //       " kg",
                                    //   userStatThree: dairyListKG[0]!
                                    //           .toStringAsFixed(2) +
                                    //       " kg",
                                    //   userStatFour: meatListCO2[0]!
                                    //           .toStringAsFixed(2) +
                                    //       " kg",
                                    //   userStatFive: fishListCO2[0]!
                                    //           .toStringAsFixed(2) +
                                    //       " kg",
                                    //   userStatSix: dairyListCO2[0]!
                                    //           .toStringAsFixed(2) +
                                    //       " kg",
                                    //   userStatSeven:
                                    //       fruitsAndVeggiesListKG[0]!
                                    //               .toStringAsFixed(2) +
                                    //           " kg",
                                    //   userStatEight:
                                    //       fruitsAndVeggiesListCO2[0]!
                                    //               .toStringAsFixed(2) +
                                    //           " kg",
                                    //   statSummary: dayOneSum > dayTwoSum
                                    //       ? "Zusätzliche CO2-Emissionen\n (Vergleich zum Vortag):"
                                    //       : "Eingesparte CO2-Emissionen\n(Vergleich zum Vortag):",
                                    //   userStatSummary: snapshot.length == 1
                                    //       ? "0 kg"
                                    //       : ((dayOneSum) - (dayTwoSum))
                                    //               .toStringAsFixed(0) +
                                    //           " kg",
                                    //   //-
                                    //   //(days[1]['animalMilk'] +
                                    //   //days[1]['animalMilk'] +
                                    //   //days[1]['animalMilk']))
                                    //   //.abs()
                                    //   //.toString() +
                                    //   //" kg",
                                    //   color: dayOneSum > dayTwoSum
                                    //       ? Colors.red
                                    //       : kDarkGreen,
                                    // ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    moreThanSixDays
                                        ? Container()
                                        //     ? Column(
                                        //         children: [
                                        //           Text("Wochenstatistik",
                                        //               textAlign: TextAlign.center,
                                        //               style: TextStyle(
                                        //                   fontWeight:
                                        //                       FontWeight.bold,
                                        //                   fontSize: SizeConfig.defaultSize! * 2)),
                                        //           Text(
                                        //               "(${dateFormatTwo.format(DateTime.parse(snapshot[6].date!))} - $answerDate)",
                                        //               textAlign: TextAlign.center,
                                        //               style: TextStyle(
                                        //                   fontWeight:
                                        //                       FontWeight.bold,
                                        //                   fontSize: SizeConfig.defaultSize! * 1.5
                                        //                   ))
                                        //         ],
                                        //       )
                                        : Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Wochenstatistik",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: SizeConfig
                                                                .screenHeight *
                                                            0.025)),
                                                Text(
                                                    snapshot.length > 5
                                                        ? "in ${7 - snapshot.length} Tag verfügbar"
                                                        : "in ${7 - snapshot.length} Tagen verfügbar",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: SizeConfig
                                                                .screenHeight *
                                                            0.02)),
                                              ],
                                            ),
                                          ),
                                    moreThanSixDays? Expanded(
                                      child: Visibility(
                                        visible: moreThanSixDays,
                                        child: StatBoxWithPie(
                                          dataIsEmpty: (snapshot[0]
                                                      .totalSafeCO2! +
                                                  snapshot[1].totalSafeCO2! +
                                                  snapshot[2].totalSafeCO2! +
                                                  snapshot[3].totalSafeCO2! +
                                                  snapshot[4].totalSafeCO2! +
                                                  snapshot[5].totalSafeCO2! +
                                                  snapshot[6].totalSafeCO2!) ==
                                              0,
                                          dateText: "Wochenstatistik",
                                          summaryPlaceholderText: snapshot
                                                      .length >
                                                  12
                                              ? "in ${14 - snapshot.length} Tag verfügbar"
                                              : "in ${14 - snapshot.length} Tagen verfügbar",
                                          gradient: flashyGradient,
                                          summaryVisible: snapshot.length > 13,
                                          onPressed: (int index) {
                                            setState(() {
                                              if (index == 0) {
                                                _isSelectedPieChartWeek[0] =
                                                    true;
                                                _isSelectedPieChartWeek[1] =
                                                    false;
                                              } else if (index == 1) {
                                                _isSelectedPieChartWeek[1] =
                                                    true;
                                                _isSelectedPieChartWeek[0] =
                                                    false;
                                              }
                                            });
                                          },
                                          isSelected: _isSelectedPieChartWeek,
                                          statCategorieOne:
                                              "Emissionen (kg CO₂)",
                                          statCategorieTwo:
                                              "Verzehrte Produkte (kg)",
                                          meatLabel: "Fleisch:",
                                          fishLabel: "Fisch:",
                                          dairyAndEggsLabel:
                                              "Milchprodukte und Eier:",
                                          fruitsAndVeggiesLabel:
                                              "Obst und Gemüse:",
                                          userStatMeatKG:
                                              _isSelectedPieChartWeek[0]
                                                  ? meatSumCO2
                                                  : meatSumKG,
                                          userStatFishKG:
                                              _isSelectedPieChartWeek[0]
                                                  ? fishSumCO2
                                                  : fishSumKG,
                                          userStatDairyAndEggsKG:
                                              _isSelectedPieChartWeek[0]
                                                  ? dairySumCO2
                                                  : dairySumKG,
                                          userStatFruitsAndVeggiesKG:
                                              _isSelectedPieChartWeek[0]
                                                  ? fruitsAndVeggiesSumCO2
                                                  : fruitsAndVeggiesSumKG,
                                          userStatMeatCO2:
                                              _isSelectedPieChartWeek[0]
                                                  ? meatSumCO2
                                                  : meatSumKG,
                                          userStatFishCO2:
                                              _isSelectedPieChartWeek[0]
                                                  ? fishSumCO2
                                                  : fishSumKG,
                                          userStatDairyAndEggsCO2:
                                              _isSelectedPieChartWeek[0]
                                                  ? dairySumCO2
                                                  : dairySumKG,
                                          userStatFruitsAndVeggiesCO2:
                                              _isSelectedPieChartWeek[0]
                                                  ? fruitsAndVeggiesSumCO2
                                                  : fruitsAndVeggiesSumKG,
                                          statSummary:
                                              // snapshot.length < 14
                                              //     ? "Vergleich zur Vorwoche\n in ${14 - snapshot.length} Tagen verfügbar "
                                              //     :
                                              (thisWeekSum > previousWeekSum
                                                  ? "Zusätzliche CO₂-Emissionen\n(Vergleich zur Vorwoche):"
                                                  : "Eingesparte CO₂-Emissionen\n(Vergleich zum Vorwoche):"),
                                          userStatSummary: snapshot.length < 14
                                              ? ""
                                              : ("${weeklyCO2Difference!.toStringAsFixed(2)} kg"),
                                          color: thisWeekSum > previousWeekSum
                                              ? Colors.red
                                              : kDarkGreen,
                                        ),
                                      ),
                                    ) :Container()
                                  ],
                                ),
                                snapshot.length < 2
                                    ? Showcase(
                                        key: container.profileKeyOne,
                                        description: showCaseLabels[19],
                                        targetBorderRadius:
                                            BorderRadius.circular(16),
                                        tooltipBorderRadius:
                                            BorderRadius.circular(16),
                                        targetPadding: const EdgeInsets.all(8),
                                        tooltipPadding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height:
                                                    SizeConfig.defaultSize! *
                                                        30),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Beantworte morgen dein Ernährungsprotokoll, damit du hier den Verlauf deiner Emissionen einsehen kannst!",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      SizeConfig.screenHeight *
                                                          0.01,
                                                  horizontal:
                                                      SizeConfig.screenWidth *
                                                          0.01),
                                              margin: EdgeInsets.symmetric(
                                                  vertical:
                                                      SizeConfig.screenHeight *
                                                          0.01,
                                                  horizontal:
                                                      SizeConfig.screenWidth *
                                                          0.02),
                                              // height:
                                              //     SizeConfig.screenHeight * 0.7,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        104, 0, 0, 0),
                                                    blurRadius: 7.0,
                                                    spreadRadius: 0.0,
                                                    offset: Offset(0,
                                                        0), // shadow direction: bottom right
                                                  )
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .screenHeight *
                                                        0.01,
                                                    bottom: SizeConfig
                                                            .screenHeight *
                                                        0.01,
                                                    left:
                                                        SizeConfig.screenWidth *
                                                            0.03,
                                                    right:
                                                        SizeConfig.screenWidth *
                                                            0.02),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        ToggleButtons(
                                                          focusColor:
                                                              kNeonGreen,
                                                          hoverColor:
                                                              kNeonGreen,
                                                          highlightColor:
                                                              kNeonGreen,
                                                          isSelected:
                                                              _isSelectedLineChart,
                                                          onPressed:
                                                              (int index) {
                                                            setState(() {
                                                              if (index == 0) {
                                                                _isSelectedLineChart[
                                                                    0] = true;
                                                                _isSelectedLineChart[
                                                                    1] = false;
                                                                spotsListsList =
                                                                    co2SpotsListsList;
                                                                totalSumList =
                                                                    totalSumCO2List;
                                                              } else if (index ==
                                                                  1) {
                                                                _isSelectedLineChart[
                                                                    1] = true;
                                                                _isSelectedLineChart[
                                                                    0] = false;
                                                              }
                                                            });
                                                          },
                                                          color: kDarkGreen,
                                                          selectedColor:
                                                              Colors.white,
                                                          fillColor: kDarkGreen,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          splashColor:
                                                              kNeonGreen,
                                                          borderWidth: 2,
                                                          children: const [
                                                            Text('CO₂'),
                                                            Text('kg')
                                                          ],
                                                        ),
                                                        PopupMenuButton(
                                                            //shape: Shape,
                                                            icon: SvgPicture.asset(
                                                                'assets/fi-rr-settings-sliders.svg'),
                                                            initialValue:
                                                                PopUpChoicesLineChart
                                                                        .choices[
                                                                    _spotListsListIndex],
                                                            onSelected:
                                                                (choice) {
                                                              setState(() {
                                                                if (choice ==
                                                                    PopUpChoicesLineChart
                                                                        .all) {
                                                                  _spotListsListIndex =
                                                                      0;
                                                                } else if (choice ==
                                                                    PopUpChoicesLineChart
                                                                        .meat) {
                                                                  _spotListsListIndex =
                                                                      1;
                                                                } else if (choice ==
                                                                    PopUpChoicesLineChart
                                                                        .fish) {
                                                                  _spotListsListIndex =
                                                                      2;
                                                                } else if (choice ==
                                                                    PopUpChoicesLineChart
                                                                        .dairy) {
                                                                  _spotListsListIndex =
                                                                      3;
                                                                } else if (choice ==
                                                                    PopUpChoicesLineChart
                                                                        .fruitsAndVeggies) {
                                                                  _spotListsListIndex =
                                                                      4;
                                                                }
                                                              });
                                                            },
                                                            itemBuilder: (context) =>
                                                                PopUpChoicesLineChart
                                                                    .choices
                                                                    .map((String
                                                                        choice) {
                                                                  return PopupMenuItem<
                                                                          String>(
                                                                      value:
                                                                          choice,
                                                                      child: Text(
                                                                          choice));
                                                                }).toList())
                                                      ],
                                                    ),
                                                    _isSelectedLineChart[0]
                                                        ? SizedBox(
                                                            height: SizeConfig
                                                                    .screenHeight *
                                                                0.03,
                                                            child:
                                                                const FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: Text(
                                                                  "Verlauf deiner Emissionen (kg CO₂)",
                                                                  style: TextStyle(
                                                                      color: kDarkGreen,
                                                                      //fontSize: 20,
                                                                      fontWeight: FontWeight.bold)),
                                                            ),
                                                          )
                                                        : SizedBox(
                                                            height: SizeConfig
                                                                    .screenHeight *
                                                                0.03,
                                                            child:
                                                                const FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: Text(
                                                                  "Verlauf deines Konsums (kg)",
                                                                  style: TextStyle(
                                                                      color: kDarkGreen,
                                                                      //fontSize: 20,
                                                                      fontWeight: FontWeight.bold)),
                                                            ),
                                                          ),
                                                    SizedBox(
                                                        height: SizeConfig
                                                                .screenHeight *
                                                            0.01),
                                                    Expanded(
                                                      child: LineChart(
                                                          lineChartData(
                                                              snapshot,
                                                              totalSumList,
                                                              allFoodsSpotsList,
                                                              spotsListsList[
                                                                  _spotListsListIndex])),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ]),
                        ),
                        const TabPageSelector(indicatorSize: 10),
                      ]);
                    }),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}

class PopUpChoicesLineChart {
  static const String all = 'Gesamt';
  static const String meat = 'Fleisch';
  static const String fish = 'Fisch';
  static const String dairy = 'Milchprodukte & Eier';
  static const String fruitsAndVeggies = 'Obst & Gemüse';

  static const List<String> choices = <String>[
    all,
    meat,
    fish,
    dairy,
    fruitsAndVeggies
  ];
}

void choiceActionLineChart(String choice) {
  if (choice == PopUpChoicesLineChart.all) {
  } else if (choice == PopUpChoicesLineChart.meat) {
  } else if (choice == PopUpChoicesLineChart.fish) {
  } else if (choice == PopUpChoicesLineChart.dairy) {
  } else if (choice == PopUpChoicesLineChart.fruitsAndVeggies) {}
}

LineChartData lineChartData(
        snapshot, List<double?> totalSumList, spotsListOne, spotsListTwo) =>
    LineChartData(
        minX: 0,
        maxX: snapshot.length < 30 ? (snapshot.length - 1).toDouble() : 30,
        minY: 0,
        maxY: totalSumList.reduce(((value, element) {
          if (value! > element!) {
            return (value.ceilToDouble() + 1);
          } else {
            return element + 2;
          }
        })), //totalCO2 + 1 or something
        gridData: gridData,
        lineTouchData: lineTouchData,
        titlesData: titlesData(snapshot),
        borderData: borderData,
        lineBarsData: lineBarsData(spotsListOne, spotsListTwo));

FlGridData get gridData => FlGridData(show: true);

FlTitlesData titlesData(snapshot) => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 35,
            getTitlesWidget: snapshot.length < 10
                ? (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return const XAxisText(value: 0);
                      case 1:
                        return const XAxisText(value: 1);
                      case 2:
                        return const XAxisText(value: 2);
                      case 3:
                        return const XAxisText(value: 3);
                      case 4:
                        return const XAxisText(value: 4);
                      case 5:
                        return const XAxisText(value: 5);
                      case 6:
                        return const XAxisText(value: 6);
                      case 7:
                        return const XAxisText(value: 7);
                      case 8:
                        return const XAxisText(value: 8);
                      case 9:
                        return const XAxisText(value: 9);
                    }
                    return const Text('');
                  }
                : (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return const XAxisText(value: 0);
                      case 2:
                        return const XAxisText(value: 2);
                      case 4:
                        return const XAxisText(value: 4);
                      case 6:
                        return const XAxisText(value: 6);
                      case 8:
                        return const XAxisText(value: 8);
                      case 10:
                        return const XAxisText(value: 10);
                      case 12:
                        return const XAxisText(value: 12);
                      case 14:
                        return const XAxisText(value: 14);
                      case 16:
                        return const XAxisText(value: 16);
                      case 18:
                        return const XAxisText(value: 18);
                      case 20:
                        return const XAxisText(value: 20);
                      case 22:
                        return const XAxisText(value: 22);
                      case 24:
                        return const XAxisText(value: 24);
                      case 26:
                        return const XAxisText(value: 26);
                      case 28:
                        return const XAxisText(value: 28);
                    }
                    return const Text('');
                  }),
      ),
      topTitles: AxisTitles(),
      leftTitles: AxisTitles(),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            getTitlesWidget:
                // },
                // return Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     value.toStringAsFixed(0) + '',
                //     style: TextStyle(color: kDarkGreen.withOpacity(0.7)),
                //   ),
                // );
                (double value, TitleMeta meta) {
              dynamic style = TextStyle(
                color: kDarkGreen.withOpacity(0.5),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              );
              String text;
              if (value == 0) {
                text = '0';
              } else if (value == 2) {
                text = '2';
              } else if (value == 4) {
                text = '4';
              } else if (value == 6) {
                text = '6';
              } else if (value == 8) {
                text = '8';
              } else if (value == 10) {
                text = '10';
              } else if (value == 12) {
                text = '12';
              } else if (value == 14) {
                text = '14';
              } else if (value == 16) {
                text = '16';
              } else if (value == 18) {
                text = '18';
              } else if (value == 20) {
                text = '20';
              } else {
                return Container();
              }
              return SideTitleWidget(
                axisSide: meta.axisSide,
                space: 5,
                child: Text(text, style: style),
              );
            }),
      ),
    );

FlBorderData get borderData => FlBorderData(
    border: Border.all(color: kDarkGreen.withOpacity(0.5)), show: true);

List<LineChartBarData> lineBarsData(spotsListOne, spotsListTwo) => [
      LineChartBarData(
          preventCurveOverShooting: true,
          spots: spotsListOne,
          isCurved: true,
          gradient: greenLineChartGradient,
          barWidth: 5,
          belowBarData:
              BarAreaData(show: true, gradient: greenLineChartGradient)),
      LineChartBarData(
          preventCurveOverShooting: true,
          spots: spotsListTwo,
          isCurved: true,
          gradient: yellowLineChartGradient,
          barWidth: 5,
          belowBarData:
              BarAreaData(show: true, gradient: yellowLineChartGradient)),
    ];

LineTouchData get lineTouchData => LineTouchData(
      touchTooltipData: LineTouchTooltipData(
          tooltipRoundedRadius: 10,
          tooltipBgColor: Colors.white,
          getTooltipItems: (value) {
            return value
                .map((e) => LineTooltipItem(e.y.toStringAsFixed(2),
                    const TextStyle(fontSize: 16, color: kDarkGreen)))
                .toList();
          }),
    );

class XAxisText extends StatelessWidget {
  final double value;
  const XAxisText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value == 0
            ? (' Tag  ${(value + 1).toStringAsFixed(0)}')
            : ((value + 1).toStringAsFixed(0)),
        style: TextStyle(fontSize: 12, color: kDarkGreen.withOpacity(0.7)),
      ),
    );
  }
}

class YAxisText extends StatelessWidget {
  final int text;
  const YAxisText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '  $text kg',
      style: TextStyle(color: kDarkGreen.withOpacity(0.7)),
    );
  }
}
