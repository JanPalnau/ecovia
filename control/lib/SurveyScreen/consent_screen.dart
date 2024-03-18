import 'package:ecovia_control/size_config.dart';
import 'package:flutter/material.dart';
import 'package:ecovia_control/constants.dart';

import '../Drawer/privacy_screen.dart';
import '../animated_gradient_box.dart';

// ignore: must_be_immutable
class ConsentScreen extends StatefulWidget with ChangeNotifier {
  ConsentScreen({
    Key? key,
    required this.nextPage,
    required this.consentText,
    required this.bottomPadding,
  }) : super(key: key);

  final dynamic nextPage;
  final String consentText;
  bool bottomPadding;

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool backButtonVisible = true;
  //String? _selected;
  int count = 0;
  bool answerSelected = false;
  dynamic nextPage;

  //final ScrollController _scrollController = ScrollController();
  //bool _scrollable = false;

  // @override
  // void initState() {
  //   super.initState();
  //   // WidgetsBinding.instance.addPostFrameCallback((_) => _getIsScrollable());
  // }

  // _getIsScrollable() {
  //   _scrollable = _scrollController.position.pixels !=
  //       _scrollController.position.maxScrollExtent;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.screenHeight * 0.02,
              horizontal: SizeConfig.screenWidth * 0.02,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [standardBoxShadow]
                //color: kLightGreen.withOpacity(0.5),
                //border: Border.all(color: Colors.black, width: 0),
                ),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Text("Datenschutzerklärung",
                      style: TextStyle(
                        color: kDarkGreen, fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize! * 2
                      )),
                ),
                //...List.generate(answerOptions.length,
                //  (index) => FoodAnswer(
                //index: index,
                //text: answerOptions[index],
                //),
                //),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                const Divider(
                    height: 5,
                    color: Color.fromARGB(255, 192, 192, 192),
                    thickness: 1),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Flexible(
                  flex: 5,
                  child: Container(
                    //height: SizeConfig.screenHeight * 0.35,
                    padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 192, 192, 192),
                            width: 1)),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              widget.consentText,
                              style: TextStyle(
                              fontSize: SizeConfig.defaultSize! * 1.7, 
                              //height: 1.25
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'Datenschutzerklärung lesen',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: kNeonGreen,
                                fontSize: SizeConfig.defaultSize! * 1.7, 
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PrivacyScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //if (_scrollable)
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: SizeConfig.defaultSize! * 2,
                    height: SizeConfig.defaultSize! * 2,
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.double_arrow_outlined,
                          color: kDarkGreen,
                        )),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                //SizedBox(height: SizeConfig.defaultSize! * 1,),
                // ListView.builder(
                //   itemBuilder: (context, index) {
                //return
                Flexible(
                  flex: 1,
                  child: AnimatedGradientBox(
                    boxShadowList: animatedGradientBoxShadow,
                    width: SizeConfig.screenWidth * 0.6,
                    //boxHeight: SizeConfig.screenHeight * 0.05,
                    child: TextButton(
                      onPressed: widget.nextPage,
                      child: Text(
                        'Ich stimme zu',
                        style: TextStyle(color: Colors.white, 
                        fontSize: SizeConfig.screenHeight * 0.03,
                        ),
                      )
                    ),
                  ),
                ),
                //   },
                //   itemCount: 1,
                //   shrinkWrap: true,
                // ),
              ],
            ),
          ),
        ),
        // SizedBox(height: SizeConfig.defaultSize! * 2),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Visibility(
        //       visible: (answerSelected == true) == true,
        //       child: Container(
        //         width: SizeConfig.defaultSize! * 5,
        //         margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3),
        //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.black, width: 2),),
        //           child: IconButton(
        //               onPressed: widget.nextPage,
        //               icon: Icon(Icons.navigate_next),
        //               iconSize: SizeConfig.defaultSize! * 3),
        //       ),
        //     ),
        //   ],
        // ),
        widget.bottomPadding? SizedBox(height: SizeConfig.defaultSize! * 2) : Container(),
      ],
    );
  }
}
