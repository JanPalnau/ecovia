// import 'package:co2_app/Screens/forgot_password.dart';
// import 'package:co2_app/size_config.dart';
// import 'package:flutter/material.dart';
// import '../StartScreen/auth_page.dart';
// import 'register_screen.dart';

// class StartScreen extends StatefulWidget {
//   StartScreen({Key? key}) : super(key: key);
//   final PageController _pageController = PageController(initialPage: 1);

//   @override
//   _StartScreenState createState() => _StartScreenState();
// }

// class _StartScreenState extends State<StartScreen> {
//   int? pageIndex;
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return PageView(
//         controller: widget._pageController,
//         children: [
//           ForgotPasswordScreen(loginPage: () {
//             widget._pageController.animateToPage(1,
//                 duration: Duration(milliseconds: 300), curve: Curves.linear);
//           }),
//           AuthPage(registerPage: () {
//             widget._pageController.animateToPage(2,
//                 duration: Duration(milliseconds: 300), curve: Curves.linear);
//           },
//           forgotpasswordPage: () {
//             widget._pageController.animateToPage(0,
//                 duration: Duration(milliseconds: 300), curve: Curves.linear);
//           },
//           ),
//           RegisterScreen(loginPage: () {
//             widget._pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.linear);
//           }),
//         ],
//         //physics: NeverScrollableScrollPhysics(),
//         );
//   }
// }