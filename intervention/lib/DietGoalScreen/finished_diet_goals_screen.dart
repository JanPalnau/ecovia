import 'package:ecovia/constants.dart';
import 'package:flutter/material.dart';

import '../JsonObjects/diet_goal.dart';
import '../size_config.dart';
import 'diet_goal_card.dart';
import 'diet_goal_create_screen.dart';

class FinishedDietGoalsScreen extends StatelessWidget {
  const FinishedDietGoalsScreen({
    Key? key,
    required this.dietGoalsList,
    required this.allDietGoalsList,
  }) : super(key: key);

  final List<DietGoal> dietGoalsList;
  final List<DietGoal> allDietGoalsList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: dietGoalsList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03),
                          child: Text(
                            'Markiere deine Ernährungsziele mit einem Wisch nach links als erledigt, wenn du sie erreicht hast!',
                            style: TextStyle(
                                fontSize: SizeConfig.screenHeight * 0.025,
                                color: kDarkGreen),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      // gridDelegate:
                      //     SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 1,
                      //         crossAxisSpacing: 5.0,
                      //         mainAxisSpacing: 5.0),
                      itemBuilder: (context, index) => DietGoalCard(
                        creationDate: dietGoalsList[index].creationDate,
                        id: index,
                        dietGoal: dietGoalsList[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DietGoalDetailsScreen(
                                      allDietGoals: allDietGoalsList,
                                      dietGoals: dietGoalsList,
                                      dietGoal: dietGoalsList[index],
                                      isCreationScreen: false,
                                    )),
                          );
                        },
                      ),
                      itemCount: dietGoalsList.length,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
