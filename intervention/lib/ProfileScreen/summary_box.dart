import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/widgets.dart';

class SummaryBox extends StatefulWidget {
  const SummaryBox(
      {Key? key,
      this.userSummary})
      : super(key: key);

  final String? userSummary;

  @override
  State<SummaryBox> createState() => _SummaryBoxState();
}

class _SummaryBoxState extends State<SummaryBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(15),
            width: SizeConfig.defaultSize! * 100,
            decoration: BoxDecoration(
              color: kLightGreen,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: kDarkGreen, width: 2.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.userSummary!,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
