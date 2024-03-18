  import '../JsonObjects/survey_answers_post_data.dart';
  import 'package:intl/intl.dart';

addMeat(List<SurveyAnswersPostData> days, List<double?> list, String unit) {
    // final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    // int i = 0;
    // dateFormat.format(DateTime.now().subtract(Duration(days: i)));
    if (days.isEmpty) {
      //print("Noch keine Daten für diese Woche");
    } else if (days.isNotEmpty) {
      //meatSum = 0;
      if (unit == "KG") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double meat = 0;
          meat = days[i].animalDeliKG! +
              days[i].beefKG! +
              days[i].porkKG! +
              days[i].poultryKG! +
              days[i].sausagesKG!;
          list.add(meat);
          //print(meatListKG);
        }
      } else if (unit == "CO2") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double meat = 0;
          meat = days[i].animalDeliCO2! +
              days[i].beefCO2! +
              days[i].porkCO2! +
              days[i].poultryCO2! +
              days[i].sausagesCO2!;
          list.add(meat);
          //print(meatListCO2);
        }
      }
    } else {
      //meatSum = 0;
    }
  }

  addFish(List<SurveyAnswersPostData> days, List<double?> list, String unit) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    int i = 0;
    dateFormat.format(DateTime.now().subtract(Duration(days: i)));
    if (days.isEmpty) {
      //print("Noch keine Daten für diese Woche");
    } else if (days.isNotEmpty) {
      //meatSum = 0;
      if (unit == "KG") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double fish = 0;
          fish = days[i].fishKG!;
          list.add(fish);
          //print(fishListKG);
        }
      }
      if (unit == "CO2") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double fish = 0;
          fish = days[i].fishCO2!;
          list.add(fish);
          //print(fishListKG);
        }

        //weeklyMeatList.forEach((e) => meatSum += e);
        //print(meatSum);
      }
    } else {
      //meatSum = 0;
    }
  }

  addDairy(List<SurveyAnswersPostData> days, List<double?> list, String unit) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    int i = 0;
    dateFormat.format(DateTime.now().subtract(Duration(days: i)));
    if (days.isEmpty) {
      //print("Noch keine Daten für diese Woche");
    } else if (days.isNotEmpty) {
      //meatSum = 0;
      if (unit == "KG") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double dairy = 0;
          dairy = days[i].animalCheeseKG! +
              days[i].butterKG! +
              days[i].animalJogurtKG! +
              days[i].animalMilkKG! +
              days[i].animalCreamKG!+
              days[i].eggsKG!;
          list.add(dairy);
          //print(dairyListKG);
        }
      }
      if (unit == "CO2") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double dairy = 0;
          dairy = days[i].animalCheeseCO2! +
              days[i].butterCO2! +
              days[i].animalJogurtCO2! +
              days[i].animalMilkCO2! +
              days[i].animalCreamCO2!+
              days[i].eggsCO2!;
          list.add(dairy);
          //print(dairyListKG);
        }
      }

      //weeklyMeatList.forEach((e) => meatSum += e);
      //print(meatSum);
    } else {
      //meatSum = 0;
    }
  }

  addFruitsAndVeggies(List<SurveyAnswersPostData> days, List<double?> list, String unit) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    int i = 0;
    dateFormat.format(DateTime.now().subtract(Duration(days: i)));
    if (days.isEmpty) {
      //print("Noch keine Daten für diese Woche");
    } else if (days.isNotEmpty) {
      //meatSum = 0;
      if (unit == "KG") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double fruitsAndVeggies = 0;
          fruitsAndVeggies =
              days[i].fruitsKG! + days[i].vegetablesKG!;
          list.add(fruitsAndVeggies);
          //print(fruitsAndVeggiesListKG);
        }
      }
      if (unit == "CO2") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double fruitsAndVeggies = 0;
          fruitsAndVeggies =
              days[i].fruitsCO2! + days[i].fruitsCO2!;
          list.add(fruitsAndVeggies);
          //print(fruitsAndVeggiesListKG);
        }

        //weeklyMeatList.forEach((e) => meatSum += e);
        //print(meatSum);
      }
    } else {
      //meatSum = 0;
    }
  }

  addReplacementFoods(List<SurveyAnswersPostData> days, List<double?> list, String unit) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    int i = 0;
    dateFormat.format(DateTime.now().subtract(Duration(days: i)));
    if (days.isEmpty) {
    } else if (days.isNotEmpty) {
      if (unit == "KG") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double replacementFoods = 0;
          replacementFoods = days[i].margarineKG! +
              days[i].meatSubstitutesKG! +
              days[i].plantCheeseKG! +
              days[i].plantCheeseKG! +
              days[i].plantDeliKG! +
              days[i].plantJogurtKG! +
              days[i].plantMilkKG! +
              days[i].tofuKG! +
              days[i].legumesKG!;
          list.add(replacementFoods);
        }
      }
      if (unit == "CO2") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double replacementFoods = 0;
          replacementFoods = days[i].margarineCO2! +
              days[i].meatSubstitutesCO2! +
              days[i].plantCheeseCO2! +
              days[i].plantCreamCO2! +
              days[i].plantDeliCO2! +
              days[i].plantJogurtCO2! +
              days[i].plantMilkCO2! +
              days[i].tofuCO2! +
              days[i].legumesCO2!;
          list.add(replacementFoods);
        }
        //meatSum = 0;

        //weeklyMeatList.forEach((e) => meatSum += e);
        //print(meatSum);
      }
    } else {
      //meatSum = 0;
    }
  }

  addDrinks(List<SurveyAnswersPostData> days, List<double?> list, String unit) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    int i = 0;
    dateFormat.format(DateTime.now().subtract(Duration(days: i)));
    if (days.isEmpty) {
    } else if (days.isNotEmpty) {
      if (unit == "KG") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double drinks = 0;
          drinks = days[i].alcDrinksKG! +
              days[i].freeDrinksKG! +
              days[i].teaKG!;
          list.add(drinks);
        }
      }
      if (unit == "CO2") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double drinks = 0;
          drinks = days[0].alcDrinksCO2! +
              days[i].alcDrinksCO2! +
              days[i].totalSafeCO2!;
          list.add(drinks);
        }
        //meatSum = 0;

        //weeklyMeatList.forEach((e) => meatSum += e);
        //print(meatSum);
      }
    } else {
      //meatSum = 0;
    }
  }

  addOtherFoods(List<SurveyAnswersPostData> days, List<double?> list, String unit) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    int i = 0;
    dateFormat.format(DateTime.now().subtract(Duration(days: i)));
    if (days.isEmpty) {
    } else if (days.isNotEmpty) {
      if (unit == "KG") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double otherFoods = 0;
          otherFoods = days[i].breadKG! +
              days[i].cerealKG! +
              days[i].nutsKG! +
              days[i].pastaKG!+
              days[i].potatoesKG!+
              days[i].riceKG! +
              days[i].saltySnacksKG! +
              days[i].spreadKG!;
          list.add(otherFoods);
        }
      }
      if (unit == "CO2") {
        // list = [];
        for (var i = 0; i < days.length; i++) {
          double otherFoods = 0;
          otherFoods = days[0].breadCO2! +
              days[0].cerealCO2! +
              days[0].nutsCO2! +
              days[0].pastaCO2! +
              days[0].potatoesCO2! +
              days[0].riceCO2! +
              days[0].saltySnacksCO2! +
              days[0].spreadCO2!;
          list.add(otherFoods);
        }
        //meatSum = 0;

        //weeklyMeatList.forEach((e) => meatSum += e);
        //print(meatSum);
      }
    } else {
      //meatSum = 0;
    }
  }

  