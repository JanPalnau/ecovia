import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/JsonObjects/diet_goal.dart';
import 'package:ecovia/Screens/build_app_bars.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../References/references.dart';

class DietGoalDetailsScreen extends StatefulWidget {
  const DietGoalDetailsScreen(
      {Key? key,
      required this.dietGoals,
      required this.allDietGoals,
      this.dietGoal,
      required this.isCreationScreen})
      : super(key: key);

  final List<DietGoal> dietGoals;
  final List<DietGoal> allDietGoals;
  final DietGoal? dietGoal;
  final bool isCreationScreen;

  @override
  State<DietGoalDetailsScreen> createState() => _DietGoalDetailsScreenState();
}

TextEditingController _controllerWhat = TextEditingController();
TextEditingController _controllerWhere = TextEditingController();
TextEditingController _controllerWhen = TextEditingController();
TextEditingController _controllerHow = TextEditingController();
TextEditingController _controllerBarriers = TextEditingController();
TextEditingController _controllerAlternative = TextEditingController();
TextEditingController _controllerIfStatement = TextEditingController();
TextEditingController _controllerThenStatement = TextEditingController();

class _DietGoalDetailsScreenState extends State<DietGoalDetailsScreen> {
  @override
  void initState() {
    if (widget.isCreationScreen == false) {
      _controllerWhat.text = widget.dietGoal!.what!;
      _controllerWhere.text = widget.dietGoal!.where!;
      _controllerWhen.text = widget.dietGoal!.when!;
      _controllerHow.text = widget.dietGoal!.how!;
      _controllerBarriers.text = widget.dietGoal!.barriers!;
      _controllerAlternative.text = widget.dietGoal!.alternative!;
      _controllerIfStatement.text = widget.dietGoal!.ifStatement!;
      _controllerThenStatement.text = widget.dietGoal!.thenStatement!;
    } else if (widget.isCreationScreen == true) {
      _controllerWhat.text = "";
      _controllerWhere.text = "";
      _controllerWhen.text = "";
      _controllerHow.text = "";
      _controllerBarriers.text = "";
      _controllerAlternative.text = "";
      _controllerIfStatement.text = "";
      _controllerThenStatement.text = "";
    }
    super.initState();
  }

  DateTime date = DateTime.now();
  DateFormat dateFormat = DateFormat("dd.MM.yyyy - HH:mm");

