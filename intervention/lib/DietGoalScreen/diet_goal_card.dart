import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/References/references.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../JsonObjects/diet_goal.dart';

DateFormat dateFormat = DateFormat("dd.MM.yyyy - HH:mm");

class DietGoalCard extends StatefulWidget {
  const DietGoalCard(
      {Key? key,
      required this.dietGoal,
      this.id,
      this.onTap,
      this.creationDate})
      : super(key: key);

  final DietGoal dietGoal;
  final int? id;
  final dynamic onTap;
  final DateTime? creationDate;

  @override
  State<DietGoalCard> createState() => _DietGoalCardState();
}

Color _textColor = Colors.white;
Color _textColorTwo = kDarkGreen;

class _DietGoalCardState extends State<DietGoalCard> {
  @override
  Widget build(BuildContext context) {
    CollectionReference dietGoalsReference = userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('dietGoals');
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.02,
            vertical: SizeConfig.screenHeight * 0.02),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            //border: Border.all(width: 5, color: kDarkGreen),
            color: kNeonGreen,
          ),
          child: Slidable(
            enabled: !widget.dietGoal.isFinished,
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  //flex: 2,
                  onPressed: (context) {
                    dietGoalsReference.doc(widget.dietGoal.id.toString()).set({
                      'isFinished': true,
                    }, SetOptions(merge: true));
                  },
                  backgroundColor: kDarkGreen,
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Erledigt',
                ),
                SlidableAction(
                  onPressed: (context) {
                    userCollection
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('deletedDietGoals')
                        .add({
                      'id': widget.dietGoal.id,
                      'creationDate': widget.dietGoal.creationDate.toString(),
                      'what': widget.dietGoal.what,
                      'where': widget.dietGoal.where,
                      'when': widget.dietGoal.when,
                      'how': widget.dietGoal.when,
                      'barriers': widget.dietGoal.barriers,
                      'alternative': widget.dietGoal.alternative,
                      'ifStatement': widget.dietGoal.ifStatement,
                      'thenStatement': widget.dietGoal.thenStatement,
                      'isFinished': false
                    });

                    dietGoalsReference
                        .doc(widget.dietGoal.id.toString())
                        .delete();
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Löschen',
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                // Visibility(
                //   visible: !widget.dietGoal.isFinished,
                //   child: IconButton(
                //     icon: Icon(CupertinoIcons.checkmark),
                //     color: _textColor,
                //     onPressed: () {
                //       dietGoalsReference.doc(widget.dietGoal.id.toString()).set({
                //         'isFinished': true,
                //       }, SetOptions(merge: true));
                //     },
                //   ),
                // ),
                AutoSizeText(
                  '${widget.id! + 1}. ${widget.dietGoal.what!}',
                  style: TextStyle(
                      color: _textColor,
                      //fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Text(
                  '(${dateFormat.format(widget.creationDate!)} Uhr)',
                  style: TextStyle(
                    color: _textColor,
                    //fontSize: 12
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '"Wenn ${widget.dietGoal.ifStatement!}, dann ${widget.dietGoal.thenStatement!}"',
                      style: TextStyle(
                          color: _textColor,
                          //fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: SizeConfig.screenHeight * 0.01,
                // ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                  child: Container(
                    decoration: BoxDecoration(
                        color: kLightYellow,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          DietGoalCardRow(
                            columnOneWidgets: [
                              Text(
                                'Wo?',
                                style: TextStyle(
                                    //fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: _textColorTwo),
                              ),
                            ],
                            columnTwoWidgets: [
                              Text(
                                widget.dietGoal.where!,
                                style: TextStyle(color: _textColorTwo),
                              ),
                            ],
                          ),
                          DietGoalCardRow(
                            columnOneWidgets: [
                              Text(
                                'Wann?',
                                style: TextStyle(
                                    //fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: _textColorTwo),
                              ),
                            ],
                            columnTwoWidgets: [
                              Text(
                                widget.dietGoal.when!,
                                style: TextStyle(color: _textColorTwo),
                              ),
                            ],
                          ),
                          DietGoalCardRow(
                            columnOneWidgets: [
                              Text(
                                'Wie?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _textColorTwo),
                              ),
                            ],
                            columnTwoWidgets: [
                              Text(
                                widget.dietGoal.how!,
                                style: TextStyle(color: _textColorTwo),
                              ),
                            ],
                          ),
                          DietGoalCardRow(
                            columnOneWidgets: [
                              Text(
                                'Barrieren:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _textColorTwo),
                              ),
                            ],
                            columnTwoWidgets: [
                              Text(
                                widget.dietGoal.barriers!,
                                style: TextStyle(color: _textColorTwo),
                              ),
                            ],
                          ),
                          DietGoalCardRow(
                            columnOneWidgets: [
                              AutoSizeText(
                                'Alternative:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _textColorTwo),
                              ),
                            ],
                            columnTwoWidgets: [
                              AutoSizeText(
                                widget.dietGoal.barriers!,
                                style: TextStyle(color: _textColorTwo),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DietGoalCardRow extends StatelessWidget {
  const DietGoalCardRow({
    Key? key,
    required this.columnOneWidgets,
    required this.columnTwoWidgets,
  }) : super(key: key);

  final List<Widget> columnOneWidgets;
  final List<Widget> columnTwoWidgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnOneWidgets)),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnTwoWidgets)),
      ],
    );
  }
}
