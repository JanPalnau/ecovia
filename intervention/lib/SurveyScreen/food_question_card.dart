import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:ecovia/constants.dart';

class FoodQuestionCard extends StatefulWidget {
  const FoodQuestionCard({
    Key? key,
    required this.dietQuestion,
    required this.backButtonVisible,
    required this.previousPage,
    required this.answerOptions,
    required this.imgSrc,
    required this.isFoodPictureVisible,
    this.userCallback,
    required this.bottomPadding,
  }) : super(key: key);

  final String? dietQuestion;
  final bool backButtonVisible, bottomPadding;
  final dynamic previousPage;
  final String? imgSrc;
  final Function(int?)? userCallback;
  final List<LikertScale> answerOptions;
  final bool? isFoodPictureVisible;

  @override
  State<FoodQuestionCard> createState() => _FoodQuestionCardState();
}

class _FoodQuestionCardState extends State<FoodQuestionCard>
    with AutomaticKeepAliveClientMixin<FoodQuestionCard> {
  bool backButtonVisible = true;
  int? _selected;
  int count = 0;
  bool answerSelected = false;
  int? userAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.screenHeight * 0.02),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
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
                                        visible: widget.isFoodPictureVisible!,
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
                                        visible: widget.isFoodPictureVisible!,
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
                        visible: widget.isFoodPictureVisible!,
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
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(height: 5, color: kDarkGreen, thickness: 1)),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.04,
                        vertical: SizeConfig.screenHeight * 0.01),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        super.build(context);
                        return Column(
                          children: [
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.defaultSize! * 1.5),
                              child: Container(
                                //height: SizeConfig.screenHeight * 0.15,
                                decoration: BoxDecoration(
                                    boxShadow: const [standardBoxShadow],
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
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.defaultSize! * 1.5)),
                                child: Center(
                                  child: RadioListTile<int>(
                                    selected: answerSelected,
                                    activeColor: Colors.white,
                                    groupValue: _selected,
                                    value:
                                        widget.answerOptions[index].id!.toInt(),
                                    onChanged: (int? val) {
                                      setState(() {
                                        _selected = val;
                                        answerSelected = true;
                                        userAnswer = val;
                                      });
                                      //print(userAnswer);
                                      widget.userCallback!(val);
                                    },
                                    title: Text(
                                      widget.answerOptions[index].answerOption!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        //fontSize: 16
                                      ),
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: widget.answerOptions.length,
                      shrinkWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //SizedBox(height: SizeConfig.screenHeight * 0.05),
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
        widget.bottomPadding
            ? SizedBox(height: SizeConfig.screenHeight * 0.02)
            : Container(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
