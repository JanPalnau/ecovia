import 'package:ecovia_control/AuthPage/auth_page.dart';
import 'package:ecovia_control/JsonObjects/survey_answers_pre_data.dart';
import 'package:ecovia_control/Screens/state_container.dart';
import 'package:ecovia_control/Screens/verify_email_page.dart';
import 'package:ecovia_control/Streams/survey_answers_pre_data_stream.dart';
import 'package:ecovia_control/Streams/user_data_stream.dart';
import 'package:ecovia_control/Streams/survey_answers_post_data_stream.dart';
import 'package:ecovia_control/authentication_service.dart';
import 'package:ecovia_control/constants.dart';
import 'package:ecovia_control/restart_app.dart';
import 'package:ecovia_control/scroll_behavior.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'JsonObjects/survey_answers_post_data.dart';
import 'JsonObjects/user_data.dart';
import 'JumpingDots/jumping_dots.dart';
// import 'Screens/pre_questionnaire_page_notifier.dart';
// import 'Screens/pre_questionnaire_survey_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: kIsWeb ? firebaseConfig : null
      //name: 'ECOVIA control',
      //options: DefaultFirebaseOptions.currentPlatform,
      // options: FirebaseOptions(
      //     apiKey: "AIzaSyDxKgL3GSJb6654s8CG259seF4RF1acvrI",
      //     appId: "1:749174894848:web:fdf1a6f6e3b88d044c03e5",
      //     messagingSenderId: "749174894848",
      //     projectId: "ecovia-c741e")
      );
  runApp(StateContainer(child: RestartWidget(child: const MyApp())));
}

