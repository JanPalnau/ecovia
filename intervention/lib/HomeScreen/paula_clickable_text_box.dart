import 'package:flutter/material.dart';

import '../size_config.dart';

class PaulaClickableTextBox extends StatefulWidget {
  final bool visible;
  final Animation<int> animation;
  final String text;
  const PaulaClickableTextBox({Key? key, required this.visible, required this.animation, required this.text})
      : super(key: key);

  @override
  State<PaulaClickableTextBox> createState() => _PaulaClickableTextBoxState();
}

class _PaulaClickableTextBoxState extends State<PaulaClickableTextBox> with SingleTickerProviderStateMixin{
  late Animation<int> animation;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Stack(
        children: [
          Container(
              constraints: BoxConstraints(minHeight: SizeConfig.defaultSize! * 10),
              width: SizeConfig.defaultSize! * 38,
              decoration: BoxDecoration(
                color: Colors.lightGreen[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: Offset(3, 4), // shadow direction: bottom right
                  )
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: AnimatedBuilder(
        animation: widget.animation,
        builder: (context, child) {
          return Text(widget.text.substring(0, widget.animation.value), style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8,),);
        })),
              
          //Positioned(bottom: 0, left: 250, child: CustomPaint(painter: TriAngle(),))
        ],
      ),
    );
  }
}