  CollectionReference dietGoalsReference = userCollection
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('dietGoals');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBarWithBackButton(() {
          if (_controllerWhat.text.isNotEmpty) {
            setDietGoalReference();
          }
          Navigator.pop(context);
        }),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        widget.isCreationScreen
                            ? dateFormat.format(date)
                            : '${dateFormat.format(widget.dietGoal!.creationDate)} Uhr',
                        style: const TextStyle(color: kDarkGreen, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                      '1. Formuliere dein Ziel.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      'Versuche möglichst spezifisch zu sein (z.B.: "Ich möchte mehr vegetarische Gerichte essen" oder "Ich will Rindfleischburger durch Beyond Meat Burger ersetzen."',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    TextField(
                      cursorColor: kNeonGreen,
                      controller: _controllerWhat,
                      onChanged: (onChanged) {
                        setState(() {});
                      },
                      decoration: inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 3,
                    ),
                    const Text(
                        '2. Überlege dir konkrete Situationen, in denen du dein Ziel umsetzen kannst.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text.rich(TextSpan(
                        text: 'Beschreibe spezifisch ',
                        style: TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                              text: 'wo',
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          TextSpan(text: ', '),
                          TextSpan(
                              text: 'wann ',
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          TextSpan(
                            text: 'und ',
                          ),
                          TextSpan(text: ''),
                          TextSpan(
                              text: 'wie ',
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          TextSpan(text: 'du dein Ziel umsetzen möchtest.')
                        ])),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                        '2.1 Wo willst du dein Ziel umsetzen? (z.B. im Restaurant, Zuhause)'),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    TextField(
                      controller: _controllerWhere,
                      decoration: inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                        '2.2 Wann willst du dein Ziel umsetzen? (z.B. beim Abendessen, zum Frühstück)'),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    TextField(
                      controller: _controllerWhen,
                      decoration: inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                        '2.3. Wie willst du dein Ziel umsetzen? (z.B. ein vegetarisches Gericht bestellen/kochen)"'),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    TextField(
                      controller: _controllerHow,
                      decoration: inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                      '3. Überlege dir mögliche Barrieren, die dem Erreichen deines Ziels im Weg stehen könnten.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                      'Beispiele:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Beim geplanten Restaurantbesuch werde ich ein veganes Gericht bestellen."',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Text(
                      'Mögliche Barriere: Es gibt im Restaurant keine veganen Gerichte',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Jeden Montag werde ich ein vegetarisches Gericht essen."',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Text(
                      'Mögliche Barriere: Ich werde am Montag spontan von einem Freund zum Steak-Essen eingeladen.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Ich werde sonntags vegetarische Gerichte für die Familie vorkochen."',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Text(
                      'Mögliche Barriere: Meinen Kindern schmecken die vegetarischen Gerichte nicht.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    TextField(
                      controller: _controllerBarriers,
                      decoration: inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: const TextStyle(height: 1, fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                      '4. Überlege dir Alternativen oder Strategien, um die identifizierten Barrieren zu überwinden.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Beispiele:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Es gibt im Restaurant keine veganen Gerichte"',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Text(
                      'Mögliche Alternative: Stattdessen ein vegetarisches Gericht bestellen.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Ich werde am Montag spontan von einem Freund zum Steak-Essen eingeladen."',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Text(
                      'Mögliche Alternative: Ein Restaurant mit vegetarischen/veganen Optionen vorschlagen.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Meinen Kindern schmecken die vegetarischen Gerichte nicht."',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Text(
                      'Mögliche Alternative: Kinder nach vegetarischen Lieblingsgerichten fragen.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    TextField(
                      controller: _controllerAlternative,
                      decoration: inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                      '5. Formuliere deine Strategie in deinem Wenn-Dann-Satz.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Beispiele:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Wenn es im Restaurant keine veganen Gerichte gibt, bestelle ich ein vegetarisches."',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Wenn ich zum Steak-Essen eingeladen werde, schlage ich ein Restaurant mit vegetarischen/veganen Optionen als Alternative vor."',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    const Text(
                      '"Wenn meinen Kindern die Rezepte nicht schmecken, frage ich sie nach ihren vegetarischen Lieblingsrezepten."',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                      'Wenn...',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: _controllerIfStatement,
                      decoration: inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    const Text(
                      ', dann...',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: _controllerThenStatement,
                      decoration: inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _controllerWhat.text.isNotEmpty,
                child: FloatingActionButton.extended(
                  backgroundColor: kDarkGreen,
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Ziel speichern',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setDietGoalReference();

                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              )
            ],
          ),
        ));
  }

  void setDietGoalReference() {
    widget.isCreationScreen
        ? dietGoalsReference.doc(widget.allDietGoals.length.toString()).set({
            'id': widget.allDietGoals.isEmpty ? 0 : widget.allDietGoals.length,
            'creationDate': date.toString(),
            'what': _controllerWhat.text,
            'where': _controllerWhere.text,
            'when': _controllerWhen.text,
            'how': _controllerHow.text,
            'barriers': _controllerBarriers.text,
            'alternative': _controllerAlternative.text,
            'ifStatement': _controllerIfStatement.text,
            'thenStatement': _controllerThenStatement.text,
            'isFinished': false
          }, SetOptions(merge: true))
        : dietGoalsReference.doc(widget.dietGoal!.id.toString()).set({
            'what': _controllerWhat.text,
            'where': _controllerWhere.text,
            'when': _controllerWhen.text,
            'how': _controllerHow.text,
            'barriers': _controllerBarriers.text,
            'alternative': _controllerAlternative.text,
            'ifStatement': _controllerIfStatement.text,
            'thenStatement': _controllerThenStatement.text,
            'isFinished': false
          }, SetOptions(merge: true));
  }

  InputDecoration inputDecoration() {
    return const InputDecoration(
      prefixIconColor: kNeonGreen,
      suffixIconColor: kNeonGreen,
      hoverColor: kNeonGreen,
      iconColor: kNeonGreen,
      focusColor: kNeonGreen,
      fillColor: kNeonGreen,
      enabledBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: BorderSide(color: Colors.grey, width: 0.0),
      ),
      border: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: BorderSide(color: kNeonGreen, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: BorderSide(color: kNeonGreen, width: 2),
      ),
    );
  }
}
