
import 'package:flutter/material.dart';
import 'package:ecovia_control/size_config.dart';
import 'package:ecovia_control/constants.dart';



class FoodAnswer extends StatefulWidget {
  const FoodAnswer({
    Key? key,
    this.text,
    this.index,
    this.press,
    this.myColor,
  }) : super(key: key);
  final String? text;
  final int? index;
  final VoidCallback? press;
  final Color? myColor;
  //final bool _pressed = false;

  @override
  State<FoodAnswer> createState() => _FoodAnswerState();
}

class _FoodAnswerState extends State<FoodAnswer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.defaultSize! * 1.5),
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      decoration: BoxDecoration(
        border: Border.all(color: kLightGreen),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$widget.text",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            )
          ),
          Container(
            height: SizeConfig.defaultSize! * 2,
            width: SizeConfig.defaultSize! *2,
            decoration: BoxDecoration(color: widget.myColor, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(50)),
          ),
        ],
      ),
    );
  }
}