FirebaseOptions firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyDxKgL3GSJb6654s8CG259seF4RF1acvrI",
    authDomain: "ecovia-c741e.firebaseapp.com",
    projectId: "ecovia-c741e",
    storageBucket: "ecovia-c741e.appspot.com",
    messagingSenderId: "749174894848",
    appId: "1:749174894848:web:1045308c90ed8bc04c03e5",
    measurementId: "G-CL8R74HY21");

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    precacheImage(ecoviaIcon, context);
    precacheImage(ecoviaIconWithText, context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktopWeb = (kIsWeb &&
        (Theme.of(context).platform == TargetPlatform.macOS ||
            Theme.of(context).platform == TargetPlatform.windows ||
            Theme.of(context).platform == TargetPlatform.linux));
    bool isMobileNotWeb = (!kIsWeb &&
        (Theme.of(context).platform == TargetPlatform.android ||
            Theme.of(context).platform == TargetPlatform.iOS));
    //FirebaseAuth.instance.signOut();
    // for (var recipe in RecipeCatalog().recipes) {
    //    //recipeMap[recipe.id] = recipe.isFavorized;
    //    favoriteRecipesReference.doc(recipe.id!).set({'id': int.parse(recipe.id!), 'isFavorized': false});
    //    //favoriteRecipesReference.set({'${recipe.id}' : recipe.isFavorized}, SetOptions(merge: true));
    // }
    //final Stream<QuerySnapshot> surveyAnswerStream = FirebaseFirestore.instance
    //  .collection("users")
    //  .doc(FirebaseAuth.instance.currentUser.uid)
    //  .collection('surveyAnswers')
    //  .orderBy('date', descending: true)
    //  .snapshots();
    // List<bool> favoriteRecipesList = [];

    // for (int i = 0; i < 209; i++) {
    //   favoriteRecipesList.add(false);
    // }

    // recipeDataReference.set({'favoriteRecipes': favoriteRecipesList});
    //  for (var recipe in RecipeCatalog().recipes) {
    //    favoriteRecipesReference.doc(recipe.id!).set({recipe.id! : false});
    // }
    // final List<int> recipeIDs = [];
    // for (var element in RecipeCatalog().recipes) {
    //   recipeIDs.add((int.parse(element.id!)));
    // }
    //FirebaseAuth.instance.signOut();
    // userReference.set({
    //   'recipeIDs': {
    //     [recipeIDs]
    //   },
    // });
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        StreamProvider<List<SurveyAnswersPostData>>(
          create: (context) =>
              SurveyAnswerPostDataStream().fetchSurveyAnswersPostData(),
          initialData: const [],
        ),
        StreamProvider<List<SurveyAnswersPreData>>(
          create: (context) =>
              SurveyAnswerPreDataStream().fetchSurveyAnswersPreData(),
          initialData: const [],
        ),
        // StreamProvider<DocumentSnapshot?>(
        //   create: (context) =>
        //       favoriteRecipeStream,
        //   initialData: null,
        //   catchError: ,
        // ),
        StreamProvider<UserData>(
          create: (context) => UserDataStream().fetchUserData(),

          initialData: const UserData(
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null),
          // const UserData(
          //     1,
          //     1,
          //     '2022-08-16',
          //     false,
          //     false,
          //     false,
          //     false,
          //     false,
          //     false,
          //     false,
          //     true,
          //     false,
          //     {'recipeOne': 0, 'recipeTwo': 1, 'recipeThree': 2},
          //     false,
          //     [0],
          //     true,
          //     0,
          //     0,
          //     true),
        ),
        //StreamProvider<RecipeData>(create: (context) => RecipeDataStream().fetchRecipeData(), initialData: RecipeData(favoriteRecipesList))
        // StreamProvider<RecipeData>(create: (context) => RecipeDataStream().fetchFavoriteRecipesData(), initialData: RecipeData(favoriteRecipes: {}))
        //StreamProvider<QuerySnapshot>.value(
        //  initialData: null,
        //value: surveyAnswerStream,
        //child: StreamBuilder<QuerySnapshot>(
        //stream: surveyAnswerStream,
        //builder:
        // ignore: missing_return
        //    (context, snapshot) {
        //    if (snapshot.hasError) {
        //    return Text("Etwas ist schiefgelaufen: ${snapshot.error}");
        //}
        // if (snapshot.connectionState == ConnectionState.waiting) {
        // return Center(
        // child: CircularProgressIndicator(color: kLightGreen),
        //);
        // }
        // }
        // )
        // )
        // ChangeNotifierProvider(
        //     create: (context) => PreQuestionnairePageNotifier()),
        // ChangeNotifierProvider(create: (context) => SurveyControllerNotifier()),
        // ChangeNotifierProvider(
        //     create: (context) => PreQuestionnaireControllerNotifier()),
      ],
      child: MaterialApp(
        builder: (context, child) => isDesktopWeb || isMobileNotWeb
            ? (MediaQuery.of(context).size.height > 600)
                ? ResponsiveWrapper.builder(
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: isDesktopWeb &&
                                  MediaQuery.of(context).size.shortestSide > 600
                              ? 10
                              : 0),
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(isDesktopWeb &&
                                    MediaQuery.of(context).size.shortestSide >
                                        600
                                ? 12
                                : 0),
                            child: child),
                        decoration: BoxDecoration(
                          boxShadow: isDesktopWeb &&
                                  MediaQuery.of(context).size.shortestSide > 600
                              ? [standardBoxShadow]
                              : [],
                        ),
                      ),
                    ),
                    maxWidth:
                        kIsWeb && MediaQuery.of(context).size.shortestSide > 600
                            ? 400
                            : double.infinity,
                    minWidth:
                        kIsWeb && MediaQuery.of(context).size.shortestSide > 600
                            ? 200
                            : double.infinity,
                    //defaultScale: true,
                    // breakpoints: [
                    //   ResponsiveBreakpoint.resize(480, name: MOBILE),
                    //   ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    //   ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    // ],
                    background: Container(color: kNeonGreen))
                : Scaffold(
                    body: Stack(
                      children: [
                        Container(
                          color: kNeonGreen,
                        ),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Mach mich größer 🌱',
                                  style: TextStyle(
                                      fontSize: 50, color: Colors.white),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(bottom: 15.0),
                                //   child: JumpingDots(numberOfDots: 3),
                                // )
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  )
            : Scaffold(
                body: Stack(
                  children: [
                    Container(
                      color: kNeonGreen,
                    ),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Besuch mich doch mal auf deinem PC  🖥️',
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: JumpingDots(numberOfDots: 3),
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'ECOVIA - Ernährungsprotokoll',
        theme: ThemeData(
          fontFamily: GoogleFonts.titilliumWeb().fontFamily,
          primaryColor: kLightGreen,
          //backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme(
                  primary: kLightGreen,
                  primaryContainer: kLightGreen.withOpacity(0.7),
                  secondary: kDarkGreen.withOpacity(0.7),
                  secondaryContainer: kDarkGreen.withOpacity(0.7),
                  surface: kDarkGreen.withOpacity(0.7),
                  background: Colors.white,
                  error: kDarkGreen.withOpacity(0.7),
                  onPrimary: kDarkGreen.withOpacity(0.7),
                  onSecondary: kDarkGreen.withOpacity(0.7),
                  onSurface: kDarkGreen.withOpacity(0.7),
                  onBackground: kDarkGreen.withOpacity(0.7),
                  onError: kDarkGreen.withOpacity(0.7),
                  brightness: Brightness.light)
              .copyWith(background: Colors.white),
        ),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final firebaseUser = context.watch<User?>();
    // final container = StateContainer.of(context);
    // if (firebaseUser != null) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: kDarkGreen),
            );
          } else if (userSnapshot.hasError) {
            return const Center(
              child: Text(
                'Es ist etwas schiefgelaufen',
                style: TextStyle(color: kDarkGreen),
              ),
            );
          } else if (userSnapshot.hasData) {
            return VerifyEmailPage();
          } else {
            return const AuthPage();
          }
        });
  }
}
