import 'package:flutter/material.dart';

class AllScreensData {
  GlobalKey homeKey, environmentkey, ingredientsKey, recipesKey, surveyKey, profileKey;

  AllScreensData({required this.homeKey, required this.environmentkey, required this.ingredientsKey, required this.recipesKey, required this.surveyKey, required this.profileKey});
}

class _InheritedStateContainer extends InheritedWidget {
   // Data is your entire state. In our case just 'User' 
  final StateContainerState data;
   
  // You must pass through a child and your state.
  const _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class StateContainer extends StatefulWidget {
   // You must pass through a child. 
  final Widget child;
  final AllScreensData? allScreensData;

  const StateContainer({Key? key, 
    required this.child,
    this.allScreensData,
  }) : super(key: key);


  static StateContainerState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
            as _InheritedStateContainer).data;
  }
  
  @override
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> with TickerProviderStateMixin{
  GlobalKey homeKey = GlobalKey();
  GlobalKey environmentKey = GlobalKey();
  GlobalKey ingredientsKey = GlobalKey();
  GlobalKey recipesKey = GlobalKey();
  GlobalKey surveyKey = GlobalKey();
  GlobalKey profileKey = GlobalKey();
  GlobalKey homeKeyOne = GlobalKey();
  GlobalKey homeKeyTwo = GlobalKey();
  GlobalKey homeKeyThree = GlobalKey();
  GlobalKey environmentKeyOne = GlobalKey();
  GlobalKey environmentKeyTwo = GlobalKey();
  GlobalKey dietGoalsKeyOne = GlobalKey();
  GlobalKey dietGoalsKeyTwo = GlobalKey();
  GlobalKey recipesKeyOne = GlobalKey();
  GlobalKey recipesKeyTwo = GlobalKey();
  GlobalKey recipesKeyThree = GlobalKey();
  GlobalKey recipesKeyFour = GlobalKey();
  GlobalKey recipesKeyFive = GlobalKey();
  GlobalKey surveyKeyOne = GlobalKey();
  GlobalKey profileKeyOne = GlobalKey();
  GlobalKey ecoPointsKey = GlobalKey();
  TabController? dietGoalsTabController;
  TabController? environmentTabController;
  TabController? recipesTabController;
  PageController? recipePageController;
  int recipePage = 0;

  @override
  void initState() {
    super.initState();
    dietGoalsTabController = TabController(vsync: this, length: 2);
    environmentTabController = TabController(vsync: this, length: 2);
    dietGoalsTabController = TabController(vsync: this, length: 2);
    recipesTabController = TabController(vsync: this, length: 3);
    recipePageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}