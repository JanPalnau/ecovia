import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/References/references.dart';
import 'package:ecovia/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../RecipeScreen/animated_gradient_box.dart';
import '../SurveyScreen/database.dart';
import '../constants.dart';
import '../recipes.dart';
import '../size_config.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  void initState() {
    isValidEmail = true;
    isValidPassword = true;
    errorMessage = '';
    ecoviaLogoVisible = true;
    super.initState();
  }

  String? errorMessage;
  bool? isValidEmail;
  bool? isValidPassword;
  bool? ecoviaLogoVisible;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //isValid = true;
    //final List<int> recipeIDs = [];
    final DateTime date = DateTime.now();
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final String registerDate = dateFormat.format(date);
    final databaseService = Provider.of<DatabaseService>(context);
    final recipeCatalog = Provider.of<RecipeCatalog>(context);
    Future signUp() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
                child: CircularProgressIndicator(color: kDarkGreen),
              ));
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim().toLowerCase(),
            password: _passwordController.text.trim());
        FirebaseAuth.instance.currentUser!.reload();
        DocumentReference userReference =
            userCollection.doc(FirebaseAuth.instance.currentUser!.uid);

        //print(FirebaseAuth.instance.currentUser);
        await databaseService.updateUserData(recipeCatalog.recipes);
        // databaseService
        //     .updateStatementsData(paulaStatementsFinished);
        // for (var element in RecipeCatalog().recipes) {
        //   recipeMap.addEntries({(int.parse(element.id!) -1).toString(): (int.parse(element.id!) -1)}.entries);
        // }
        //  for (var element in RecipeCatalog().recipes) {
        //     recipeIDs.add((int.parse(element.id!)));
        //   }
        if (kIsWeb == true) {
          await userReference.set({
            'email': FirebaseAuth.instance.currentUser!.email,
          }, SetOptions(merge: true));
        }
        await userReference.set({
          //  'recipeIDs':
          //    [recipeIDs]
          //,
          'paulaTextReceived': true,
          'followUpCompleted': false,
          'dietType': 0,
          'pushNotificationsEnabled': true,
          'completionStatus': false,
          'completionDaily': false,
          'preQuestionnaireFinished': false,
          'currentPaula': 1,
          'currentBackground': 3,
          'registerDate': registerDate,
          'studyCompleted': false,
          'loginDate': '',
          'loginDateSubmitted': false,
          'paulaStatementsInitial': false,
          'isFirstLaunch': true,
          'dailyRecipesGenerated': false,
          'dailyRecipes': {'recipeOne': 0, 'recipeTwo': 1, 'recipeThree': 2},
          'feedbackReceived': false,
          'ecoPoints': 0,
          'ecoPointsReceived': true,
          'updatedBackground': false,
          'interventionDay': 0,
        }, SetOptions(merge: true));
        //Navigator.of(context).pop()
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        //Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
        //print(e.message);
        //errorMessage = e.message;
        setState(() {
          switch (e.code) {
            case 'email-already-in-use':
              errorMessage = 'Diese E-Mail-Adresse ist bereits vergeben.';
              break;
            case 'invalid-email':
              errorMessage = 'Bitte geben Sie eine gültige E-Mail-Adresse an.';
              break;
            case 'operation-not-allowed':
              errorMessage = 'Operation nicht erlaubt.';
              break;
            case 'weak-password':
              errorMessage =
                  'Bitte wählen Sie ein stärkeres Passwort (Mindestlänge 6 Charaktere)';
              break;
          }
        });
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        //Navigator.of(context).pop();
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      return null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Column(children: [
        // Container(
        //   padding: const EdgeInsets.fromLTRB(24.4, 60.0, 24.4, 0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       IconButton(
        //         icon: Icon(
        //           Icons.arrow_back_ios,
        //           color: kDarkGreen,
        //           size: 25,
        //         ),
        //         onPressed: widget.loginPage,
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.02,
        ),
        const Expanded(
          flex: 3,
          child: SizedBox(
              //height: 50,
              ),
        ),
        //Text(errorMessage!, style: TextStyle(fontSize: 50),),
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
          flex: 3,
          child: SizedBox(
              //height: 200,
              ),
        ),
        Visibility(
            visible: errorMessage!.isNotEmpty, child: Text(errorMessage!)),
        SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                height: isValidEmail!
                    ? SizeConfig.screenHeight * 0.06
                    : SizeConfig.screenHeight * 0.08,
                width: SizeConfig.screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: kNeonGreen,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: TextFormField(
                  onTap: () => ecoviaLogoVisible = false,
                  onFieldSubmitted: (onSubmitted) => ecoviaLogoVisible = true,
                  cursorColor: kDarkGreen,
                  controller: _emailController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Bitte geben Sie eine E-Mail-Adresse an";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      setState(() {
                        isValidEmail = false;
                      });

                      return "Bitte geben Sie eine gültige E-Mail-Adresse an";
                    }
                    return null;
                  },
                  onSaved: (String? email) {
                    //_email = email;
                  },
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
                    //height: SizeConfig.screenHeight * 0.022/SizeConfig.screenHeight * 0.02,
                    color: const Color.fromRGBO(48, 84, 70, 1),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                height: isValidPassword!
                    ? SizeConfig.screenHeight * 0.06
                    : SizeConfig.screenHeight * 0.08,
                width: SizeConfig.screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: kNeonGreen,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: TextFormField(
                  onTap: () => ecoviaLogoVisible = false,
                  onFieldSubmitted: (onSubmitted) => ecoviaLogoVisible = true,
                  cursorColor: kDarkGreen,
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Bitte geben Sie ein Passwort an";
                    }
                    if (value.length < 6) {
                      setState(() {
                        isValidPassword = false;
                      });
                      return "Das Passwort ist zu kurz";
                    }
                    return "";
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(
                      FontAwesomeIcons.lock,
                      size: SizeConfig.defaultSize! * 2,
                      //color: Color.fromRGBO(48, 84, 70, 1),
                      color: Colors.white,
                    ),
                    // contentPadding: EdgeInsets.symmetric(
                    //   horizontal: 30.0,
                    //   vertical: 10.0,
                    // ),
                    hintText: 'Passwort',
                    hintStyle: TextStyle(
                      fontSize: SizeConfig.defaultSize! * 2,
                      color: Colors.white,
                    ),
                  ),
                  style: TextStyle(
                    //height: SizeConfig.screenHeight * 0.022/SizeConfig.screenHeight * 0.02,
                    fontSize: SizeConfig.defaultSize! * 2,
                    color: const Color.fromRGBO(48, 84, 70, 1),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                height: isValidPassword!
                    ? SizeConfig.screenHeight * 0.06
                    : SizeConfig.screenHeight * 0.08,
                width: SizeConfig.screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: kNeonGreen,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: TextFormField(
                  onTap: () => ecoviaLogoVisible = false,
                  onFieldSubmitted: (onSubmitted) => ecoviaLogoVisible = true,
                  cursorColor: kDarkGreen,
                  controller: _confirmPassword,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Bitte bestätigen Sie ihr Passwort";
                    }
                    if (_passwordController.text != _confirmPassword.text) {
                      setState(() {
                        isValidPassword = false;
                      });
                      return "Passwörter stimmen nicht überein";
                    }
                    return "";
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    //border: InputBorder.none,
                    prefixIcon: Icon(
                      FontAwesomeIcons.lock,
                      size: SizeConfig.defaultSize! * 2,
                      //color: Color.fromRGBO(48, 84, 70, 1),
                      color: Colors.white,
                    ),
                    // contentPadding: EdgeInsets.symmetric(
                    //   horizontal: 30.0,
                    //   vertical: 10.0,
                    // ),
                    hintText: 'Passwort bestätigen',
                    hintStyle: TextStyle(
                      fontSize: SizeConfig.defaultSize! * 2,
                      color: Colors.white,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2,
                    //height: SizeConfig.screenHeight * 0.022/SizeConfig.screenHeight * 0.02,
                    color: const Color.fromRGBO(48, 84, 70, 1),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              GestureDetector(
                onTap: () async {
                  signUp();
                },
                child: AnimatedGradientBox(
                  boxHeight: SizeConfig.screenHeight * 0.07,
                  width: SizeConfig.screenWidth * 0.5,
                  boxShadowList: animatedGradientBoxShadow,
                  // height: size.height * 0.08,
                  // width: size.width * 0.5,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(16),
                  //   color: Color.fromRGBO(48, 84, 70, 1),
                  // ),
                  child: Text(
                    'Registrieren',
                    style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * 2.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                  onPressed: widget.onClickedSignIn,
                  child: Text(
                    'Schon einen Account? Login!',
                    style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * 2,
                      color: kDarkGreen,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
        const Expanded(
          flex: 5,
          child: SizedBox(
              //height: 100,
              ),
        ),
      ]),
    );
  }

  // funktioniert, muss nur noch error message übersetzt werden:

//   const firebaseErrors = {
//   'auth/user-not-found': 'No user corresponding to this email',
//   'auth/email-already-in-use': 'The email address is already in use',
// }; // list of firebase error codes to alternate error messages

// catch (error) {
//       throw firebaseErrors[error.code] || error.message,
// }
}
