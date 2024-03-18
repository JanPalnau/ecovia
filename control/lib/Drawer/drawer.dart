import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia_control/Drawer/impressum_screen.dart';
import 'package:ecovia_control/Drawer/privacy_screen.dart';
import 'package:ecovia_control/Drawer/red_animated_gradient_box.dart';
import 'package:ecovia_control/JsonObjects/survey_answers_post_data.dart';
import 'package:ecovia_control/References/references.dart';
import 'package:ecovia_control/constants.dart';
import 'package:ecovia_control/restart_app.dart';
import 'package:ecovia_control/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import '../JsonObjects/user_data.dart';

class EcoviaDrawer extends StatefulWidget {
  const EcoviaDrawer({Key? key}) : super(key: key);

  @override
  State<EcoviaDrawer> createState() => _EcoviaDrawerState();
}

class _EcoviaDrawerState extends State<EcoviaDrawer> {
  @override
  void initState() {
    errorMessage = '';
    user = FirebaseAuth.instance.currentUser;

    super.initState();
  }

  final passwordController = TextEditingController();
  String? errorMessage;
  User? user;

  @override
  Widget build(BuildContext context) {
    DocumentReference userReference =
        userCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    return Drawer(
      child: Consumer<UserData>(builder: (context, userSnapshot, _) {
        return Column(children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.screenWidth * 0.01,
                SizeConfig.screenHeight * 0.04,
                SizeConfig.screenWidth * 0.01,
                0),
            child: Text(
              'Einstellungen',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.screenHeight * 0.02),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.02),
            child: const Divider(
              color: kDarkGreen,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.05,
          ),
          Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.5),
            child: Column(
              children: [
                Consumer<List<SurveyAnswersPostData>>(
                    builder: (context, value, child) => Text.rich(
                          TextSpan(
                            text: 'Absolvierte Tage: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.screenHeight * 0.02,
                                color: kDarkGreen),
                            children: [
                              TextSpan(
                                text: value.length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.screenHeight * 0.02,
                                    color: kNeonGreen),
                              )
                            ],
                          ),
                        )),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Benachrichtigungen',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenHeight * 0.02,
                          color: kDarkGreen),
                    ),
                    CupertinoSwitch(
                      activeColor: kNeonGreen,
                      thumbColor: kDarkGreen,
                      trackColor: Colors.grey,
                      value: kIsWeb
                          ? userSnapshot.email != null
                          : userSnapshot.pushNotificationsEnabled!,
                      onChanged: (value) {
                        kIsWeb
                            ? (value
                                ? userReference.set({
                                    'email':
                                        FirebaseAuth.instance.currentUser!.email
                                  }, SetOptions(merge: true))
                                : userReference.set(
                                    {'email': FieldValue.delete()},
                                    SetOptions(merge: true)))
                            : userReference.set(
                                {'pushNotificationsEnabled': value},
                                SetOptions(merge: true));
                      },
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      kIsWeb
                          ? (userSnapshot.email != null
                              ? 'aktiviert'
                              : 'deaktiviert')
                          : (userSnapshot.pushNotificationsEnabled!
                              ? 'aktiviert'
                              : 'deaktiviert'),
                      style: TextStyle(
                          color: kIsWeb
                              ? (userSnapshot.email != null
                                  ? kNeonGreen
                                  : Colors.red)
                              : (userSnapshot.pushNotificationsEnabled!
                                  ? kNeonGreen
                                  : Colors.red),
                          fontSize: SizeConfig.screenHeight * 0.02),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    kIsWeb
                        ? 'Durch die Aktivierung der Benachrichtigungen erhälst du per Mail tägliche Erinnerungen, dein Ernährungsprotokoll auszufüllen und über Inhalte der App mehr über eine umweltfreundliche Ernährung zu lernen.'
                        : 'Durch die Aktivierung der Benachrichtigungen erhälst du tägliche Erinnerungen, dein Ernährungsprotokoll auszufüllen und über Inhalte der App mehr über eine umweltfreundliche Ernährung zu lernen. Lasse die App dafür im Hintergrund geöffnet!',
                    style: TextStyle(
                        fontSize: SizeConfig.screenHeight * 0.018,
                        color: kDarkGreen),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            "${user!.email}",
            style: TextStyle(fontSize: SizeConfig.screenHeight * 0.015),
          ),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      bool accountDeletionConfirmed = false;
                      return StatefulBuilder(builder: (context, setAlertState) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          elevation: 10,
                          title: Center(
                              child: Text(
                            "Account-Löschung",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          alignment: Alignment.center,
                          content: Container(
                            height: SizeConfig.screenHeight * 0.3,
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: [
                                        TextSpan(
                                          text:
                                              "Wenn Sie fortfahren, werden ihr Account und alle damit verbundenen Daten ",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenHeight *
                                                      0.016),
                                        ),
                                        TextSpan(
                                          text: "unwiderruflich ",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenHeight *
                                                      0.016),
                                        ),
                                        TextSpan(
                                          text: "und ",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenHeight *
                                                      0.016),
                                        ),
                                        TextSpan(
                                            text: "mit sofortiger Wirkung ",
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.screenHeight *
                                                        0.016)),
                                        TextSpan(
                                          text: "gelöscht.",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenHeight *
                                                      0.016),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.01,
                                ),
                                Text(
                                  "Um fortzufahren, geben Sie nachfolgend bitte Ihre E-Mail-Adresse als Bestätigung ein:",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.screenHeight * 0.016),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.02,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  height: SizeConfig.screenHeight * 0.06,
                                  width: SizeConfig.screenWidth * 0.8,
                                  decoration: BoxDecoration(
                                    color: kNeonGreen,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: TextField(
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenHeight * 0.02,
                                          color: kDarkGreen),
                                      cursorColor: kDarkGreen,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.screenWidth * 0.04),
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    SizeConfig.screenHeight *
                                                        0.02))),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                          fontSize: SizeConfig.defaultSize! * 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (String? value) {
                                        print(accountDeletionConfirmed);
                                        print(value);

                                        if (value!.isEmpty) {
                                          //return "Bitte geben Sie Ihre E-Mail an";
                                        }
                                        if (value.toLowerCase() ==
                                            user!.email) {
                                          setAlertState(() =>
                                              accountDeletionConfirmed = true);
                                        } else {
                                          setAlertState(() =>
                                              accountDeletionConfirmed = false);
                                        }
                                        return null;
                                      }),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            Visibility(
                              visible: accountDeletionConfirmed,
                              child: GestureDetector(
                                onTap: () {
                                  userReference.delete();
                                  FirebaseAuth.instance.currentUser!.delete();
                                  FirebaseAuth.instance.signOut();
                                  RestartWidget.restartApp(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RedAnimatedGradientBox(
                                        boxHeight:
                                            SizeConfig.screenHeight * 0.07,
                                        width: SizeConfig.screenWidth * 0.5,
                                        child: Text(
                                          'Meinen Account unwiderruflich löschen',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenHeight *
                                                      0.02,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                        boxShadowList: [standardBoxShadow]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                    });
              },
              child: const Text(
                "Account löschen",
                style: TextStyle(color: kDarkGreen),
              )),
          // Visibility(
          //     visible: FirebaseAuth.instance.currentUser!.email ==
          //         "jan.palnau@mailbox.org",
          //     child: const TestingWidget()),
          // TextButton(
          //     onPressed: () {
          //       //Phoenix.rebirth(context);

          //       //Provider.of<List<DietGoal>>(context, listen: false).clear();
          //       FirebaseAuth.instance.signOut();
          //       RestartWidget.restartApp(context);

          //       //FirebaseAuth.instance.currentUser == null;
          //     },
          //     child: const Text('Ausloggen')),
          
          // TextButton(
          //     onPressed: () async {
          //       //Phoenix.rebirth(context);

          //       //Provider.of<List<DietGoal>>(context, listen: false).clear();
          //       await FirebaseAuth.instance.signOut();
          //       await FirebaseAuth.instance.currentUser!.reload();
          //       RestartWidget.restartApp(context);

          //       //FirebaseAuth.instance.currentUser == null;
          //     },
          //     child: const Text('Ausloggen')),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Stack(
            children: [
              Container(
                color: kDarkGreen,
                height: SizeConfig.screenHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ImpressumScreen(content: [Container()]),
                          ),
                        );
                      },
                      child: const Text(
                        "Impressum",
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    width: SizeConfig.screenHeight * 0.02,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Datenschutz",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ],
          ),
        ]);
      }),
    );
  }
}
