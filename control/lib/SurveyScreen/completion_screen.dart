import 'package:ecovia_control/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompletionScreen extends StatefulWidget with ChangeNotifier {
  CompletionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CompletionScreen> createState() => _CompletionScreenState();
}

class _CompletionScreenState extends State<CompletionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //SizedBox(height: SizeConfig.screenHeight * 0.25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
          child: Text(
            "Vergiss nicht, auch morgen dein Ernährungsprotokoll auszufüllen!",
            style: TextStyle(fontSize: SizeConfig.screenHeight * 0.025),
            textAlign: TextAlign.center,
          ),
        ),
        // SizedBox(height: SizeConfig.defaultSize! * 10),
        // const Text(
        //   "Klick dich jetzt gerne wieder durch die App!",
        //   style: TextStyle(fontSize: 18, color: kDarkGreen),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }
}
