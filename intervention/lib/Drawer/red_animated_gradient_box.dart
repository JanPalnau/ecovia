import 'package:ecovia/size_config.dart';
import 'package:flutter/material.dart';

class RedAnimatedGradientBox extends StatefulWidget {
  final Widget child;
  final double? boxHeight, width;
  final List<BoxShadow> boxShadowList;

  const RedAnimatedGradientBox({Key? key, required this.child, this.boxHeight, this.width, required this.boxShadowList})
      : super(key: key);

  @override
  State<RedAnimatedGradientBox> createState() => _RedAnimatedGradientBoxState();
}

class _RedAnimatedGradientBoxState extends State<RedAnimatedGradientBox> {
  List<Color> colorList = [
    Colors.red,
    Colors.redAccent[700]!,
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.redAccent[700]!;
  Color topColor = Colors.red;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        setState(() {
          bottomColor = Colors.redAccent;
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
        borderRadius: BorderRadius.circular(12),
        boxShadow: widget.boxShadowList
        
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
        child: Align(alignment: Alignment.center, child: widget.child),
      ),
    );
  }
}
