import 'dart:async';
import 'package:ecovia/HomeScreen/home_infos.dart';
import 'package:ecovia/HomeScreen/paula_clickable_text_box.dart';
import 'package:ecovia/HomeScreen/paula_text_box.dart';
import 'package:ecovia/JsonObjects/survey_answers_post_data.dart';
import 'package:ecovia/JsonObjects/user_data.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:ecovia/info_box.dart';
import 'package:ecovia/showcase_labels_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/size_config.dart';
import 'package:ecovia/constants.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'paula_statements.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/References/references.dart';
import 'package:intl/intl.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  late AnimationController animationControllerPaulaInitial;
  late Animation<int> animation;
  final DateTime date = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  double goalCO2 = 2.5;
  int paulaIndex = 0;
  int infoIndex = 0;
  bool? paulaTextBoxVisible;
  //bool _paulaVisible = true;
  //final String _infoTitle = infoStatements[0].title;
  //final String _infoStatement = infoStatements[0].statement;

  // @override
  // void initState() {
  //   super.initState();
  //   NotificationApi.init(initScheduled: true);
  //   listenNotifications();
  //   // Timer timer = Timer.periodic(Duration(seconds: 5), (timer) {
  //   //   if (mounted) {
  //   //     if (_infoboxVisible == true) {
  //   //       if (infoIndex < infoStatements.length - 1) {
  //   //         setState(() {
  //   //           infoIndex++;
  //   //         });
  //   //       } else if (infoIndex == infoStatements.length - 1) {
  //   //         setState(() {
  //   //           infoIndex = 0;
  //   //         });
  //   //       }
  //   //       ;
  //   //       if (_infoboxColor == kLightGreen) {
  //   //         setState(() {
  //   //           _infoboxColor = kDarkGreen;
  //   //         });
  //   //       } else if (_infoboxColor == kDarkGreen) {
  //   //         setState(() {
  //   //           _infoboxColor = kLightYellow;
  //   //           _titleColor = Colors.black;
  //   //           _statementColor = Colors.black;
  //   //         });
  //   //       } else if (_infoboxColor == kLightYellow) {
  //   //         setState(() {
  //   //           _infoboxColor = kLightGreen;
  //   //           _titleColor = Colors.white;
  //   //           _statementColor = Colors.white;
  //   //         });
  //   //       }
  //   //     }
  //   //   }
  //   // });
  // }

  // void listenNotifications() =>
  //     NotificationApi.onNotifications.stream.listen(onClickedNotification);

  // void onClickedNotification(String payload) {
  //   var pageProvider = Provider.of<PageNotifier>(context, listen: false);
  //   var controllerProvider =
  //       Provider.of<ControllerNotifier>(context, listen: false);
  //   if (payload == 'reminder_7pm') {
  //     controllerProvider.pageController.jumpToPage(3);
  //     pageProvider.setCurrentPage = 3;
  //   } else if (payload == 'reminder_10am') {
  //     controllerProvider.pageController.jumpToPage(1);
  //     pageProvider.setCurrentPage = 1;
  //   } else if (payload == 'reminder_3pm') {
  //     controllerProvider.pageController.jumpToPage(2);
  //     pageProvider.setCurrentPage = 2;
  //   }

  //   print(pageProvider.currentPage);
  // }

  Timer? _timer;
  //final int _currentPage = 0;

  late TabController? _tabController;
  late PageController? _pageController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (_tabController!.index < 2) {
        _pageController!.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      } else {
        _pageController!.jumpToPage(_tabController!.index - 2);
      }
    });
    //..animateTo(_currentPage);
    animationControllerPaulaInitial =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        IntTween(begin: 0, end: paulaStatementsInitial[0].statement!.length)
            .animate(animationControllerPaulaInitial);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tabController?.dispose();
    animationControllerPaulaInitial.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DocumentReference userReference = userCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    //print(_currentPage);
    //Provider.of<AuthenticationService>(context).signOut();
    final container = StateContainer.of(context);
    double co2Cutoff = 0;
    List<String> dietTypes = [
      'Mischköstler mit hohem Fleischkonsum',
      'Mischköstler mit moderatem Fleischkonsum',
      'Mischköstler mit geringem Fleischkonsum',
      'Vegetarier'
    ];
    String referenceDietType = '';
    GlobalKey homeKeyOne = container.homeKeyOne;
    GlobalKey homeKeyTwo = container.homeKeyTwo;
    GlobalKey homeKeyThree = container.homeKeyThree;
    //bool infoboxVisible = false;
    bool conditionCO2 = false;
    bool paulaConditionCO2 = false;
    // List<TyperAnimatedText> typerAnimatedTexsts = [];
    // for (var element in paulaStatementsInitial) {typerAnimatedTexsts.add(element.statement);}
    // print(typerAnimatedTexsts);
    return Consumer<UserData>(builder: (context, userSnapshot, child) {
      DateTime loginDate = dateFormat.parse(userSnapshot.loginDate!);

      int interventionDay = date.difference(loginDate).inDays > 29
          ? 29
          : date.difference(loginDate).inDays;
      referenceDietType = dietTypes[userSnapshot.dietType!];
      return Consumer<List<SurveyAnswersPostData>>(
          // ignore: missing_return
          builder: (context, snapshotPost, child) {
        // if (snapshotTwo.hasError) {
        //   return Text("Etwas ist schiefgelaufen.");
        // }
        // if (snapshotTwo.connectionState == ConnectionState.waiting) {
        //   return Center(
        //     child: CircularProgressIndicator(color: kLightGreen),
        //   );
        // }
        //print('snapshot length: ${snapshotPost.length}');
        if (userSnapshot.dietType == 0) {
          co2Cutoff = 7.19;
        } else if (userSnapshot.dietType == 1) {
          co2Cutoff = 5.63;
        } else if (userSnapshot.dietType == 2) {
          co2Cutoff = 4.67;
        } else if (userSnapshot.dietType == 3) {
          co2Cutoff = 3.91;
        }
        if (snapshotPost.isNotEmpty) {
          paulaTextBoxVisible = false;

          // NotificationApi.showScheduledNotification(
          //     title: 'Planty',
          //     body:
          //         'Vergiss nicht dein Ernährungstagebuch auszufüllen 🐣',
          //     payload: '7pm',
          //     scheduledTime: Time(21, 43, 0));
          //bool paulaCondition = (days[0]['totalSafeCO2'] <= 2.5 || days[0]['totalSafeCO2'] <= days[1]['totalSafeCO2']);
          if (snapshotPost.length > 1) {
            paulaTextBoxVisible = snapshotPost.isNotEmpty &&
                    (snapshotPost[0].totalSafeCO2! <
                        snapshotPost[1].totalSafeCO2!) ||
                (snapshotPost[0].totalSafeCO2! < co2Cutoff);
            conditionCO2 =
                snapshotPost[0].totalSafeCO2! < snapshotPost[1].totalSafeCO2! ||
                    snapshotPost[0].totalSafeCO2! < co2Cutoff;
            if (conditionCO2 == true &&
                userSnapshot.ecoPointsReceived == false) {
              userReference.set({
                'ecoPoints': FieldValue.increment(10),
                'ecoPointsReceived': true
              }, SetOptions(merge: true));
            }
            //|| snapshotPost[0].totalSafeCO2 <= 2.5;
            if (snapshotPost.length >= 6) {
              paulaConditionCO2 = ((snapshotPost[0].totalSafeCO2! +
                              snapshotPost[1].totalSafeCO2! +
                              snapshotPost[2].totalSafeCO2!) /
                          3) <
                      ((snapshotPost[3].totalSafeCO2! +
                              snapshotPost[4].totalSafeCO2! +
                              snapshotPost[5].totalSafeCO2!) /
                          3) ||
                  ((snapshotPost[0].totalSafeCO2! +
                              snapshotPost[1].totalSafeCO2! +
                              snapshotPost[2].totalSafeCO2!) /
                          3) <
                      co2Cutoff;
              bool conditionBackgroundPaulaPositive =
                  userSnapshot.currentBackground! <= 6 &&
                      userSnapshot.currentPaula! <= 3;
              bool conditionBackgroundPaulaNegative =
                  userSnapshot.currentBackground! >= 0 &&
                      userSnapshot.currentPaula! >= 0;
                      //print(paulaConditionCO2);
              if (userSnapshot.updatedBackground == false) {
                if (snapshotPost.length >= 6) {
                  if (paulaConditionCO2 == false &&
                      conditionBackgroundPaulaNegative &&
                      conditionBackgroundPaulaPositive) {
                    if (userSnapshot.currentPaula! >= 0) {
                      userReference.set({
                        'currentPaula': FieldValue.increment(-1),
                        'updatedBackground': true,
                      }, SetOptions(merge: true));
                    }
                    if (userSnapshot.currentBackground! >= 0) {
                      userReference.set({
                        'currentBackground': FieldValue.increment(-1),
                        'updatedBackground': true,
                      }, SetOptions(merge: true));
                    }
                  } else if (paulaConditionCO2 == true &&
                      conditionBackgroundPaulaNegative &&
                      conditionBackgroundPaulaPositive) {
                    if (userSnapshot.currentPaula! < 3) {
                      userReference.set({
                        'currentPaula': FieldValue.increment(1),
                        'updatedBackground': true,
                      }, SetOptions(merge: true));
                      if (userSnapshot.currentBackground! < 6) {
                        userReference.set({
                          'currentBackground': FieldValue.increment(1),
                          'updatedBackground': true,
                        }, SetOptions(merge: true));
                      }
                    }
                  }
                }
              }
            }
          }
        }
        if (snapshotPost.isEmpty) {
          //print('snapshotPost is empty');
          paulaTextBoxVisible = false;
        }
        animationControllerPaulaInitial.forward();

        //ISSUE WITH RANGE IS WITHIN THE STACK
        return Stack(
          children: [
            InkWell(
              onTap: () {
                if (userSnapshot.paulaStatementsInitial == false) { 
                if (animationControllerPaulaInitial.isAnimating) {
                  animationControllerPaulaInitial.fling();
                }
                if (animationControllerPaulaInitial.isCompleted) {
                  if (paulaIndex < paulaStatementsInitial.length - 1) {
                    animationControllerPaulaInitial.reset();
                    setState(() {
                      paulaIndex++;
                      //print(paulaIndex);
                    });
                    animation = IntTween(
                            begin: 0,
                            end: paulaStatementsInitial[paulaIndex]
                                .statement!
                                .length)
                        .animate(animationControllerPaulaInitial);
                    animationControllerPaulaInitial.forward();
                    if (paulaIndex == paulaStatementsInitial.length - 1) {
                      Future.delayed(const Duration(seconds: 5), () {
                        userReference.set({
                          'paulaStatementsInitial': true,
                        }, SetOptions(merge: true));
                      });
                    }
                  }
                  //if (paulaIndex == paulaStatementsInitial.length - 1) {}
                }
              }
              },
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.05),
                child: AnimatedSwitcher(
                  key: UniqueKey(),
                  duration: const Duration(milliseconds: 2000),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: backgroundImageList[
                              userSnapshot.currentBackground!],
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // Visibility(
                        //   visible: _infoboxVisible,
                        //   child: InfoBox(
                        //     title: infoStatements[infoIndex].title,
                        //     description:
                        //         infoStatements[infoIndex].statement,
                        //     color: _infoboxColor,
                        //     titleColor: _titleColor,
                        //     statementColor: _statementColor,
                        //     onPressed: () {},
                        //   ),
                        // ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        Expanded(
                          //fit: FlexFit.tight,
                          child: Visibility(
                            visible: userSnapshot.paulaStatementsInitial!,
                            replacement: SizedBox(
                              //height: SizeConfig.defaultSize! * 10,
                              child: PageView(
                                controller: _pageController,
                                children: [
                                  Container(),
                                  Container(),
                                  Container()
                                ],
                              ),
                            ),
                            child: Showcase(
                              key: homeKeyThree,
                              description: showCaseLabels[8],
                              tooltipBorderRadius: BorderRadius.circular(16),
                              tooltipPadding: const EdgeInsets.all(8),
                              child: NotificationListener<HomeTimerSwitch>(
                                onNotification: (notification) {
                                  _timer!.cancel();
                                  return true;
                                },
                                child: HomeInfoBoxPageView(
                                  onPageChanged: (index) {
                                    _tabController!.index = index!;
                                    _timer?.cancel();
                                  },
                                  interventionDay: interventionDay,
                                  infos: homeInfos,
                                  pageController: _pageController,
                                  tabController: _tabController,
                                  //height: SizeConfig.defaultSize! * 25,
                                  color: kNeonGreen,
                                  titleColor: Colors.white,
                                  descriptionColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Flexible(
                        //   child: SizedBox(
                        //     height: SizeConfig.defaultSize! * 5,
                        //   ),
                        // ),
                        PaulaClickableTextBox(
                          visible: !userSnapshot.paulaStatementsInitial!,
                          animation: animation,
                          text: paulaStatementsInitial[paulaIndex].statement!,
                        ),
                        //     onTap: () {
                        //       if (paulaIndex <=
                        //           paulaStatementsInitial.length) {
                        //         setState(() {
                        //           paulaIndex++;
                        //           print(paulaIndex);
                        //         });
                        //       } else {
                        //         paulaReference.set({
                        //           'paulaStatementsInitial': true,
                        //         }, SetOptions(merge: true));
                        //       }
                        //     },
                        //   visible: !userSnapshot.paulaStatementsInitial,
                        //   animatedTextKit: paulaStatementsInitial[paulaIndex].statement,
                        // ),

                        PaulaTextBox(
                            visible: paulaTextBoxVisible! &&
                                !userSnapshot.feedbackReceived!,
                            textFontSize: SizeConfig.defaultSize! * 1.8,
                            // snapshotPost.isNotEmpty &&
                            //     userSnapshot.feedbackReceived == false &&
                            //     conditionCO2,
                            // visible: is todays date one day after last surveyanswerdate?
                            text: snapshotPost.isNotEmpty &&
                                    snapshotPost[0].totalSafeCO2! < co2Cutoff
                                ? "Super, mit ${snapshotPost.isNotEmpty ? (snapshotPost[0].totalSafeCO2)!.toStringAsFixed(2) : ""} kg CO₂ du hast gestern durch deine Ernährung weniger CO₂ als ein $referenceDietType verursacht!" +
                                    (paulaConditionCO2
                                        ? ""
                                        : " Bleib weiterhin dran, damit Lea und ihre Umwelt wächst.")
                                : "Super, mit ${snapshotPost.isNotEmpty ? (snapshotPost[0].totalSafeCO2)!.toStringAsFixed(2) : ""} kg CO₂ hast du gestern durch deine Ernährung weniger CO₂ als am Vortag verursacht!" +
                                    (paulaConditionCO2
                                        ? ""
                                        : " Bleib weiterhin dran, damit Lea und ihre Umwelt wächst.")),
                        // Flexible(
                        //   child: SizedBox(
                        //     height: SizeConfig.defaultSize! * 6,
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Showcase(
                              key: homeKeyOne,
                              description: showCaseLabels[6],
                              tooltipBorderRadius: BorderRadius.circular(16),

                              tooltipPadding: const EdgeInsets.all(8),
                              //shapeBorder: const CircleBorder(),
                              child: Showcase(
                                key: homeKeyTwo,
                                description: showCaseLabels[7],
                                targetBorderRadius: BorderRadius.circular(16),
                                targetPadding: const EdgeInsets.all(8),
                                tooltipBorderRadius: BorderRadius.circular(16),
                                tooltipPadding: const EdgeInsets.all(8),
                                child: AnimatedSwitcher(
                                  key: ValueKey(userSnapshot.currentPaula),
                                  duration: const Duration(milliseconds: 2000),
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 15,
                                    width: SizeConfig.defaultSize! * 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: paulaImageList[
                                            userSnapshot.currentPaula!],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.06,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      });
    });
    //}
    // );
  }

  bool get wantKeepAlive => true;
}
