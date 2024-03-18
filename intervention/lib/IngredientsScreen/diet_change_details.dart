import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/IngredientsScreen/diet_change_screen.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../References/references.dart';

class DietChangeInfoDetails extends StatefulWidget {
  const DietChangeInfoDetails({Key? key, required this.dietchangeInfo})
      : super(key: key);
  final DietChangeInfo dietchangeInfo;
  @override
  State<DietChangeInfoDetails> createState() => _DietChangeInfoDetailsState();
}

class _DietChangeInfoDetailsState extends State<DietChangeInfoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBarWithBackButton(() => Navigator.pop(context)),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(gradient: backgroundGradient()),
          ),
          SlidingUpPanel(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
                topRight: Radius.circular(SizeConfig.defaultSize! * 4)),
            backdropEnabled: true,
            //padding: EdgeInsets.only(top: 0),
            parallaxEnabled: true,
            minHeight: SizeConfig.screenHeight * 0.7,
            maxHeight: SizeConfig.screenHeight * 0.8,
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    transitionOnUserGestures: false,
                    tag: widget.dietchangeInfo.id,
                    child: Container(
                        height: SizeConfig.screenHeight * 0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.3),
                                BlendMode.lighten),
                            image: AssetImage(widget.dietchangeInfo.imgSrc),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            panelBuilder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                controller: controller,
                children: [
                  Align(
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize! * 2),
                  SvgPicture.asset(
                    'assets/tree-plant-icon.svg',
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 1,
                  ),
                  Center(
                    child: Text(
                      widget.dietchangeInfo.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 1,
                  ),
                  Center(
                    child: Text(
                      widget.dietchangeInfo.subTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.dietchangeInfo.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 2,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.dietchangeInfo.subHeadings.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          onExpansionChanged: (value) => userCollection
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('userBehavior')
                              .doc('userBehavior')
                              .set({
                            '${widget.dietchangeInfo.title.toLowerCase()}_$index':
                                true
                          }, SetOptions(merge: true)),
                          title: Text(
                            widget.dietchangeInfo.subHeadings[index],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          iconColor: kLightGreen,
                          collapsedIconColor: Colors.grey,
                          textColor: Colors.black,
                          collapsedTextColor: Colors.black,
                          children: [
                            widget.dietchangeInfo.subWidgets[index],
                          ],
                        );
                      }),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 15,
                  )
                ],
              ),
            ),
          ),
          //Positioned(
          //top: SizeConfig.defaultSize * 5,
          //left: SizeConfig.defaultSize * 2,
          //child: InkWell(
          //onTap: () => Navigator.pop(context),
          //child: Icon(
          //CupertinoIcons.back,
          //color: kDarkGreen,
          //size: SizeConfig.defaultSize * 4,
          //),
          //),
          //),
          Positioned(
            top: SizeConfig.defaultSize! * 5,
            left: SizeConfig.defaultSize! * 4,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                shadows: const <Shadow>[
                  Shadow(color: Colors.black, blurRadius: 15.0)
                ],
                color: Colors.white,
                size: SizeConfig.defaultSize! * 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
