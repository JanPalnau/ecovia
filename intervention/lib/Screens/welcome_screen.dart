// import "package:flutter/material.dart";
// import 'register_screen.dart';
// import 'package:co2_app/StartScreen/auth_page.dart';
// import 'package:google_fonts/google_fonts.dart';




// class WelcomeScreen extends StatelessWidget{
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//       return Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/background_1.jpg'),
//                 fit: BoxFit.fitWidth,
//                 alignment: Alignment.center
//               ),
//             ),
//           ),
//           Scaffold(
//             backgroundColor: Colors.transparent,
//             body: Stack(
//               alignment: Alignment.center,
//               children: [
//                Positioned(
//                     top: 200,
//                     child: Text(
//                       "PLANTY",
//                       style: GoogleFonts.oswald(
//                         textStyle: TextStyle(
//                           fontSize: 50,
//                           color: Color.fromRGBO(48, 84, 70, 1)
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 450,
//                     height: 50,
//                     width: 180,
//                     child: ElevatedButton(
//                       child: Text("registrieren".toUpperCase()),
//                       onPressed: () {
//                           Navigator.push(
//                             context, 
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return RegisterScreen();
//                               },
//                             ),
//                           ); 
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 8,
//                         minimumSize: Size(175, 50),
//                         primary: Color.fromRGBO(143, 169, 44, 1),
//                         textStyle: TextStyle(
//                           fontSize: 20.0,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)
//                         ),
//                       ),
//                     ),  
//                   ),
//                   Positioned(
//                     top: 530,
//                     height: 50,
//                     width: 150,
//                     child: ElevatedButton(
//                       child: Text("login".toUpperCase()),
//                       onPressed: () {
//                           Navigator.push(
//                             context, 
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return AuthPage();
//                               },
//                             ),
//                           ); 
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 8,
//                         minimumSize: Size(120, 50),
//                         primary: Color.fromRGBO(97, 161, 124, 1),
//                         textStyle: TextStyle(
//                           fontSize: 20.0,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)
//                         ),
//                       ),
//                     ),  
//                   ),
//               ]
//             ),    
//           ),          
//         ]
//       );
//   }
// }
