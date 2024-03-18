import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../References/references.dart';
import '../size_config.dart';

class PaulaTextBox extends StatefulWidget {
  final bool visible;
  final String text;
  final double textFontSize;
  const PaulaTextBox(
      {Key? key,
      required this.visible,
      required this.text,
      required this.textFontSize})
      : super(key: key);

  @override
  State<PaulaTextBox> createState() => _PaulaTextBoxState();
}

class _PaulaTextBoxState extends State<PaulaTextBox> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      replacement: Container(),
      child: Stack(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.01,
          ),
          Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
            child: Container(
                // constraints:
                //     BoxConstraints(minHeight: SizeConfig.defaultSize! * 10),
                // width: SizeConfig.defaultSize! * 38,
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
                child: AnimatedTextKit(
                  onTap: () => userCollection
                    ..doc(FirebaseAuth.instance.currentUser!.uid).set({
                      'feedbackReceived': true,
                    }, SetOptions(merge: true)),
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(widget.text,
                        textAlign: TextAlign.start,
                        textStyle: TextStyle(
                            fontSize: widget.textFontSize,
                            height: 1.25,
                            color: kDarkGreen))
                  ],
                )),
          ),
          //Positioned(bottom: 0, left: 250, child: CustomPaint(painter: TriAngle(),))
        ],
      ),
    );
  }
}
