import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../JsonObjects/survey_answers_pre_data.dart';

// ignore: must_be_immutable
class FinishScreen extends StatefulWidget with ChangeNotifier {
  FinishScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
    required this.backButtonVisible,
  }) : super(key: key);

  final dynamic nextPage;
  final dynamic previousPage;
  final bool backButtonVisible;

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
  bool backButtonVisible = true;
  //String _selected;
  int count = 0;
  bool answerSelected = false;
  dynamic nextPage;
  final DateTime date = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      print(_connectionStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<List<SurveyAnswersPreData>>(
        builder: (context, surveyAnswersPre, child) {
      if (_connectionStatus == ConnectivityResult.wifi || _connectionStatus == ConnectivityResult.mobile) {
        return Column(
          children: [
            Container(
              //height: SizeConfig.screenHeight * 0.4,
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight * 0.01,
                horizontal: SizeConfig.screenWidth * 0.02,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: const [standardBoxShadow]
                  //border: Border.all(color: Colors.black, width: 2),
                  ),
              child: Column(
                children: [
                  Text(
                    "Vielen Dank für deine Teilnahme!",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  //...List.generate(answerOptions.length,
                  //  (index) => FoodAnswer(
                  //index: index,
                  //text: answerOptions[index],
                  //),
                  //),
                  SizedBox(height: SizeConfig.defaultSize! * 1),
                  const Divider(height: 5, color: Colors.black, thickness: 1),
                  SizedBox(height: SizeConfig.defaultSize! * 1),
                  Container(
                    padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                    height: SizeConfig.defaultSize! * 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Bitte klicke auf 'Umfrage beenden', um deine Teilnahme abzuschließen!",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const Expanded(child: SizedBox()),
                        //SizedBox(height: SizeConfig.defaultSize! * 10),
                        GestureDetector(
                          onTap: widget.nextPage,
                          child: Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 61, 105, 88),
                                      kDarkGreen,
                                      Color.fromARGB(255, 63, 173, 120)
                                    ],
                                    stops: [0.001, 0.3, 0.9],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Umfrage beenden",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        //SizedBox(height: SizeConfig.defaultSize! * 2),
                        //Text(
                        //"",
                        //style: TextStyle(fontSize: 18),
                        //textAlign: TextAlign.center,
                        //),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(
                  //height: SizeConfig.defaultSize! * 2,
                  ),
            ),
            SizedBox(height: SizeConfig.defaultSize! * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: widget.backButtonVisible,
                  child: Container(
                    width: SizeConfig.defaultSize! * 5,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: IconButton(
                        onPressed: widget.previousPage,
                        icon: const Icon(Icons.navigate_before),
                        iconSize: SizeConfig.defaultSize! * 3),
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return Center(
          child: Column(
            children: [
              CircularProgressIndicator(color: kLightGreen),
              SizedBox(height: SizeConfig.screenHeight * 0.01,),
              Text('Warte auf Netzwerkverbindung...', style: TextStyle(fontSize: SizeConfig.screenHeight * 0.018, color: Colors.grey[600]),),
            ],
          ),
        );
      }
    });
  }
}
