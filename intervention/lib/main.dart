import 'package:ecovia/AuthPage/auth_page.dart';
import 'package:ecovia/EnvironmentScreen/environment_categorie_selection.dart';
import 'package:ecovia/JsonObjects/diet_goal.dart';
import 'package:ecovia/JsonObjects/favorite_recipe.dart';
import 'package:ecovia/JsonObjects/survey_answers_pre_data.dart';
import 'package:ecovia/MapsUrl/application_bloc.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:ecovia/Screens/verify_email_page.dart';
import 'package:ecovia/Streams%20and%20providers/diet_goals_stream.dart';
import 'package:ecovia/Streams%20and%20providers/favorite_recipes_stream.dart';
import 'package:ecovia/Streams%20and%20providers/survey_answers_pre_data_stream.dart';
import 'package:ecovia/Streams%20and%20providers/user_data_stream.dart';
import 'package:ecovia/Streams%20and%20providers/survey_answers_post_data_stream.dart';

import 'package:ecovia/Push%20Notifications/current_page.dart';
import 'package:ecovia/Push%20Notifications/page_controller.dart';
import 'package:ecovia/RecipeScreen/recipe_categorie_selection.dart';
import 'package:ecovia/RecipeScreen/favorites_selection.dart';
import 'package:ecovia/SurveyScreen/database.dart';
import 'package:ecovia/authentication_service.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/recipes.dart';
import 'package:ecovia/restart_widget.dart';
import 'package:ecovia/scroll_behavior.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'JsonObjects/survey_answers_post_data.dart';
import 'JsonObjects/user_data.dart';
import 'firebase_options.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   //await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb ? firebaseConfig : DefaultFirebaseOptions.currentPlatform,
  );

//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   NotificationSettings settings = await messaging.requestPermission(
//   alert: true,
//   announcement: false,
//   badge: true,
//   carPlay: false,
//   criticalAlert: false,
//   provisional: false,
//   sound: true,
// );

// print('User granted permission: ${settings.authorizationStatus}');

// String? token = await messaging.getToken(
//    vapidKey: "BHZGqPAfuBNO97WzfO281i7w-uuPe75JRzxdcsoNSTMVVqJCbAXKqWnb6RlzwhxMwxlREnEU8E76542fejQIg7Y",

//  );
// print(token);
// FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   print('Got a message whilst in the foreground!');
//   print('Message data: ${message.data}');

//   if (message.notification != null) {
//     print('Message also contained a notification: ${message.notification}');
//   }
// });

  runApp(const StateContainer(child: RestartWidget(child: MyApp())));
}

