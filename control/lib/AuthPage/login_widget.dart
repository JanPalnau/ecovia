import 'package:ecovia_control/AuthPage/forgot_password.dart';
import 'package:ecovia_control/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../animated_gradient_box.dart';
import '../constants.dart';
import '../size_config.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  final VoidCallback onClickedSignUp;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  void initState() {
    errorMessage = '';
    ecoviaLogoVisible = true;
    super.initState();
  }

  String? errorMessage;
  bool? ecoviaLogoVisible;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Column(children: [
        SizedBox(height: SizeConfig.screenHeight * 0.02,),
        const Expanded(
          flex: 3,
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
                image:
                    ecoviaIconWithText,
              ),
            ),
          ),
        ),
        // Text(
        //   "PLANTY",
        //   style: GoogleFonts.oswald(
        //     textStyle: TextStyle(
        //       fontSize: 50,
        //       color: kDarkGreen,
        //     ),
        //   ),
        // ),
        const Expanded(
          flex: 3,
          child: SizedBox(
            //height: 100,
          ),
        ),
        Visibility(
            visible: errorMessage!.isNotEmpty,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
              child: Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            )),
        // Container(
        //   height: 36,
        //   child: TextField(
        //     maxLines: 1,
        //     style: TextStyle(fontSize: 17),
        //     textAlignVertical: TextAlignVertical.center,
        //     decoration: InputDecoration(
        //       filled: true,
        //       prefixIcon:
        //           Icon(Icons.search, color: Theme.of(context).iconTheme.color),
        //       border: OutlineInputBorder(
        //           borderSide: BorderSide.none,
        //           borderRadius: BorderRadius.all(Radius.circular(30))),
        //       fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        //       contentPadding: EdgeInsets.zero,
        //       hintText: 'Search',
        //     ),
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
          height: SizeConfig.screenHeight * 0.06,
          width: SizeConfig.screenWidth * 0.8,
          //alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kNeonGreen,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TextField(
            onTap: () => ecoviaLogoVisible = false,
            onSubmitted: (onSubmitted) => ecoviaLogoVisible = true,
            maxLines: 1,
            style: TextStyle(fontSize: SizeConfig.screenHeight * 0.02, color: kDarkGreen),
            cursorColor: kDarkGreen,
            textAlignVertical: TextAlignVertical.center,
            controller: emailController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.screenHeight * 0.02))),
              prefixIcon: Icon(
                FontAwesomeIcons.envelope,
                size: SizeConfig.defaultSize! * 2,
                color: Colors.white,
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                fontSize: SizeConfig.defaultSize! * 2,
                color: Colors.white,
              ),
            ),
            // style: const TextStyle(
            //   fontSize: 20.0,
            //   color: kDarkGreen,
            // ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
          height: SizeConfig.screenHeight * 0.06,
          width: SizeConfig.screenWidth * 0.8,
          decoration: BoxDecoration(
            color: kNeonGreen,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TextField(
            onTap: () => ecoviaLogoVisible = false,
            onSubmitted: (onSubmitted) => ecoviaLogoVisible = true,
            style: TextStyle(fontSize: SizeConfig.screenHeight * 0.02, 
            //height: SizeConfig.screenHeight * 0.022 / SizeConfig.screenHeight * 0.02
            ),
            cursorColor: kDarkGreen,
            controller: passwordController,
            decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.screenHeight * 0.02))),
              prefixIcon: Icon(
                FontAwesomeIcons.lock,
                size: SizeConfig.defaultSize! * 2,
                color: Colors.white,
              ),
              hintText: 'Passwort',
              hintStyle: TextStyle(
                fontSize: SizeConfig.defaultSize! * 2,
                color: Colors.white,
              ),
            ),
            // style: const TextStyle(
            //   fontSize: 20.0,
            //   color: kDarkGreen,
            // ),
            obscureText: true,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen())),
              child: Text(
                'Passwort vergessen?',
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 2,
                  color: kDarkGreen,
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight * 0.02
        ),
        GestureDetector(
          onTap:
            () async {
              // await FirebaseAuth.instance.signInWithEmailAndPassword(
              //   email: emailController.text.trim(),
              //   password: passwordController.text.trim(),
              // );
              //print("works");
              signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim());
              // await AuthenticationService(FirebaseAuth.instance).signIn(
              //     email: emailController.text.trim(),
              //     password: passwordController.text.trim());
              //context.read<AuthenticationService>().signIn(
              //email: emailController.text.trim(),
              //password: passwordController.text.trim(),
              //);
          },
          child: AnimatedGradientBox(
            boxHeight: SizeConfig.screenHeight * 0.07,
            width: SizeConfig.screenWidth * 0.5,
            boxShadowList: animatedGradientBoxShadow,
            // height: size.height * 0.08,
            // width: size.width * 0.5,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(16),
            //   color: kDarkGreen,
            // ),
            child: Text(
                'Login',
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 2.5,
                  color: Colors.white,
                ),
              ),
            
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.01
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
            onPressed: widget.onClickedSignUp,
            child: Text(
              'Account erstellen',
              style: TextStyle(
                fontSize: SizeConfig.defaultSize! * 2,
                color: kDarkGreen,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ]),
        const Expanded(
          flex: 5,
          child: SizedBox(
            //height: 100,
          ),
        ),
      ]),
    );
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(color: kDarkGreen),
            ));
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password).then((_) => 
          navigatorKey.currentState!.popUntil((route) => route.isFirst)
          //Navigator.of(context).pop()
          );
      //Navigator.of(context).pop();
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      //print(e.code);
      //var message = 'An error has occured.'; // default message
      setState(() {
        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'Bitte geben Sie eine gültige E-Mail-Adresse an.';
            break;
          case 'user-disabled':
            errorMessage =
                'Der mit dieser E-Mail assoziierte Account ist deaktiviert.';
            break;
          case 'user-not-found':
            errorMessage =
                'Es existiert kein Account mit dieser E-Mail-Adresse.';
            break;
          case 'wrong-password':
            errorMessage =
                'Das angegebene Passwort ist ungültig. Bitte versuchen Sie es erneut oder setzen Sie ihr Passwort zurück.';
            break;
        }
        
      });
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
    return null;
  }
}
