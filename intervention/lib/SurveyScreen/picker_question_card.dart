import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../RecipeScreen/animated_gradient_box.dart';
import 'package:ecovia/constants.dart';

class PickerQuestionCard extends StatefulWidget {
  const PickerQuestionCard({
    Key? key,
    required this.dietQuestion,
    required this.backButtonVisible,
    required this.previousPage,
    required this.imgSrc,
    this.userCallback,
    required this.widgetList,
    required this.onChanged,
    required this.nextPage,
    required this.nextButtonVisible,
  }) : super(key: key);

  final List<Widget> widgetList;
  final String? dietQuestion;
  final bool backButtonVisible, nextButtonVisible;
  final dynamic previousPage;
  final dynamic nextPage;
  final String? imgSrc;
  final Function(int?)? userCallback;
  final dynamic onChanged;

  @override
  State<PickerQuestionCard> createState() => _PickerQuestionCardState();
}

class _PickerQuestionCardState extends State<PickerQuestionCard>
    with AutomaticKeepAliveClientMixin<PickerQuestionCard> {
  bool backButtonVisible = true;
  //int? _selected;
  int count = 0;
  bool answerSelected = false;
  int? userAnswer;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.screenHeight * 0.02),
            decoration: BoxDecoration(
              color: Colors.red,
                borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
                //color: kLightGreen.withOpacity(0.7),
                gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  stops: [0.7, 0.9],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(150, 0, 0, 0),
                    blurRadius: 15.0,
                    spreadRadius: 0.0,
                    offset: Offset(0, 4), // shadow direction: bottom right
                  ),
                ]),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView(
                    children: [
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.defaultSize! * 2,
                                      bottom: SizeConfig.defaultSize! * 1,
                                      top: SizeConfig.defaultSize! * 2),
                                  child: AutoSizeText(widget.dietQuestion!,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: kDarkGreen, fontSize: 20)),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Visibility(
                                          replacement: IconButton(
                                            icon: const Icon(
                                              Icons.rotate_left_sharp,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {},
                                            iconSize:
                                                SizeConfig.defaultSize! * 3,
                                          ),
                                          visible: widget.backButtonVisible,
                                          child: IconButton(
                                            icon: const Icon(
                                                Icons.rotate_left_sharp),
                                            onPressed: widget.previousPage,
                                            iconSize:
                                                SizeConfig.defaultSize! * 3,
                                          )),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Visibility(
                                        visible: false,
                                        child: Icon(
                                          Icons
                                              .keyboard_double_arrow_right_rounded,
                                          color: kDarkGreen,
                                          size: SizeConfig.defaultSize! * 3,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Visibility(
                                        visible: true,
                                        child: Icon(
                                          Icons.rotate_left_sharp,
                                          color: Colors.white,
                                          size: SizeConfig.screenHeight * 0.03,
                                        ),
                                      ),
                                    ),

                                    //Container()
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Visibility(
                        visible: false,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Referenz für Portionsgröße',
                              style: TextStyle(
                                  color: kDarkGreen,
                                  //fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Image(
                                //height: SizeConfig.screenHeight * 0.05,
                                //width: SizeConfig.screenWidth * 0.1,
                                fit: BoxFit.contain,
                                image: AssetImage(widget.imgSrc!),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //...List.generate(answerOptions.length,
                //  (index) => FoodAnswer(
                //index: index,
                //text: answerOptions[index],
                //),
                //),
                //SizedBox(height: SizeConfig.defaultSize! * 0.5),
                //SizedBox(height: SizeConfig.defaultSize! * 0.5),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(height: 5, color: kDarkGreen, thickness: 1)),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: CupertinoPicker(
                        onSelectedItemChanged: widget.onChanged,
                        itemExtent: SizeConfig.defaultSize! * 3,
                        children: widget.widgetList),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
                      child: Visibility(
                        maintainState: true,
                        maintainAnimation: true,
                        maintainSize: true,
                        visible: widget.nextButtonVisible,
                        child: AnimatedGradientBox(
                          boxShadowList: animatedGradientBoxShadow,
                          child: TextButton(
                            onPressed: widget.nextPage,
                            child: Text(
                              'WEITER',
                              style: TextStyle(color: Colors.white, fontSize: SizeConfig.screenHeight * 0.02),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Visibility(
        //       visible: widget.backButtonVisible,
        //       child: Container(
        //         width: SizeConfig.defaultSize! * 5,
        //         margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3),
        //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.black, width: 2),),
        //           child: IconButton(
        //               onPressed: widget.previousPage,
        //               icon: Icon(Icons.navigate_before),
        //               iconSize: SizeConfig.defaultSize! * 3),
        //       ),
        //     ),
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
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
