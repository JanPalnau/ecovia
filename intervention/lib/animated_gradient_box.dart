import 'package:ecovia_control/constants.dart';
import 'package:ecovia_control/size_config.dart';
import 'package:flutter/material.dart';

class AnimatedGradientBox extends StatefulWidget {
  final Widget child;
  final double? boxHeight, width;
  final List<BoxShadow> boxShadowList;

  const AnimatedGradientBox({Key? key, required this.child, this.boxHeight, this.width, required this.boxShadowList})
      : super(key: key);

  @override
  State<AnimatedGradientBox> createState() => _AnimatedGradientBoxState();
}

class _AnimatedGradientBoxState extends State<AnimatedGradientBox> {
  List<Color> colorList = [
    const Color.fromARGB(255, 61, 105, 88),
    kDarkGreen,
    const Color.fromARGB(255, 63, 173, 120)
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = const Color.fromARGB(255, 61, 105, 88);
  Color topColor = const Color.fromARGB(255, 63, 173, 120);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        setState(() {
          bottomColor = const Color.fromARGB(255, 63, 173, 120);
        });
      }
    });
    return AnimatedContainer(
      height: widget.boxHeight,
      width: widget.width,
      duration: const Duration(milliseconds: 1500),
      onEnd: () {
        if (mounted) {
          setState(() {
            index = index + 1;
            // animate the color
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];

            //// animate the alignment
            // begin = alignmentList[index % alignmentList.length];
            // end = alignmentList[(index + 2) % alignmentList.length];
          });
        }
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: begin, end: end, colors: [bottomColor, topColor]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: widget.boxShadowList
        
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 0.5),
        child: Align(alignment: Alignment.center, child: widget.child),
      ),
    );
  }
}
