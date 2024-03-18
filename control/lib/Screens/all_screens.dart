import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia_control/JsonObjects/user_data.dart';
import 'package:ecovia_control/Push%20Notifications/notification_api.dart';
import 'package:ecovia_control/Push%20Notifications/push_notifications.dart';
import 'package:ecovia_control/Drawer/drawer.dart';
import 'package:ecovia_control/Screens/pre_questionnaire_screen.dart';
import 'package:ecovia_control/Screens/state_container.dart';
import 'package:ecovia_control/SurveyScreen/survey_body.dart';
import 'package:ecovia_control/constants.dart';
import 'package:ecovia_control/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../References/references.dart';
import 'build_app_bars.dart';

class AllScreens extends StatefulWidget {
  const AllScreens({
    Key? key,
  }) : super(key: key);

  // ignore: constant_identifier_names
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  //final bool _isVisible = false;

  @override
  State<AllScreens> createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  // final _pages = [
  //   SurveyBody(),
  // ];

  // int _selectedItem = 0;
  DocumentReference userReference =
      userCollection.doc(FirebaseAuth.instance.currentUser!.uid);
  final DateTime date = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  late GlobalKey _homeKey = GlobalKey();
  late GlobalKey _environmentKey = GlobalKey();
  late GlobalKey _goalsKey = GlobalKey();
  late GlobalKey _recipesKey = GlobalKey();
  late GlobalKey _surveyKey = GlobalKey();
  late GlobalKey _profileKey = GlobalKey();
  late GlobalKey _homeKeyOne = GlobalKey();
  late GlobalKey _homeKeyTwo = GlobalKey();
  late GlobalKey _homeKeyThree = GlobalKey();
  late GlobalKey _environmentKeyOne = GlobalKey();
  late GlobalKey _environmentKeyTwo = GlobalKey();
  late GlobalKey _goalsKeyOne = GlobalKey();
  late GlobalKey _goalsKeyTwo = GlobalKey();
  late GlobalKey _recipesKeyOne = GlobalKey();
  late GlobalKey _recipesKeyTwo = GlobalKey();
  late GlobalKey _recipesKeyThree = GlobalKey();
  late GlobalKey _recipesKeyFour = GlobalKey();
  late GlobalKey _recipesKeyFive = GlobalKey();
  late GlobalKey _surveyKeyOne = GlobalKey();
  late GlobalKey _profileKeyOne = GlobalKey();
  late GlobalKey _ecoPointsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    NotificationApi.init(initScheduled: true);
    //listenNotifications();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isFirstLaunch().then((result) {
        //print('firstLaunch?:');
        //print(result);
        if (result == true && !kIsWeb) {
          ShowCaseWidget.of(context).startShowCase([
            _homeKey,
            _environmentKey,
            _goalsKey,
            _recipesKey,
            _surveyKey,
            _profileKey,
            _homeKeyOne,
            _homeKeyTwo,
            _homeKeyThree,
            _environmentKeyOne,
            _environmentKeyTwo,
            _goalsKeyOne,
            _goalsKeyTwo,
            _recipesKeyOne,
            _recipesKeyTwo,
            _recipesKeyThree,
            _recipesKeyFour,
            _recipesKeyFive,
            _surveyKeyOne,
            _profileKeyOne,
            _ecoPointsKey
          ]);
        }
      });
    });

    // Timer timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   if (mounted) {
    //     if (_infoboxVisible == true) {
    //       if (infoIndex < infoStatements.length - 1) {
    //         setState(() {
    //           infoIndex++;
    //         });
    //       } else if (infoIndex == infoStatements.length - 1) {
    //         setState(() {
    //           infoIndex = 0;
    //         });
    //       }
    //       ;
    //       if (_infoboxColor == kLightGreen) {
    //         setState(() {
    //           _infoboxColor = kDarkGreen;
    //         });
    //       } else if (_infoboxColor == kDarkGreen) {
    //         setState(() {
    //           _infoboxColor = kLightYellow;
    //           _titleColor = Colors.black;
    //           _statementColor = Colors.black;
    //         });
    //       } else if (_infoboxColor == kLightYellow) {
    //         setState(() {
    //           _infoboxColor = kLightGreen;
    //           _titleColor = Colors.white;
    //           _statementColor = Colors.white;
    //         });
    //       }
    //     }
    //   }
    // });
  }

  // void listenNotifications() =>
  //     NotificationApi.onNotifications.stream.listen(onClickedNotification);

  // void onClickedNotification(String? payload) {
  //   var pageProvider = Provider.of<PageNotifier>(context, listen: false);
  //   //print(pageProvider.currentPage);
  // }

  @override
  Widget build(BuildContext context) {
    // final databaseService = Provider.of<DatabaseService>(context);
    // databaseService.updateUserData(RecipeCatalog().recipes);
    SizeConfig().init(context);
    final stateContainer = StateContainer.of(context);
    _homeKey = stateContainer.homeKey;
    _environmentKey = stateContainer.environmentKey;
    _goalsKey = stateContainer.ingredientsKey;
    _recipesKey = stateContainer.recipesKey;
    _surveyKey = stateContainer.surveyKey;
    _profileKey = stateContainer.profileKey;
    _homeKeyOne = stateContainer.homeKeyOne;
    _homeKeyTwo = stateContainer.homeKeyTwo;
    _homeKeyThree = stateContainer.homeKeyThree;
    _environmentKeyOne = stateContainer.environmentKeyOne;
    _environmentKeyTwo = stateContainer.environmentKeyTwo;
    _goalsKeyOne = stateContainer.dietGoalsKeyOne;
    _goalsKeyTwo = stateContainer.dietGoalsKeyTwo;
    _recipesKeyOne = stateContainer.recipesKeyOne;
    _recipesKeyTwo = stateContainer.recipesKeyTwo;
    _recipesKeyThree = stateContainer.recipesKeyThree;
    _recipesKeyFour = stateContainer.recipesKeyFour;
    _recipesKeyFive = stateContainer.recipesKeyFive;
    _surveyKeyOne = stateContainer.surveyKeyOne;
    _profileKeyOne = stateContainer.profileKeyOne;
    _ecoPointsKey = stateContainer.ecoPointsKey;
    SizeConfig().init(context);
    return Consumer<UserData>(
        // ignore: missing_return
        builder: (context, userSnapshot, child) {
      //print(userSnapshot.loginDateSubmitted);

      // if (userSnapshot.hasError) {
      //   return Text(
      //       "Etwas ist schiefgelaufen. Überprüfe deine Internetverbindung.");
      // }
      // if (userSnapshot.connectionState == ConnectionState.waiting) {
      //   return Center(
      //     child: CircularProgressIndicator(color: kLightGreen),
      //   );
      // }

      //bool? studyFinished = userSnapshot.studyCompleted;

      // String formattedDate = dateFormat.format(date);
      // DateTime currentDate = dateFormat.parse(formattedDate);
      // DateTime registerDate = dateFormat.parse('2022-06-23');
      // DateTime followUpDate = DateTime(registerDate.year, registerDate.month + 1, registerDate.day);
      // if (userSnapshot.preQuestionnaireFinished == null) {
      //   return const CircularProgressIndicator(color: kDarkGreen);
      // }
      if (userSnapshot.preQuestionnaireFinished == false) {
        return const PreQuestionnaireScreen();
      } else if (userSnapshot.preQuestionnaireFinished == true) {
        // if (userSnapshot.loginDateSubmitted == false) {
        //   userReference.set(
        //       {'loginDate': dateFormat.format(date)}, SetOptions(merge: true));
        // }
        DateTime loginDate = dateFormat.parse(userSnapshot.loginDate!);
        int interventionDay = date.difference(loginDate).inDays;

        // return Consumer<PageNotifier>(
        //   builder: (context, pageProvider, child) {
        // _selectedItem = pageProvider.currentPage;
        // return Consumer<List<SurveyAnswersPostData>>(
        //     builder: (context, surveyAnswerSnapshot, child) {
        // if (snapshot.hasError) {
        //   return Text(
        //       "Etwas ist schiefgelaufen. Überprüfe deine Internetverbindung.");
        // }
        // if (snapshot.connectionState ==
        //     ConnectionState.waiting) {
        //   return Center(
        //     child:
        //         CircularProgressIndicator(color: kLightGreen),
        //   );
        // }
        //if (surveyAnswerSnapshot.length < 30) {
        //NotificationApi.showNotification(title: 'xd', body: 'lol', payload: 'jasdjasdas');

        if (userSnapshot.pushNotificationsEnabled == true) {
          if (interventionDay <= 30) {
            NotificationApi.showScheduledNotification(
                title: 'ECOVIA - Ernährungsprotokoll',
                body: eveningDescriptions
                    .elementAt(Random().nextInt(eveningDescriptions.length)),
                payload: '6pm',
                scheduledTime: const Time(18, 00, 0));
          }
          if (interventionDay >= 60) {
            if (userSnapshot.followUpCompleted == false) {
              NotificationApi.showScheduledNotification(
                  title: 'ECOVIA',
                  body:
                      "Bitte beantworte zum Abschluss noch einmal das Ernährungsprotokoll, um unsere Forschung mit deiner Folgeerhebung zu unterstützen. Vielen Dank!",
                  payload: '11am',
                  scheduledTime: const Time(11, 00, 0));
              NotificationApi.showScheduledNotification(
                  title: 'ECOVIA',
                  body:
                      "Bitte beantworte zum Abschluss noch einmal das Ernährungsprotokoll, um unsere Forschung mit deiner Folgeerhebung zu unterstützen. Vielen Dank!",
                  payload: '6pm',
                  scheduledTime: const Time(18, 00, 0));
            }
          }
        }
        // }
        if (interventionDay <= 30) {
          return Scaffold(
              extendBody: true,
              drawer: EcoviaDrawer(),
              appBar: buildAppBar(),
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.white,
              body: SurveyBody()

              //MyBottomNavBar(nextPage: () {
              //_pageController.animateTo(, duration: duration, curve: curve)
              //},),
              );
        } else if (interventionDay > 30 && interventionDay < 60) {
          userReference.set({
            'email': FieldValue.delete(),
          }, SetOptions(merge: true));
          return Scaffold(
              appBar: buildPreQuestionnaireAppBar(),
              drawer: const EcoviaDrawer(),
              body: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(gradient: backgroundGradient()),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.02,
                            vertical: SizeConfig.screenHeight * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                SizeConfig.defaultSize! * 2),
                            boxShadow: const [standardBoxShadow]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Vielen Dank für deine Teilnahme an der Studie! Falls du als Studierende/r teilgenommen hast, sende bitte den folgenden Code an",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight * 0.02),
                            ),
                            TextButton(
                                onPressed: () async {
                                  await launchUrl(Uri(
                                      scheme: 'mailto',
                                      path: 'mail@ecovia.app',
                                      queryParameters: {
                                        'subject':
                                            'ECOVIA Versuchspersonenstunden',
                                        'body': FirebaseAuth
                                            .instance.currentUser!.uid
                                            .toString()
                                            .substring(0, 15),
                                      }));
                                },
                                child: Text(
                                  "mail@ecovia.app",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.screenHeight * 0.02),
                                )),
                            Text(
                              "um deine Versuchspersonenstunden zu erhalten:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight * 0.02),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.05),
                            Container(
                              padding:
                                  EdgeInsets.all(SizeConfig.defaultSize! * 1),
                              decoration: BoxDecoration(
                                  color: kDarkGreen,
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.defaultSize! * 2)),
                              child: SelectableText(
                                FirebaseAuth.instance.currentUser!.uid
                                    .toString()
                                    .substring(0, 15),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: SizeConfig.screenHeight * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.05),
                            Text(
                              "Wir bitten dich nach 30 Tagen noch an der Follow-Up Erhebung teilzunehmen. Dazu schicken wir Dir dann eine Push-Benachrichtigung. Dann kannst du hier ein letztes Mal den Ernährungsfragebogen beantworten. Lasse die App deshalb bis dahin installiert. Vielen Dank!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight * 0.02),
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 5,
                            ),
                            // Text(
                            //   "Gerne kannst du die App auch nach deiner Teilnahme weiterhin nutzen:",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(fontSize: SizeConfig.screenHeight * 0.025),
                            // ),

                            // ButtonWithRoundBorder(
                            //     text: "Zurück zur App",
                            //     onPressed: userReference.set({
                            //       'studyCompleted': true,
                            //     }, SetOptions(merge: true))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )));
        } else if (interventionDay >= 60 && !userSnapshot.followUpCompleted!) {
          userReference.set({'email': FirebaseAuth.instance.currentUser!.email},
              SetOptions(merge: true));
          return Scaffold(
              extendBody: true,
              drawer: EcoviaDrawer(),
              appBar: buildAppBar(),
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.white,
              body: SurveyBody()

              //MyBottomNavBar(nextPage: () {
              //_pageController.animateTo(, duration: duration, curve: curve)
              //},),
              );
        } else if (interventionDay >= 60 && userSnapshot.followUpCompleted!) {
          return Scaffold(
              appBar: buildAppBar(),
              drawer: const EcoviaDrawer(),
              body: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(gradient: backgroundGradient()),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.02,
                            vertical: SizeConfig.screenHeight * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                SizeConfig.defaultSize! * 2),
                            boxShadow: const [standardBoxShadow]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Vielen Dank für deine Teilnahme an der Follow-Up Erhebung! Deine Studienteilnahme ist nun endgültig erledigt. ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight * 0.025),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.05),
                            Text(
                              "In der Zukunft wirst du die ECOVIA App auch unabhängig unserer Studie nutzen können.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight * 0.025),
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 5,
                            ),
                            // Text(
                            //   "Gerne kannst du die App auch nach deiner Teilnahme weiterhin nutzen:",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(fontSize: SizeConfig.screenHeight * 0.025),
                            // ),

                            // ButtonWithRoundBorder(
                            //     text: "Zurück zur App",
                            //     onPressed: userReference.set({
                            //       'studyCompleted': true,
                            //     }, SetOptions(merge: true))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )));
        }
        return Container();
        //return interventionDay > 3 && studyFinished == false ?
      }
      return Container();
    });
  }

  Future<bool> _isFirstLaunch() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setBool(
    //        AllScreens.PREFERENCES_IS_FIRST_LAUNCH_STRING, true);
    bool isFirstLaunch = sharedPreferences
            .getBool(AllScreens.PREFERENCES_IS_FIRST_LAUNCH_STRING) ??
        true;

    if (isFirstLaunch == true) {
      sharedPreferences.setBool(
          AllScreens.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);
    }

    return isFirstLaunch;
  }
}
