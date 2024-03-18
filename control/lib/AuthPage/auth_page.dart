
import "package:flutter/material.dart";

import 'package:firebase_auth/firebase_auth.dart';

import '../size_config.dart';
import 'login_widget.dart';
import 'register_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
    this.registerPage,
    this.forgotpasswordPage,
  }) : super(key: key);

  final dynamic registerPage;
  final dynamic forgotpasswordPage;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/background/background_3_blurred.jpg'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        // child: BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        //   child: Container(
        //     decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
        //   ),
        // ),
      ),
      isLogin
          ? LoginWidget(
              onClickedSignUp: () {
                toggle();
              },
            )
          : RegisterWidget(onClickedSignIn: () {
              toggle();
            })
    ]);
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}

