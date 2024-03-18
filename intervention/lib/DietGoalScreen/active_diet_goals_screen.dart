import 'package:ecovia/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../JsonObjects/diet_goal.dart';
import '../size_config.dart';
import 'diet_goal_card.dart';
import 'diet_goal_create_screen.dart';

class ActiveDietGoalsScreen extends StatelessWidget {
  const ActiveDietGoalsScreen({
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
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03, vertical: 0),
                          child: Text(
                            'Formuliere und erreiche persönliche Ernährungsziele!',
                            style: TextStyle(
                                fontSize: SizeConfig.screenHeight * 0.025, color: kDarkGreen),
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
                      itemBuilder: (context, index) =>
                          DietGoalCard(
                            creationDate: dietGoalsList[index].creationDate,
                        id: index,
                        dietGoal: dietGoalsList[index],
                        onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>
                                     DietGoalDetailsScreen(
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              
                        backgroundColor: kDarkGreen,
                        icon: const Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Ziel erstellen',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DietGoalDetailsScreen(
                                      dietGoals: dietGoalsList,
                                      allDietGoals: allDietGoalsList,
                                      isCreationScreen: true,
                                    )),
                          );
                        },
                      ),
          ),
        ),
      ],
    );
  }
}
