import 'package:flutter/material.dart';
import 'package:ecovia/size_config.dart';
import 'package:ecovia/constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.kPrimaryGradient,
    required this.questionIndex,
  }) : super(key: key);

  final LinearGradient kPrimaryGradient;
  final double questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.defaultSize! * 1.75,
      decoration: BoxDecoration(
        border: Border.all(color: kDarkGreen.withOpacity(0.6), width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(children: [
        LayoutBuilder(
            builder: (context, constraints) => Container(
                  width: constraints.maxWidth * questionIndex,
                  decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(16)),
                )),
      ]),
    );
  }
}
