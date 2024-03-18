import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/Screens/build_app_bars.dart';
import 'package:ecovia/SurveyScreen/consent_screen.dart';
import 'package:ecovia/SurveyScreen/food_question_card.dart';
import 'package:ecovia/SurveyScreen/picker_question_card.dart';
import 'package:ecovia/SurveyScreen/progress_bar_header.dart';
import 'package:ecovia/SurveyScreen/questions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PreQuestionnaireScreen extends StatefulWidget {
  const PreQuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<PreQuestionnaireScreen> createState() => _PreQuestionnaireScreenState();
}

class _PreQuestionnaireScreenState extends State<PreQuestionnaireScreen> {
  int pageIndex = 0;
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

  int value = 0;

  @override
  void initState() {
    super.initState();
    _pageControllerOne.addListener(() {
      // setState(() {
      //   pageIndex = _pageControllerOne.page!.toInt();
      // });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageControllerOne.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = ValueNotifier(0);
    final age = ValueNotifier(0);
    return Scaffold(
        appBar: buildPreQuestionnaireAppBar(),
        backgroundColor: Colors.white,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ValueListenableBuilder<int>(
                        valueListenable: pageIndex,
                        builder: (context, value, child) {
                          return ProgressBarHeader(
                              pageIndex: pageIndex.value,
                              pagesLength: totalListQuestions.length + 5);
                        }),
                    Expanded(
                      child: PageView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          clipBehavior: Clip.none,
                          controller: _pageControllerOne,
                          itemCount: totalListQuestions.length + 5,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return ConsentScreen(
                                  bottomPadding: true,
                                  consentText:
                                      'Vielen Dank für Ihr Interesse an der ECOVIA App. ECOVIA soll Ihnen Hilfestellung bieten, sich umweltfreundlicher zu ernähren. Vor der Einführung in die App, werden Ihnen nachfolgend zu Forschungszwecken Fragen einmalig zu Ihrer Person gestellt. Dieser Teil wird ca. 15 Minuten Ihrer Zeit in Anspruch nehmen. Bitte wählen Sie bei jeder Frage die Antwort, die Sie am ehesten repräsentiert. Alle erhobenen Daten werden anonymisiert und ausschließlich für Forschungszwecke verwendet.  \n\nWenn Sie die Datenschutzerklärung gelesen und der Erhebung Ihrer Daten unter den genannten Bedingungen zustimmen, drücken Sie unten bitte auf "Ich stimme zu", um mit dem Fragebogen zu beginnen. \n\nDie Teilnahme ist freiwillig und Sie können die Teilnahme jederzeit ohne Angabe von Gründen beenden.\n\nSie haben Fragen? Schreiben Sie uns: \nmail@ecovia.app',
                                  nextPage: () {
                                    _pageControllerOne.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                    pageIndex.value =
                                        _pageControllerOne.page!.toInt();
                                  });
                            } else if (index == 1) {
                              return FoodQuestionCard(
                                bottomPadding: true,
                                userCallback: (dynamic val) {
                                  preQuestionnaireReference.set({
                                    '${sociodemographicQuestions[0].name}': val,
                                  }, SetOptions(merge: true));
                                  _pageControllerOne.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                  pageIndex.value =
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
                                    pageIndex.value =
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
                              return ValueListenableBuilder(
                                  valueListenable: age,
                                  builder: (context, value, child) {
                                    return PickerQuestionCard(
                                      nextButtonVisible: age.value >= 18,
                                      nextPage: () {
                                        _pageControllerOne.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.linear);
                                        pageIndex.value =
                                            _pageControllerOne.page!.toInt();
                                      },
                                      widgetList: List.generate(99, (index) {
                                        return Text(index.toString());
                                      }),
                                      imgSrc: '',
                                      backButtonVisible: true,
                                      onChanged: (val) {
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
                                    pageIndex.value =
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
                                  pageIndex.value =
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
