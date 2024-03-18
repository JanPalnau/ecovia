import 'package:ecovia_control/JsonObjects/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'all_screens.dart';

class ShowCaseWrap extends StatefulWidget {
  const ShowCaseWrap({Key? key}) : super(key: key);

  @override
  State<ShowCaseWrap> createState() => _ShowCaseWrapState();
}

class _ShowCaseWrapState extends State<ShowCaseWrap> {
  @override
  Widget build(BuildContext context) {
    //final DateTime date = DateTime.now();
    //final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    //final container = StateContainer.of(context);
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
        builder: Builder(builder: ((context) => AllScreens())),
        onComplete: (index, key) {
          //dynamic setPage = Provider.of<PageNotifier>(context, listen: false);
        }
      );
    });
  }
}
