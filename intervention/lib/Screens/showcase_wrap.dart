import 'package:ecovia/JsonObjects/user_data.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

import '../Push Notifications/current_page.dart';
import '../Push Notifications/page_controller.dart';
import 'all_screens.dart';

class ShowCaseWrap extends StatefulWidget {
  const ShowCaseWrap({Key? key}) : super(key: key);

  @override
  State<ShowCaseWrap> createState() => _ShowCaseWrapState();
}

class _ShowCaseWrapState extends State<ShowCaseWrap> {
  @override
  Widget build(BuildContext context) {
    // final DateTime date = DateTime.now();
    // final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final container = StateContainer.of(context);
    //final List<int> recipeIDs = [for (var i = 0; i < 208; i += 1) i];
    //print(FirebaseAuth.instance.currentUser);
    // for (var element in RecipeCatalog().recipes) {
    //   print(element.id);
    //   recipeIDs.add((int.parse(element.id!)));
    // }
    //FirebaseAuth.instance.signOut();
    return Consumer<UserData>(builder: (context, userSnapshot, _) {
      //print(userSnapshot.dailyRecipes);
      // if (userSnapshot.loginDateSubmitted == false) {
        //  userReference.set({
        //    'recipeIDs': {recipeIDs},
        //  }, SetOptions(merge: true));
        //  userReference.set(
        //      {'loginDate': dateFormat.format(date)}, SetOptions(merge: true));
      // }
      return ShowCaseWidget(
        builder: Builder(builder: ((context) => const AllScreens())),
        onComplete: (index, key) {
          // ignore: unused_local_variable
          dynamic setPage = Provider.of<PageNotifier>(context, listen: false)
              .setCurrentPage = 1;
          void setPageController(page) {
            Provider.of<ControllerNotifier>(context, listen: false)
                .pageController
                .jumpToPage(page);
          }

          if (index == 8) {
            setPage = 1;
            setPageController(1);
          }
          if (index == 9) {
            container.environmentTabController!.animateTo(1);
          }
          if (index == 10) {
            setPage = 2;
            setPageController(2);
          }
          if (index == 11) {
            container.dietGoalsTabController!.animateTo(1);
          }
          if (index == 12) {
            setPage = 3;
            setPageController(3);
          }
          if (index == 15) {
            container.recipesTabController!.animateTo(1);
          }
          if (index == 16) {
            container.recipesTabController!.animateTo(2);
          }
          if (index == 17) {
            setPage = 4;
            setPageController(4);
          }
          if (index == 18) {
            setPage = 5;
            setPageController(5);
          }
          if (index == 20) {
            setPage = 0;
            setPageController(0);
          }
        },
      );
    });
  }
}
