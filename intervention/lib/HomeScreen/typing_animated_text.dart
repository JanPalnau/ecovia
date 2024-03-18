import 'package:flutter/material.dart';

class TypingAnimatedText extends StatefulWidget {
  final String text;
  final Animation<int> animation;
  const TypingAnimatedText({Key? key, required this.text, required this.animation}) : super(key: key);

  @override
  State<TypingAnimatedText> createState() => _TypingAnimatedTextState();
}

class _TypingAnimatedTextState extends State<TypingAnimatedText>
    with SingleTickerProviderStateMixin {
  late Animation<int> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.animation,
        builder: (context, child) {
          return Text(widget.text.substring(0, widget.animation.value));
        });
    // return TweenAnimationBuilder(tween: IntTween(begin: 0, end: widget.text.length), duration: Duration(seconds: 3), builder: (context, int value, child) {
    //   return Text(widget.text.substring(0, value));
    // });
  }
}
