import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia_control/Screens/build_app_bars.dart';
import 'package:ecovia_control/SurveyScreen/consent_screen.dart';
import 'package:ecovia_control/SurveyScreen/food_question_card.dart';
import 'package:ecovia_control/SurveyScreen/picker_question_card.dart';
import 'package:ecovia_control/SurveyScreen/progress_bar_header.dart';
import 'package:ecovia_control/SurveyScreen/questions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PreQuestionnaireScreen extends StatefulWidget {
  const PreQuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<PreQuestionnaireScreen> createState() => _PreQuestionnaireScreenState();
}

class _PreQuestionnaireScreenState extends State<PreQuestionnaireScreen> {
  final PageController _pageControllerOne = PageController();
  //final PageController _pageControllerTwo = PageController();
  final DocumentReference userReference = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final DocumentReference preQuestionnaireReference = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("preQuestionnaireAnswers")
      .doc("preQuestionnaireAnswers");

  @override
  void initState() {
    super.initState();
    // _pageControllerOne.addListener(() {
    //   setState(() {
    //     pageIndex = _pageControllerOne.page!.toInt();
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _pageControllerOne.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final number = ValueNotifier(0);
    //print(totalListQuestions.length);
    final age = ValueNotifier(0);
    //print(number.value);
    // var controllerProvider =
    //     Provider.of<PreQuestionnaireControllerNotifier>(context, listen: false);
    // var pageProvider =
    //     Provider.of<PreQuestionnairePageNotifier>(context, listen: false);
    return Scaffold(
        appBar: buildPreQuestionnaireAppBar(),
        backgroundColor: Colors.white,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ValueListenableBuilder<int>(
                        valueListenable: number,
                        builder: (context, value, child) {
                          return ProgressBarHeader(
                              pageIndex: number.value,
                              pagesLength: totalListQuestions.length + 5);
                        }),
                    Expanded(
                      child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          //clipBehavior: Clip.none,
                          controller: _pageControllerOne,
                          itemCount: totalListQuestions.length + 5,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return ConsentScreen(
                                  bottomPadding: true,
                                  consentText:
                                      'Vielen Dank für Ihr Interesse an der ECOVIA - Ernährungsprotokoll App. Diese App dient mit der Beantwortung eines täglichen Ernährungsprotokolls als Teil des Forschungsprojekts ECOVIA. Vor der Einführung in das tägliche Ernährungsprotokoll, werden Ihnen nachfolgend zu Forschungszwecken einmalig Fragen zu Ihrer Person gestellt. Dieser Teil wird ca. 15 Minuten Ihrer Zeit in Anspruch nehmen. Bitte wählen Sie bei jeder Frage die Antwort, die Sie am ehesten repräsentiert. Alle erhobenen Daten werden anonymisiert und ausschließlich für Forschungszwecke verwendet.  \n\nWenn Sie die Datenschutzerklärung gelesen und der Erhebung Ihrer Daten unter den genannten Bedingungen zustimmen, wählen Sie unten bitte "Ich stimme zu", um mit dem Fragebogen zu beginnen. \n\nSie haben Fragen? Schreiben Sie uns: \nmail@ecovia.app',
                                  nextPage: () {
                                    _pageControllerOne.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                    number.value =
                                        _pageControllerOne.page!.toInt();
                                  });
                            } else if (index == 1) {
                              return FoodQuestionCard(
                                bottomPadding: true,
                                userCallback: (dynamic val) {
                                  preQuestionnaireReference.set({
                                    '${sociodemographicQuestions[0].name}': val,
                                    'ecoviaControl': true,
                                  }, SetOptions(merge: true));

                                  _pageControllerOne.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                  number.value =
                                      _pageControllerOne.page!.toInt();
                                },
                                dietQuestion:
                                    sociodemographicQuestions[0].question,
                                backButtonVisible: false,
                                previousPage: () {},
                                answerOptions: answerOptionsGender,
                                imgSrc: '',
                                isFoodPictureVisible: false,
                              );
                            } else if (index == 2) {
                              return FoodQuestionCard(
                                  bottomPadding: true,
                                  isFoodPictureVisible: false,
                                  userCallback: (dynamic val) {
                                    preQuestionnaireReference.set({
                                      '${sociodemographicQuestions[1].name}':
                                          val,
                                    }, SetOptions(merge: true));
                                    _pageControllerOne.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                    number.value =
                                        _pageControllerOne.page!.toInt();
                                  },
                                  dietQuestion:
                                      sociodemographicQuestions[1].question,
                                  backButtonVisible: true,
                                  previousPage: () {
                                    _pageControllerOne.previousPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                  },
                                  answerOptions: answerOptionsEducation,
                                  imgSrc: '');
                            } else if (index == 3) {
                              return ValueListenableBuilder<int>(
                                  valueListenable: age,
                                  builder: (context, value, child) {
                                    return PickerQuestionCard(
                                      nextButtonVisible: age.value >= 18,
                                      nextPage: () {
                                        _pageControllerOne.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.linear);
                                        number.value =
                                            _pageControllerOne.page!.toInt();
                                      },
                                      widgetList: List.generate(99, (index) {
                                        return Text(index.toString());
                                      }),
                                      imgSrc: '',
                                      backButtonVisible: true,
                                      onChanged: (val) {
                                        //print(val);
                                        //setState(() {
                                        age.value = val;
                                        //});
                                        preQuestionnaireReference.set({
                                          'age': val,
                                        }, SetOptions(merge: true));
                                      },
                                      dietQuestion:
                                          'Wie alt sind Sie?\n(Mindestalter: 18)',
                                      previousPage: () {
                                        _pageControllerOne.previousPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.linear);
                                      },
                                    );
                                  });
                            } else if (index == 4) {
                              return FoodQuestionCard(
                                  bottomPadding: true,
                                  isFoodPictureVisible: false,
                                  userCallback: (dynamic val) {
                                    userReference.set({
                                      'dietType': val,
                                    }, SetOptions(merge: true));
                                    preQuestionnaireReference.set({
                                      'dietType': val,
                                    }, SetOptions(merge: true));
                                    _pageControllerOne.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                    number.value =
                                        _pageControllerOne.page!.toInt();
                                  },
                                  dietQuestion:
                                      'Wie ernähren Sie sich aktuell?',
                                  backButtonVisible: true,
                                  previousPage: () {
                                    _pageControllerOne.previousPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                  },
                                  answerOptions: answerOptionsDietType,
                                  imgSrc: '');
                            } else if (index >= 5) {
                              //print(index);
                              return FoodQuestionCard(
                                bottomPadding: true,
                                isFoodPictureVisible: false,
                                dietQuestion:
                                    totalListQuestions[index - 5].question,
                                backButtonVisible: true,
                                previousPage: () {
                                  _pageControllerOne.previousPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                },
                                answerOptions: answerOptionsFivePoints,
                                userCallback: (dynamic val) {
                                  //print(val);
                                  //print(index);
                                  preQuestionnaireReference.set({
                                    '${totalListQuestions[index - 5].name}':
                                        val,
                                  }, SetOptions(merge: true));
                                  if (index ==
                                          (totalListQuestions.length + 4) &&
                                      val > 0) {
                                    userReference.set({
                                      'preQuestionnaireFinished': true,
                                    }, SetOptions(merge: true));
                                  }
                                  _pageControllerOne.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                  number.value =
                                      _pageControllerOne.page!.toInt();
                                },
                                imgSrc: '',
                              );
                            }
                            return Container();
                          }),
                    ),
                  ],
                ))));
  }
}
