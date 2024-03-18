import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';

class StatBoxTwo extends StatefulWidget {
  const StatBoxTwo(
      {Key? key,
      this.statCategorieOne,
      this.statCategorieTwo,
      this.statTypeOne,
      this.statTypeTwo,
      this.statTypeThree,
      this.statTypeFour,
      this.userStatOne,
      this.userStatTwo,
      this.userStatThree,
      this.userStatFour,
      this.userStatFive,
      this.userStatSix,
      this.userStatSeven,
      this.userStatEight,
      this.statSummary,
      this.userStatSummary,
      this.color})
      : super(key: key);

  final String? statCategorieOne,
      statCategorieTwo,
      statTypeOne,
      statTypeTwo,
      statTypeThree,
      statTypeFour,
      userStatOne,
      userStatTwo,
      userStatThree,
      userStatFour,
      userStatFive,
      userStatSix,
      userStatSeven,
      userStatEight,
      statSummary,
      userStatSummary;
  
  final Color? color;

  @override
  State<StatBoxTwo> createState() => _StatBoxTwoState();
}

class _StatBoxTwoState extends State<StatBoxTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(15),
            height: SizeConfig.defaultSize! * 50,
            width: SizeConfig.defaultSize! * 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: kDarkGreen, width: 2.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.statCategorieOne!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      height: 3,
                      thickness: 2,
                      color: kDarkGreen,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        widget.statTypeOne!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    widget.userStatOne!,
                    style: const TextStyle(
                        fontSize: 20,),
                  ),
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        widget.statTypeTwo!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    widget.userStatTwo!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        widget.statTypeThree!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    widget.userStatThree!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        widget.statTypeFour!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    widget.userStatSeven!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                  ],
                ),
                const Divider(height: 3, thickness: 3,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        widget.statCategorieTwo!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      height: 3,
                      thickness: 2,
                      color: kDarkGreen,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        widget.statTypeOne!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    widget.userStatFour!,
                    style: const TextStyle(
                        fontSize: 20,),
                  ),
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        widget.statTypeTwo!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    widget.userStatFive!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        widget.statTypeThree!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    widget.userStatSix!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        widget.statTypeFour!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    widget.userStatEight!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                  ],
                ),
                const Divider(height: 3, thickness: 3,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      //color: widget.color, 
                      borderRadius: BorderRadius.circular(12),
                      gradient: flashyGradient,
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            widget.statSummary!,
                            softWrap: true,
                            style: const TextStyle(fontSize: 20, color: Colors.white,),
                          ),
                        ),
                        Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        widget.userStatSummary!,
                        style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
