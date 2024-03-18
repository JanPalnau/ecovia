import 'package:ecovia/constants.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

// ignore: must_be_immutable
class ExText extends StatefulWidget {
  ExText(
      {Key? key,
      required this.text,
      required this.hasText,
      required this.onPressed})
      : super(key: key);

  final StyledText text;
  bool isExpanded = false;
  final bool hasText;
  final dynamic onPressed;

  @override
  State<ExText> createState() => _ExTextState();
}

class _ExTextState extends State<ExText>
    with TickerProviderStateMixin<ExText> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
            constraints: widget.isExpanded
                ? const BoxConstraints()
                : const BoxConstraints(maxHeight: 45.0),
            child: widget.text,
          )),
      widget.hasText
          ? widget.isExpanded
              //? ConstrainedBox(constraints: BoxConstraints())
              ? TextButton(
                  child: const Text(
                    'weniger anzeigen',
                    style: TextStyle(fontWeight: FontWeight.bold, color: kNeonGreen),
                  ),
                  onPressed: () {
                    setState(() => widget.isExpanded = !widget.isExpanded);
                  })
              : TextButton(
                  child: const Text(
                    'mehr anzeigen',
                    style: TextStyle(fontWeight: FontWeight.bold, color: kNeonGreen),
                  ),
                  onPressed: () {
                    setState(() => widget.isExpanded = !widget.isExpanded);
                    widget.onPressed;
                    EnvironmentTimerSwitch(true).dispatch(context);
                  })
          : Container()
    ]);
  }
}

class EnvironmentTimerSwitch extends Notification {
  final bool val;
  EnvironmentTimerSwitch(this.val);
}
