import 'package:ecovia/SurveyScreen/survey_body.dart';
import 'package:ecovia/size_config.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({
    Key? key,
    this.bottomNavBar,
  }) : super(key: key);

  final dynamic bottomNavBar;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // final TextEditingController _password = TextEditingController();

  // final TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Stack(children: [
      //Container(
      //decoration: BoxDecoration(
      //image: DecorationImage(
      //image: AssetImage('assets/background_paula.jpg'),
      //fit: BoxFit.fitWidth,
      //alignment: Alignment.bottomCenter,
      //),
      //),
      //),
      Scaffold(
        appBar: buildAppBar(),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: const SurveyBody(),
        bottomNavigationBar: widget.bottomNavBar,
      ),
    ]);
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: SvgPicture.asset(
            "assets/fi-rr-align-left.svg",
          ),
          onPressed: () {}),
      centerTitle: true,
      title: Text(
        "PLANTY",
        style: GoogleFonts.oswald(
          textStyle: const TextStyle(
              fontSize: 50, color: Color.fromRGBO(48, 84, 70, 1)),
        ),
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset(
              "assets/fi-rr-search.svg",
            ),
            onPressed: () {}),
        SizedBox(
          width: SizeConfig.defaultSize! * 0.5,
        ),
      ],
    );
  }
}
