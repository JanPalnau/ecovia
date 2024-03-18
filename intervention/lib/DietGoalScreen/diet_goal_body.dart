import 'package:ecovia/DietGoalScreen/finished_diet_goals_screen.dart';
import 'package:ecovia/JsonObjects/diet_goal.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/showcase_labels_list.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'active_diet_goals_screen.dart';

class DietGoalBody extends StatefulWidget {
  const DietGoalBody({Key? key}) : super(key: key);

  @override
  State<DietGoalBody> createState() => _DietGoalBodyState();
}

class _DietGoalBodyState extends State<DietGoalBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //bool? isEmpty;
    final stateContainer = StateContainer.of(context);
    return SafeArea(
      child: Consumer<List<DietGoal>>(builder: (context, dietGoals, _) {
        List<DietGoal> allDietGoalsList = dietGoals;
        List<DietGoal> dietGoalsList =
            dietGoals.where((element) => element.isFinished == false).toList();
        List<DietGoal> finishedDietGoalsList =
            dietGoals.where((element) => element.isFinished == true).toList();
        return Container(
          decoration: BoxDecoration(gradient: backgroundGradient()),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                SizedBox(height: SizeConfig.defaultSize! * 0.5),
                Showcase(
                  key: stateContainer.dietGoalsKeyOne,
                  description: showCaseLabels[11],
                  targetBorderRadius: BorderRadius.circular(16),
                  targetPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  tooltipBorderRadius: BorderRadius.circular(16),
                  tooltipPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  // shapeBorder: const CircleBorder(),
                  // overlayPadding:
                  //     const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Tab(
                    text: "Deine Zielsetzungen".toUpperCase(),
                  ),
                ),
                TabBar(
                  tabs: [
                    Tab(
                      text: 'Offen'.toUpperCase(),
                    ),
                    Showcase(
                      key: stateContainer.dietGoalsKeyTwo,
                      description: showCaseLabels[12],
                      targetBorderRadius: BorderRadius.circular(16),
                      targetPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      tooltipBorderRadius: BorderRadius.circular(16),
                      tooltipPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Tab(
                        text: 'Erledigt'.toUpperCase(),
                      ),
                    )
                  ],
                  controller: stateContainer.dietGoalsTabController,
                  labelColor: Colors.black,
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2),
                      insets: EdgeInsets.symmetric(horizontal: 10)),
                  unselectedLabelColor: Colors.black.withOpacity(0.3),
                ),
                Expanded(
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: stateContainer.dietGoalsTabController,
                      children: [
                        ActiveDietGoalsScreen(
                            dietGoalsList: dietGoalsList,
                            allDietGoalsList: allDietGoalsList),
                        FinishedDietGoalsScreen(
                          dietGoalsList: finishedDietGoalsList,
                          allDietGoalsList: allDietGoalsList,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
