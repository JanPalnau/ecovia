import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/JsonObjects/survey_answers_pre_data.dart';
import 'package:ecovia/JsonObjects/user_data.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:ecovia/SurveyScreen/completion_screen.dart';
import 'package:ecovia/SurveyScreen/consent_screen.dart';
import 'package:ecovia/SurveyScreen/finish_screen.dart';
import 'package:ecovia/SurveyScreen/progress_bar_header.dart';
import 'package:ecovia/SurveyScreen/questions.dart';
import 'package:ecovia/showcase_labels_list.dart';
import 'package:ecovia/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import '../main.dart';
import 'food_question_card.dart';
import 'package:intl/intl.dart';
import 'package:ecovia/References/references.dart';

class SurveyBody extends StatefulWidget {
  const SurveyBody({
    Key? key,
  }) : super(key: key);

  static const kPrimaryGradient = LinearGradient(
    colors: [kDarkGreen, kNeonGreen],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  //final SwipableStackController _stackController = SwipableStackController();

  @override
  State<SurveyBody> createState() => _SurveyBodyState();
  static State<SurveyBody>? of(BuildContext context) =>
      context.findAncestorStateOfType<_SurveyBodyState>();
}

CollectionReference emissionStats = userCollection
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection('emissionStats');

class _SurveyBodyState extends State<SurveyBody> {
  int pageIndex = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // setState(() {
      //   pageIndex = _pageController.page!.toInt();
      // });
      // widget._stackController.addListener(() {
      //   setState(() {
      //     pageIndex = widget._stackController.currentIndex.toInt();
      //   });
    });
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    //widget._pageController.dispose();
  }

  //addEmissions(CollectionReference collection, String docTitle, int val, String food, int emissionMultiplier) {
  //collection.doc(docTitle).set({
  //food : val * emissionMultiplier,
  //}, SetOptions(merge: true));
  //}

  //void _reset() {
  ////context,
  //PageRouteBuilder(
  //transitionDuration: Duration.zero,
  //pageBuilder: (_, __, ___) => SurveyBody(),
  //),
  //);
  //}
  final DateTime date = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final textController = TextEditingController();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  //final Stream<DocumentSnapshot> userStream =
  //  FirebaseFirestore.instance.collection('users').doc(uid).snapshots();

  @override
  Widget build(BuildContext context) {
    DocumentReference userReference =
        userCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    CollectionReference surveyQuestionsPre = userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('surveyAnswersPre');

    CollectionReference surveyQuestionsPost = userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('surveyAnswers');
    final container = StateContainer.of(context);
    final String answerDate = dateFormat.format(date);
    setValue(
        String foodName,
        String foodNameKG,
        String foodNameCO2,
        double portionFraction,
        int val,
        double? portionConversion,
        double? emissionMultiplier) {
      if (val == 1) {
        surveyQuestionsPre.doc(answerDate).set({
          foodName: portionFraction.toDouble(),
        }, SetOptions(merge: true));
        surveyQuestionsPre.doc(answerDate).set({
          foodNameKG: (portionFraction / portionConversion!).toDouble(),
        }, SetOptions(merge: true));
        surveyQuestionsPre.doc(answerDate).set({
          foodNameCO2:
              (portionFraction * (emissionMultiplier! / portionConversion))
                  .toDouble(),
        }, SetOptions(merge: true));
        if (val != 0) {}
        surveyQuestionsPre.doc(answerDate).set({
          'totalCO2': FieldValue.increment(
              (portionFraction * (emissionMultiplier / portionConversion))
                  .toDouble()),
        }, SetOptions(merge: true));
      } else if (val > 1) {
        surveyQuestionsPre.doc(answerDate).set({
          foodName: val.toDouble(),
        }, SetOptions(merge: true));
        surveyQuestionsPre.doc(answerDate).set({
          foodNameKG: (val / portionConversion!).toDouble(),
        }, SetOptions(merge: true));
        surveyQuestionsPre.doc(answerDate).set({
          foodNameCO2:
              (val * (emissionMultiplier! / portionConversion)).toDouble(),
        }, SetOptions(merge: true));
        surveyQuestionsPre.doc(answerDate).set({
          'totalCO2': FieldValue.increment(
              (portionFraction * (emissionMultiplier / portionConversion))
                  .toDouble()),
        }, SetOptions(merge: true));
      } else {
        surveyQuestionsPre.doc(answerDate).set({
          foodName: 0.toDouble(),
        }, SetOptions(merge: true));
        surveyQuestionsPre.doc(answerDate).set({
          foodNameKG: 0.toDouble(),
        }, SetOptions(merge: true));
        surveyQuestionsPre.doc(answerDate).set({
          foodNameCO2: 0.toDouble(),
        }, SetOptions(merge: true));
        surveyQuestionsPre.doc(answerDate).set({
          'totalCO2': FieldValue.increment(
              (portionFraction * (emissionMultiplier! / portionConversion!))
                  .toDouble()),
        }, SetOptions(merge: true));
      }
    }

    //CollectionReference surveyQuestions =
    // FirebaseFirestore.instance.collection('surveyQuestions');
    // Future updateUserdata(questionOne, questionTwo, questionThree) async {
    //return await surveyQuestions.doc(widget.uid).set({
    //'questionOne': questionOne,
    //'questionTwo': questionTwo,
    //'questionThree': questionThree,
    // });
    // };
    final pageIndex = ValueNotifier(0);
    return Stack(
      children: [
        SafeArea(
          child: Container(
            decoration: BoxDecoration(gradient: backgroundGradient()),
            child: Consumer<UserData>(builder: (context, snapshot, child) {
              DateTime loginDate = dateFormat.parse(snapshot.loginDate!);
              int interventionDay = date.difference(loginDate).inDays;
              if (snapshot.completionStatus == true) {
                return Column(
                  children: [
                    ProgressBarHeader(
                        pageIndex: dietQuestions.length + 1,
                        pagesLength: dietQuestions.length),
                    Expanded(child: CompletionScreen()),
                  ],
                );
              }
              return Showcase(
                key: container.surveyKeyOne,
                description: showCaseLabels[18],
                targetBorderRadius: BorderRadius.circular(16),
                tooltipBorderRadius: BorderRadius.circular(16),
                targetPadding: const EdgeInsets.all(8),
                tooltipPadding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: pageIndex,
                        builder: (context, value, child) {
                          return ProgressBarHeader(
                              pageIndex: pageIndex.value,
                              pagesLength: dietQuestions.length);
                        }),
                    Expanded(
                      child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          //clipBehavior: Clip.none,
                          controller: _pageController,
                          itemCount: dietQuestions.length + 2,
                          itemBuilder: (context, index) {
                            if (index > 0 && index < dietQuestions.length + 1) {
                              return FoodQuestionCard(
                                bottomPadding: false,
                                isFoodPictureVisible:
                                    dietQuestions[index - 1].imgSrc!.isNotEmpty,
                                dietQuestion: dietQuestions[index - 1].question,
                                answerOptions: dietQuestions[index - 1].scale!,
                                backButtonVisible:
                                    dietQuestions[index - 1].backButtonVisible!,
                                previousPage: () {
                                  _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                },
                                userCallback: (int? val) {
                                  setValue(
                                      dietQuestions[index - 1].name!,
                                      '${dietQuestions[index - 1].name!}KG',
                                      '${dietQuestions[index - 1].name!}CO2',
                                      0.5,
                                      val!,
                                      dietQuestions[index - 1]
                                          .portionConversion,
                                      dietQuestions[index - 1]
                                          .emissionMultiplier);
                                  addEmissions(
                                      dietQuestions[index - 1].name!,
                                      0.5,
                                      val,
                                      dietQuestions[index - 1]
                                          .portionConversion,
                                      dietQuestions[index - 1]
                                          .emissionMultiplier);
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                  pageIndex.value =
                                      _pageController.page!.toInt();
                                },
                                imgSrc: dietQuestions[index - 1].imgSrc!,
                              );
                            }
                            if (index == 0) {
                              return ConsentScreen(
                                  bottomPadding: false,
                                  nextPage: () {
                                    surveyQuestionsPre.doc(answerDate).set(
                                        {'date': answerDate},
                                        SetOptions(merge: true));
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                    pageIndex.value =
                                        _pageController.page!.toInt();
                                  },
                                  consentText:
                                      'Im Ernährungsprotokoll wird Ihr Ernährungsverhalten der letzten 24 Stunden anhand eines 5- bis 10-minütigen Fragebogens erhoben. Mit der Teilnahme am täglichen Ernährungsprotokoll stimmen Sie der Verarbeitung ihrer angebenen Daten gemäß der untenstehenden ECOVIA Datenschutzerklärung zu.\n\nAntworten aus dem Ernährungsprotokoll werden von uns zu Forschungszwecken anonymisiert weiterverarbeitet. \n\nDie Teilnahme ist freiwillig und Sie können die Teilnahme jederzeit bedingungslos beenden. \n\nSie haben Fragen? Schreiben Sie uns: \nmail@ecovia.app');
                            }
                            if (index == dietQuestions.length + 1) {
                              return Consumer<List<SurveyAnswersPreData>>(
                                  builder: (context, surveyAnswersPre, child) {
                                if (surveyAnswersPre.isEmpty) {
                                  return SizedBox(
                                      height: SizeConfig.screenHeight * 0.05,
                                      child: const CircularProgressIndicator(
                                        color: kDarkGreen,
                                      ));
                                } else if (surveyAnswersPre.isNotEmpty) {
                                  return FinishScreen(
                                      nextPage: () async {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) => const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: kDarkGreen),
                                                ));
                                        double totalCO2 = surveyAnswersPre[0]
                                                .animalDeliCO2! +
                                            surveyAnswersPre[0].beefCO2! +
                                            surveyAnswersPre[0].porkCO2! +
                                            surveyAnswersPre[0].poultryCO2! +
                                            surveyAnswersPre[0].sausagesCO2! +
                                            surveyAnswersPre[0].fishCO2! +
                                            surveyAnswersPre[0]
                                                .animalCheeseCO2! +
                                            surveyAnswersPre[0].butterCO2! +
                                            surveyAnswersPre[0]
                                                .animalJogurtCO2! +
                                            surveyAnswersPre[0].animalMilkCO2! +
                                            surveyAnswersPre[0]
                                                .animalCreamCO2! +
                                            surveyAnswersPre[0].eggsCO2! +
                                            surveyAnswersPre[0].fruitsCO2! +
                                            surveyAnswersPre[0].vegetablesCO2! +
                                            surveyAnswersPre[0].margarineCO2! +
                                            surveyAnswersPre[0]
                                                .meatSubstitutesCO2! +
                                            surveyAnswersPre[0]
                                                .plantCheeseCO2! +
                                            surveyAnswersPre[0].plantCreamCO2! +
                                            surveyAnswersPre[0].plantDeliCO2! +
                                            surveyAnswersPre[0]
                                                .plantJogurtCO2! +
                                            surveyAnswersPre[0].plantMilkCO2! +
                                            surveyAnswersPre[0].tofuCO2! +
                                            surveyAnswersPre[0].legumesCO2! +
                                            surveyAnswersPre[0].alcDrinksCO2! +
                                            surveyAnswersPre[0].freeDrinksCO2! +
                                            surveyAnswersPre[0].teaCO2! +
                                            surveyAnswersPre[0].breadCO2! +
                                            surveyAnswersPre[0].cerealCO2! +
                                            surveyAnswersPre[0].nutsCO2! +
                                            surveyAnswersPre[0].pastaCO2! +
                                            surveyAnswersPre[0].potatoesCO2! +
                                            surveyAnswersPre[0].riceCO2! +
                                            surveyAnswersPre[0]
                                                .saltySnacksCO2! +
                                            surveyAnswersPre[0].spreadCO2!;
                                        await surveyQuestionsPost
                                            .doc(answerDate)
                                            .set({
                                          'date': answerDate,
                                          'alcDrinks':
                                              surveyAnswersPre[0].alcDrinks,
                                          'alcDrinksKG':
                                              surveyAnswersPre[0].alcDrinksKG,
                                          'alcDrinksCO2':
                                              surveyAnswersPre[0].alcDrinksCO2,
                                          'animalCheese':
                                              surveyAnswersPre[0].animalCheese,
                                          'animalCheeseKG': surveyAnswersPre[0]
                                              .animalCheeseKG,
                                          'animalCheeseCO2': surveyAnswersPre[0]
                                              .animalCheeseCO2,
                                          'animalCream':
                                              surveyAnswersPre[0].animalCream,
                                          'animalCreamKG':
                                              surveyAnswersPre[0].animalCreamKG,
                                          'animalCreamCO2': surveyAnswersPre[0]
                                              .animalCreamCO2,
                                          'animalDeli':
                                              surveyAnswersPre[0].animalDeli,
                                          'animalDeliKG':
                                              surveyAnswersPre[0].animalDeliKG,
                                          'animalDeliCO2':
                                              surveyAnswersPre[0].animalDeliCO2,
                                          'animalJogurt':
                                              surveyAnswersPre[0].animalJogurt,
                                          'animalJogurtKG': surveyAnswersPre[0]
                                              .animalJogurtKG,
                                          'animalJogurtCO2': surveyAnswersPre[0]
                                              .animalJogurtCO2,
                                          'animalMilk':
                                              surveyAnswersPre[0].animalMilk,
                                          'animalMilkKG':
                                              surveyAnswersPre[0].animalMilkKG,
                                          'animalMilkCO2':
                                              surveyAnswersPre[0].animalMilkCO2,
                                          'beef': surveyAnswersPre[0].beef,
                                          'beefKG': surveyAnswersPre[0].beefKG,
                                          'beefCO2':
                                              surveyAnswersPre[0].beefCO2,
                                          'bread': surveyAnswersPre[0].bread,
                                          'breadKG':
                                              surveyAnswersPre[0].breadKG,
                                          'breadCO2':
                                              surveyAnswersPre[0].breadCO2,
                                          'butter': surveyAnswersPre[0].butter,
                                          'butterKG':
                                              surveyAnswersPre[0].butterKG,
                                          'butterCO2':
                                              surveyAnswersPre[0].butterCO2,
                                          'cereal': surveyAnswersPre[0].cereal,
                                          'cerealKG':
                                              surveyAnswersPre[0].cerealKG,
                                          'cerealCO2':
                                              surveyAnswersPre[0].cerealCO2,
                                          'eggs': surveyAnswersPre[0].eggs,
                                          'eggsKG': surveyAnswersPre[0].eggsKG,
                                          'eggsCO2':
                                              surveyAnswersPre[0].eggsCO2,
                                          'fish': surveyAnswersPre[0].fish,
                                          'fishKG': surveyAnswersPre[0].fishKG,
                                          'fishCO2':
                                              surveyAnswersPre[0].fishCO2,
                                          'freeDrinks':
                                              surveyAnswersPre[0].freeDrinks,
                                          'freeDrinksKG':
                                              surveyAnswersPre[0].freeDrinksKG,
                                          'freeDrinksCO2':
                                              surveyAnswersPre[0].freeDrinksCO2,
                                          'fruits': surveyAnswersPre[0].fruits,
                                          'fruitsKG':
                                              surveyAnswersPre[0].fruitsKG,
                                          'fruitsCO2':
                                              surveyAnswersPre[0].fruitsCO2,
                                          'legumes':
                                              surveyAnswersPre[0].legumes,
                                          'legumesKG':
                                              surveyAnswersPre[0].legumesKG,
                                          'legumesCO2':
                                              surveyAnswersPre[0].legumesCO2,
                                          'margarine':
                                              surveyAnswersPre[0].margarine,
                                          'margarineKG':
                                              surveyAnswersPre[0].margarineKG,
                                          'margarineCO2':
                                              surveyAnswersPre[0].margarineCO2,
                                          'meatSubstitutes': surveyAnswersPre[0]
                                              .meatSubstitutes,
                                          'meatSubstitutesKG':
                                              surveyAnswersPre[0]
                                                  .meatSubstitutesKG,
                                          'meatSubstitutesCO2':
                                              surveyAnswersPre[0]
                                                  .meatSubstitutesCO2,
                                          'nuts': surveyAnswersPre[0].nuts,
                                          'nutsKG': surveyAnswersPre[0].nutsKG,
                                          'nutsCO2':
                                              surveyAnswersPre[0].nutsCO2,
                                          'pasta': surveyAnswersPre[0].pasta,
                                          'pastaKG':
                                              surveyAnswersPre[0].pastaKG,
                                          'pastaCO2':
                                              surveyAnswersPre[0].pastaCO2,
                                          'plantCheese':
                                              surveyAnswersPre[0].plantCheese,
                                          'plantCheeseKG':
                                              surveyAnswersPre[0].plantCheeseKG,
                                          'plantCheeseCO2': surveyAnswersPre[0]
                                              .plantCheeseCO2,
                                          'plantCream':
                                              surveyAnswersPre[0].plantCream,
                                          'plantCreamKG':
                                              surveyAnswersPre[0].plantCreamKG,
                                          'plantCreamCO2':
                                              surveyAnswersPre[0].plantCreamCO2,
                                          'plantDeli':
                                              surveyAnswersPre[0].plantDeli,
                                          'plantDeliKG':
                                              surveyAnswersPre[0].plantDeliKG,
                                          'plantDeliCO2':
                                              surveyAnswersPre[0].plantDeliCO2,
                                          'plantJogurt':
                                              surveyAnswersPre[0].plantJogurt,
                                          'plantJogurtKG':
                                              surveyAnswersPre[0].plantJogurtKG,
                                          'plantJogurtCO2': surveyAnswersPre[0]
                                              .plantJogurtCO2,
                                          'plantMilk':
                                              surveyAnswersPre[0].plantMilk,
                                          'plantMilkKG':
                                              surveyAnswersPre[0].plantMilkKG,
                                          'plantMilkCO2':
                                              surveyAnswersPre[0].plantMilkCO2,
                                          'poultry':
                                              surveyAnswersPre[0].poultry,
                                          'poultryKG':
                                              surveyAnswersPre[0].poultryKG,
                                          'poultryCO2':
                                              surveyAnswersPre[0].poultryCO2,
                                          'pork': surveyAnswersPre[0].pork,
                                          'porkKG': surveyAnswersPre[0].porkKG,
                                          'porkCO2':
                                              surveyAnswersPre[0].porkCO2,
                                          'potatoes':
                                              surveyAnswersPre[0].potatoes,
                                          'potatoesKG':
                                              surveyAnswersPre[0].potatoesKG,
                                          'potatoesCO2':
                                              surveyAnswersPre[0].potatoesCO2,
                                          'rice': surveyAnswersPre[0].rice,
                                          'riceKG': surveyAnswersPre[0].riceKG,
                                          'riceCO2':
                                              surveyAnswersPre[0].riceCO2,
                                          'saltySnacks':
                                              surveyAnswersPre[0].saltySnacks,
                                          'saltySnacksKG':
                                              surveyAnswersPre[0].saltySnacksKG,
                                          'saltySnacksCO2': surveyAnswersPre[0]
                                              .saltySnacksCO2,
                                          'sausages':
                                              surveyAnswersPre[0].sausages,
                                          'sausagesKG':
                                              surveyAnswersPre[0].sausagesKG,
                                          'sausagesCO2':
                                              surveyAnswersPre[0].sausagesCO2,
                                          'spread': surveyAnswersPre[0].spread,
                                          'spreadKG':
                                              surveyAnswersPre[0].spreadKG,
                                          'spreadCO2':
                                              surveyAnswersPre[0].spreadCO2,
                                          'tea': surveyAnswersPre[0].tea,
                                          'teaKG': surveyAnswersPre[0].teaKG,
                                          'teaCO2': surveyAnswersPre[0].teaCO2,
                                          'tofu': surveyAnswersPre[0].tofu,
                                          'tofuKG': surveyAnswersPre[0].tofuKG,
                                          'tofuCO2':
                                              surveyAnswersPre[0].tofuCO2,
                                          'vegetables':
                                              surveyAnswersPre[0].vegetables,
                                          'vegetablesKG':
                                              surveyAnswersPre[0].vegetablesKG,
                                          'vegetablesCO2':
                                              surveyAnswersPre[0].vegetablesCO2,
                                          'totalSafeCO2': totalCO2,
                                        }, SetOptions(merge: true));
                                        await userReference.set({
                                          'ecoPointsReceived': false,
                                          'completionStatus': true,
                                          'feedbackReceived': false,
                                        }, SetOptions(merge: true));
                                        // if (interventionDay == 30) {
                                        //   userReference.set({
                                        //     'studyCompleted': true
                                        //   }, SetOptions(merge: true));
                                        // }
                                        if (interventionDay >= 60) {
                                          await userReference.set(
                                              {'followUpCompleted': true},
                                              SetOptions(merge: true));
                                          await userReference.set(
                                              {'email': FieldValue.delete()},
                                              SetOptions(merge: true));
                                        }
                                        //Navigator.of(context, rootNavigator: true).pop();
                                        navigatorKey.currentState!
                                            .popUntil((route) => route.isFirst);
                                      },
                                      previousPage: () {},
                                      backButtonVisible: false);
                                }
                                return Container();
                              });
                            }
                            return Container();
                          }),
                    ),
                    //Container(height: SizeConfig.screenHeight * 0.02, color: Colors.transparent,)
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

addEmissions(String foodName, double portionFraction, int val,
    double? portionConversion, double? emissionMultiplier) {
  final DateTime date = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final String answerDate = dateFormat.format(date);
  if (val == 1) {
    emissionStats.doc(answerDate).set({
      foodName: portionFraction * (emissionMultiplier! / portionConversion!),
    }, SetOptions(merge: true));
  } else if (val > 1) {
    emissionStats.doc(answerDate).set({
      foodName: val * (emissionMultiplier! / portionConversion!),
    }, SetOptions(merge: true));
  } else {
    emissionStats.doc(answerDate).set({
      foodName: 0,
    }, SetOptions(merge: true));
  }
}
