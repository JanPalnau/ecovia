// import "package:flutter/material.dart";
// import 'register_screen.dart';
// import 'package:co2_app/StartScreen/auth_page.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
//           margin: EdgeInsets.symmetric(
//             vertical: 15.0,
//           ),
//           child: ElevatedButton(
//             child: Text("registrieren".toUpperCase()),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return RegisterScreen();
//                   },
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(175, 50),
//               primary: Color.fromRGBO(143, 169, 44, 1),
//               textStyle: TextStyle(
//                 fontSize: 20.0,
//               ),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//             ),
//           ),
//         ),
//         ElevatedButton(
//           child: Text("login".toUpperCase()),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return AuthPage();
//                 },
//               ),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             minimumSize: Size(120, 50),
//             primary: Color.fromRGBO(97, 161, 124, 1),
//             textStyle: TextStyle(
//               fontSize: 20.0,
//             ),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0)),
//           ),
//         ),
//         Container(
//             //margin: const EdgeInsets.only(bottom: 0),
//             //constraints: BoxConstraints.expand(height: 500.0),
//             alignment: Alignment.bottomLeft,
//             //width: MediaQuery.of(context).size.height * 1,
//             //decoration: BoxDecoration(
//             //image: DecorationImage(
//             //image:AssetImage("assets/paula1.jpg"),
//             //alignment: left,
//             //fit: BoxFit.fill)
//             //child: Row(
//             child: Image.asset(
//               "assets/background_with_paula.png",
//               fit: BoxFit.cover,
//               alignment: Alignment.bottomCenter,
//             )

//             //Container(
//             //width: 250,
//             //child: Bubble(
//             //elevation: 4,
//             //padding: BubbleEdges.fromLTRB(5.0, 15.0, 5.0, 15.0),
//             //color: Colors.grey[300],
//             //nip: BubbleNip.leftCenter,
//             //child: Text(
//             //"Hallo, ich bin Paula und helfe dir bei der Ernährungsumstellung!",
//             //textAlign: TextAlign.center,
//             //),
//             //),
//             //),
//             //),
//             ),
//       ],
//     )));
//   }
// }
