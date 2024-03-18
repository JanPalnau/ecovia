import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/Screens/build_app_bars.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../References/references.dart';
import 'get_source_urls.dart';
import '../constants.dart';
import '../size_config.dart';
import 'graph_article.dart';

class GraphArticleScreen extends StatefulWidget {
  const GraphArticleScreen({Key? key, required this.graphArticle})
      : super(key: key);

  final GraphArticle graphArticle;

  @override
  State<GraphArticleScreen> createState() => _GraphArticleScreenState();
}

class _GraphArticleScreenState extends State<GraphArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithBackButton(() => Navigator.pop(context)),
      body: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                gradient: backgroundGradient(),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              child: Container(
                                constraints: BoxConstraints(
                                    maxHeight: SizeConfig.screenHeight * 0.55),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: kDarkGreen)),
                                child: PhotoView(
                                    filterQuality: FilterQuality.high,
                                    tightMode: true,
                                    backgroundDecoration: const BoxDecoration(
                                        color: Colors.white),
                                    imageProvider: AssetImage(
                                        widget.graphArticle.graphAsset)),
                              ),
                            ),
                          ),
                          Visibility(
                            visible:
                                widget.graphArticle.copyrightInfo.isNotEmpty,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.graphArticle.copyrightInfo,
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.screenHeight * 0.016,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.screenHeight * 0.01,
                                horizontal: SizeConfig.screenWidth * 0.02),
                            child: ExpandableText(
                              widget.graphArticle.articleText,
                              expandText: 'mehr anzeigen',
                              collapseText: 'weniger anzeigen',
                              maxLines: 3,
                              linkStyle: const TextStyle(color: kNeonGreen),
                              onExpandedChanged: (isExpanded) {
                                userCollection
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .collection('userBehavior')
                                    .doc('userBehavior')
                                    .set({
                                  'appinfo_${widget.graphArticle.id}': true
                                }, SetOptions(merge: true));
                              },
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight * 0.016),
                            ),
                          ),
                          Visibility(
                            visible: widget.graphArticle.sourceUrls.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  getSourceUrls(widget.graphArticle.sourceUrls),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
