import 'package:ecovia/EnvironmentScreen/environment_categorie_selection.dart';
import 'package:ecovia/EnvironmentScreen/info_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'environment_categories.dart';
import 'package:ecovia/References/references.dart';

import 'graph_article_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    // final Stream<DocumentSnapshot> _userStream = FirebaseFirestore.instance
    //     .collection('data')
    //     .doc('infoTexts')
    //     .snapshots();
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: BoxDecoration(
            //color: Colors.lightGreen[50]!.withOpacity(1),
            gradient: backgroundGradient(),
            //     gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: const [
            //     Colors.white,
            //     kLightGreen,
            //   ],
            // )
          ),
          child: Consumer<EnvironmentCategorieSelection>(
              builder: (context, categorieSelection, _) {
            return Column(
              children: [
                EnvironmentCategories(),
                // SizedBox(
                //   height: SizeConfig.defaultSize! * 0,
                // ),
                Expanded(
                  child: Builder(builder: (context) {
                    //ADD HERO?
                    return ListView.builder(
                        itemCount:
                            categorieSelection.selectedGraphArticles.length,
                        itemBuilder: ((context, index) => InfoTile(
                              environmentInfo: categorieSelection
                                  .selectedGraphArticles[index],
                              pushTo: (context) => GraphArticleScreen(
                                  graphArticle: categorieSelection
                                      .selectedGraphArticles[index]),
                              onPressed: userCollection
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .collection('userBehavior')
                                  .doc('userBehavior')
                                  .set({
                                'appinfo_${categorieSelection.selectedGraphArticles[index].id}':
                                    true
                              }, SetOptions(merge: true)),
                            )));
                  }),
                ),
                // Expanded(
                //     flex: 1,
                //     child: InfoBox(
                //         title: infoStatements[snapshot.data['infoTextOne']]
                //             .title,
                //         height: SizeConfig.defaultSize * 10,
                //         color: kLightGreen,
                //         description:
                //             infoStatements[snapshot.data['infoTextOne']]
                //                 .statement)),
                // Expanded(
                //   flex: 1,
                //   child: Row(
                //     children: [
                //       Flexible(
                //         flex: 1,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Container(
                //             height: SizeConfig.defaultSize * 15,
                //             decoration: BoxDecoration(
                //                 color: kDarkGreen,
                //                 borderRadius: BorderRadius.circular(16)),
                //           ),
                //         ),
                //       ),
                //       Flexible(
                //         flex: 1,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Container(
                //             height: SizeConfig.defaultSize * 15,
                //             decoration: BoxDecoration(
                //                 color: kDarkGreen,
                //                 borderRadius: BorderRadius.circular(16)),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: SizeConfig.defaultSize * 30,
                //   child: ListView.builder(
                //     physics: PageScrollPhysics(),
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 5,
                //     itemBuilder: (BuildContext context, int index) =>
                //         Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Container(
                //         height: SizeConfig.defaultSize * 20,
                //         width: SizeConfig.defaultSize * 40,
                //         decoration: BoxDecoration(
                //             color: kLightYellow,
                //             borderRadius: BorderRadius.circular(16)),
                //         child: Text(""),
                //       ),
                //     ),
                //   ),
                //),
              ],
            );
          }),
        ),
      ],
    );
  }
}