FirebaseOptions firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyDxKgL3GSJb6654s8CG259seF4RF1acvrI",
    authDomain: "ecovia-c741e.firebaseapp.com",
    projectId: "ecovia-c741e",
    storageBucket: "ecovia-c741e.appspot.com",
    messagingSenderId: "749174894848",
    appId: "1:749174894848:web:9ca4f80cfe96fb054c03e5",
    measurementId: "G-9MBDFH83LM");

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void didChangeDependencies() {
  //   for (var recipe in RecipeCatalog().recipes) {
  //     //if(int.parse(recipe.id!) < 50) {
  //     precacheImage(AssetImage(recipe.imgSrc!), context);
  //     //}

  //   }
  //   for (var image in backgroundImageList) {
  //       precacheImage(image, context);
  //     }

  //     for (var image in paulaImageList) {
  //       precacheImage(image, context);
  //     }
  //   precacheImage(ecoviaIcon, context);
  //     precacheImage(ecoviaIconWithText, context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    bool isDesktopWeb = (kIsWeb &&
        (Theme.of(context).platform == TargetPlatform.macOS ||
            Theme.of(context).platform == TargetPlatform.windows ||
            Theme.of(context).platform == TargetPlatform.linux));
    bool isMobileNotWeb = (!kIsWeb &&
        (Theme.of(context).platform == TargetPlatform.android ||
            Theme.of(context).platform == TargetPlatform.iOS));

    // final List<int> recipeIDs = [for (var i = 0; i < 208; i += 1) i];
    // FirebaseAuth.instance.signOut();
    //   userReference.set({
    //     'recipeIDs': recipeIDs,
    //   }, SetOptions(merge: true));


    // userReference.set({
    //       //  'recipeIDs':
    //       //    [recipeIDs]
    //       //,
    //       'paulaTextReceived': true,
    //       'followUpCompleted': false,
    //       'dietType': 0,
    //       'pushNotificationsEnabled': true,
    //       'completionStatus': false,
    //       'completionDaily': false,
    //       'preQuestionnaireFinished': false,
    //       'currentPaula': 1,
    //       'currentBackground': 3,
    //       'registerDate': '',
    //       'studyCompleted': false,
    //       'loginDate': '',
    //       'loginDateSubmitted': false,
    //       'paulaStatementsInitial': false,
    //       'isFirstLaunch': true,
    //       'dailyRecipesGenerated': false,
    //       'dailyRecipes': {'recipeOne': 0, 'recipeTwo': 1, 'recipeThree': 2},
    //       'feedbackReceived': false,
    //       'ecoPoints': 0,
    //       'ecoPointsReceived': true,
    //       'updatedBackground': false,
    //     }, SetOptions(merge: true));



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
    List<FavoriteRecipe> favoriteRecipes = [];
    for (var recipe in RecipeCatalog().recipes) {
      favoriteRecipes
          .add(FavoriteRecipe(int.parse(recipe.id!), recipe.isFavorized));
    }
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
        StreamProvider<List<FavoriteRecipe>>(
          create: (context) =>
              FavoriteRecipesStream().fetchFavoriteRecipesData(),
          initialData: const [],
        ),
        StreamProvider<List<DietGoal>>(
          create: (context) => DietGoalsStream().fetchDietGoalsData(),
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
      ],
      child: MultiProvider(
        providers: [
          // ChangeNotifierProvider(
          //   create: (context) => NavItems(),
          // ),

          ChangeNotifierProvider(
            create: (context) => ApplicationBloc(),
          ),
          ChangeNotifierProvider(
            create: (context) => RecipeCategorieSelection(),
          ),
          ChangeNotifierProvider(
            create: (context) => EnvironmentCategorieSelection(),
          ),
          ChangeNotifierProvider(
            create: (context) => FavoritesSelection(),
          ),
          ChangeNotifierProvider(
            create: (context) => RecipeCatalog(),
          ),
          ChangeNotifierProvider(
            create: (context) => Recipe(),
          ),
          ChangeNotifierProvider(
            create: (context) => DatabaseService(),
          ),
          ChangeNotifierProvider(create: (context) => PageNotifier()),
          ChangeNotifierProvider(create: (context) => ControllerNotifier()),
        ],
        child: MaterialApp(
          builder: (context, child) => isDesktopWeb || isMobileNotWeb
              //|| isMobileNotWeb
              ? (MediaQuery.of(context).size.height > 600)
                  ? ResponsiveWrapper.builder(
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: isDesktopWeb &&
                                    MediaQuery.of(context).size.shortestSide >
                                        600
                                ? 10
                                : 0),
                        child: Container(
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      isDesktopWeb &&
                                              MediaQuery.of(context)
                                                      .size
                                                      .shortestSide >
                                                  600
                                          ? 12
                                          : 0),
                                  child: child),
                            ],
                          ),
                          decoration: BoxDecoration(
                            boxShadow: isDesktopWeb &&
                                    MediaQuery.of(context).size.shortestSide >
                                        600
                                ? [standardBoxShadow]
                                : [],
                          ),
                        ),
                      ),
                      maxWidth: isDesktopWeb &&
                              MediaQuery.of(context).size.shortestSide > 600
                          ? 400
                          : double.infinity,
                      minWidth: isDesktopWeb &&
                              MediaQuery.of(context).size.shortestSide > 600
                          ? 200
                          : double.infinity,
                      //   breakpoints: [
                      //     ResponsiveBreakpoint.autoScale(800, name: TABLET),
                      //     ResponsiveBreakpoint.resize(1000, name: DESKTOP),
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
                                  //JumpingDots(numberOfDots: 3)
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
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Besuch mich doch mal auf deinem PC  🖥️',
                                style: TextStyle(color: Colors.white),
                              ),
                              // Column(
                              //   children: [
                              //     JumpingDots(numberOfDots: 3),
                              //   ],
                              // )
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
          title: 'ECOVIA',
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
            return const VerifyEmailPage();
          } else {
            return const AuthPage();
          }
        });
  }
}
