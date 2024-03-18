import 'dart:ui';

import 'package:ecovia/RecipeScreen/animated_gradient_box.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String? feedbackMessage, buttonText;
  Color? feedbackMessageColor;
  TextEditingController emailController = TextEditingController();
  bool? ecoviaLogoVisible;
  @override
  void initState() {
    feedbackMessageColor = Colors.red;
    feedbackMessage = '';
    buttonText = 'Passwort zurücksetzen';
    ecoviaLogoVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background_2.jpg'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24.4, 60.0, 24.4, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: const Color.fromRGBO(97, 161, 124, 1),
                    size: SizeConfig.defaultSize! * 3,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(
              //height: 50,
            ),
          ),
          Visibility(
            visible: ecoviaLogoVisible!,
            child: Container(
              height: SizeConfig.screenHeight * 0.06,
              width: SizeConfig.screenWidth * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ecoviaIconWithText,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(
              //height: 200,
            ),
          ),
          Visibility(
              visible: feedbackMessage!.isNotEmpty,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                child: Text(
                  feedbackMessage!,
                  style: TextStyle(color: feedbackMessageColor),
                ),
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            height: size.height * 0.06,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: kNeonGreen,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: TextFormField(
              onTap: () => ecoviaLogoVisible = false,
              onFieldSubmitted: (onSubmitted) => ecoviaLogoVisible = true,
              cursorColor: kDarkGreen,
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (String? value) {

              //     if (value!.isEmpty) {
              //       return feedbackMessage = "Bitte geben Sie eine E-Mail-Adresse an";
              //     }
              //     if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              //             .hasMatch(value) &&
              //         value.isNotEmpty) {
              //       return feedbackMessage =
              //           "Bitte geben Sie eine gültige E-Mail-Adresse an";
              //     }
              // },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon: Icon(
                  FontAwesomeIcons.envelope,
                  size: SizeConfig.defaultSize! * 2,
                  //color: Color.fromRGBO(48, 84, 70, 1),
                  color: Colors.white,
                ),
                // contentPadding: EdgeInsets.symmetric(
                //   horizontal: 30.0,
                //   vertical: 10.0,
                // ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 2,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                fontSize: SizeConfig.defaultSize! * 2,
                //height: SizeConfig.screenHeight * 0.022 / SizeConfig.screenHeight * 0.02,
                color: const Color.fromRGBO(48, 84, 70, 1),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
          GestureDetector(
            onTap: () => resetPassword(),
            child: AnimatedGradientBox(
              boxHeight: SizeConfig.screenHeight * 0.07,
              width: SizeConfig.screenWidth * 0.6,
              boxShadowList: animatedGradientBoxShadow,
                child: Text(
                buttonText!,
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 5,
            child: SizedBox(
              //height: 100,
            ),
          ),
        ]),
      )
    ]);
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(color: kDarkGreen),
            ));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      ).then((_) => 
      Navigator.of(context).pop());
      //Navigator.popUntil(context, (route) => route.isFirst));
      setState(() {
        buttonText = 'E-Mail versandt!';
        feedbackMessageColor = kDarkGreen;
        feedbackMessage =
            'Überprüfe dein Postfach und folge den in der Mail enthaltenen Instruktionen, um dein Passwort zurückzusetzen.';
      });
      
      //Navigator.popUntil(context, (route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      //print(e.code);
      setState(() {
        switch (e.code) {
          case 'invalid-email':
            feedbackMessage = 'Die angegebene E-Mail-Adresse ist ungültig.';
            break;
          case 'user-not-found':
            feedbackMessage =
                'Es existiert kein Account mit der angegebenen E-Mail-Adresse.';
            break;
        }
      });
      Navigator.popUntil(context, (route) => route.isFirst);
      // if (!mounted) {
      //   Navigator.of(context).pop();
      // }
    }
  }
}
