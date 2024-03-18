import 'package:ecovia/SurveyScreen/progressbar.dart';
import 'package:ecovia/SurveyScreen/survey_body.dart';
import 'package:ecovia/constants.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class ProgressBarHeader extends StatefulWidget {
  final int pageIndex, pagesLength;
  const ProgressBarHeader(
      {Key? key, required this.pageIndex, required this.pagesLength})
      : super(key: key);

  @override
  State<ProgressBarHeader> createState() => _ProgressBarHeaderState();
}

class _ProgressBarHeaderState extends State<ProgressBarHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.defaultSize! * 2,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
        child: ProgressBar(
            kPrimaryGradient: SurveyBody.kPrimaryGradient,
            questionIndex: (widget.pageIndex.toDouble()) /
                (widget.pagesLength.toDouble() + 1)),
      ),
      SizedBox(
        height: SizeConfig.defaultSize! * 2,
      ),
      Divider(
        thickness: 1.5,
        color: kDarkGreen.withOpacity(0.5),
      ),
      SizedBox(
        height: SizeConfig.defaultSize! * 1,
      ),
      // if (snapshot.hasError) {
      //   return Text("Etwas ist schiefgelaufen.");
      // }
      // if (snapshot.connectionState == ConnectionState.waiting) {
      //   return Center(
      //     child: CircularProgressIndicator(color: kLightGreen),
      //   );
      // }
    ]);
  }
}
