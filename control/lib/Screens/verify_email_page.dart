import 'dart:async';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia_control/Screens/build_app_bars.dart';
import 'package:ecovia_control/Screens/showcase_wrap.dart';
import 'package:ecovia_control/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../References/references.dart';
import '../animated_gradient_box.dart';
import '../restart_app.dart';
import '../size_config.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    errorMessage = '';

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    if (mounted) {
      setState(() {
        isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      });

      if (isEmailVerified) {
        timer?.cancel();
      }
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      canResendEmail = false;
      await Future.delayed(const Duration(seconds: 10));
      canResendEmail = true;
    } on FirebaseAuthException catch (e) {
      //print(e.code);
      setState(() {
        switch (e.code) {
          case 'too-many-requests':
            errorMessage =
                'Zu viele Bestätigungsanfragen. Versuche es später noch einmal.';
            break;
        }
      });
      // setState(() {
      //   errorMessage = e.toString();
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    DocumentReference userReference =
        userCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    SizeConfig().init(context);
    final DateTime date = DateTime.now();
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    ///final container = StateContainer.of(context);
    final List<int> recipeIDs = [for (var i = 0; i < 208; i += 1) i];
    //FirebaseAuth.instance.signOut();
    if (!isEmailVerified) {
      userReference.set({
        'recipeIDs': recipeIDs,
      }, SetOptions(merge: true));
      userReference
          .set({'loginDate': dateFormat.format(date)}, SetOptions(merge: true));
    }
    initPlatformState();
    return isEmailVerified
        ? ShowCaseWrap()
        //Container(color: Colors.pink, child: TextButton(onPressed: () {print(FirebaseAuth.instance.currentUser!.uid); }, child: Text('logout'),),)
        : Stack(
            children: [
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
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
              Scaffold(
                appBar: buildSimpleAppBar(),
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8.0),
                          child: Text(
                            'Eine Bestätigungsmail wurde an ${FirebaseAuth.instance.currentUser!.email} gesendet.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: kDarkGreen,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 1,
                        ),
                        Visibility(
                          visible: errorMessage!.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8.0),
                            child: Text(
                              errorMessage!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 3,
                        ),
                        AnimatedGradientBox(
                          boxShadowList: animatedGradientBoxShadow,
                          child: TextButton.icon(
                            // style: ElevatedButton.styleFrom(
                            //   primary: Colors.transparent,
                            // ),
                            onPressed:
                                canResendEmail ? sendVerificationEmail : () {},
                            icon: const Icon(
                              FontAwesomeIcons.envelope,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'E-Mail erneut senden',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: const [standardBoxShadow],
                          ),
                          child: TextButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                await FirebaseAuth.instance.currentUser!
                                    .reload();
                                RestartWidget.restartApp(context);

                                //userReference.delete();
                                //FirebaseAuth.instance.currentUser!.delete();
                                //FirebaseAuth.instance.signOut();
                                //RestartWidget.restartApp(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Abbrechen',
                                  style: TextStyle(
                                      color: kDarkGreen, fontSize: 20),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

initPlatformState() async {
  if (kIsWeb == true) {
    String? deviceData;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    deviceData = webBrowserInfo.browserName.name;
    userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userBehavior')
        .doc('userBehavior')
        .set({'browserName': deviceData}, SetOptions(merge: true));
  }
}
