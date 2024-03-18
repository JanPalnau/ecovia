import 'package:flutter/material.dart';
import '../size_config.dart';


class ButtonWithRoundBorder extends StatefulWidget {
  const ButtonWithRoundBorder({
    Key? key,
    required this.text,
    required this.onPressed
  }) : super(key: key);

  final String text;
  final dynamic onPressed;

  @override
  State<ButtonWithRoundBorder> createState() => _ButtonWithRoundBorderState();
}

class _ButtonWithRoundBorderState extends State<ButtonWithRoundBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.defaultSize! * 20,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize! * 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white),
      child: TextButton(
        child: const Text(
          "Umfrage beenden",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
          widget.onPressed;
          },
      ),
    );
  }
}
