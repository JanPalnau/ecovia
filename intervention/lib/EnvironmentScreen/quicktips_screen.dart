import 'dart:async';

import 'package:ecovia/EnvironmentScreen/expandable_text.dart';
import 'package:ecovia/EnvironmentScreen/graph_article.dart';
import 'package:ecovia/JsonObjects/user_data.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:ecovia/References/references.dart';
import 'package:intl/intl.dart';

import 'get_source_urls.dart';

class QuicktipsScreen extends StatefulWidget {
  const QuicktipsScreen({Key? key}) : super(key: key);

  @override
  State<QuicktipsScreen> createState() => _QuicktipsScreenState();
}

class _QuicktipsScreenState extends State<QuicktipsScreen>
    with TickerProviderStateMixin {
  final DateTime date = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  final PageController _pageController = PageController();
  TabController? _tabController;
  Timer? _timer;
  late int graphArticleLength = 0;
  final PhotoViewScaleStateController _photoViewScaleStateController =
      PhotoViewScaleStateController();
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 20), (Timer timer) {
      if (_tabController!.index == 0 && graphArticleLength > 1) {
        //_tabController!.animateTo(_tabController!.index++);
        _pageController.animateToPage(1,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.bounceIn);
      }
    });
    _photoViewScaleStateController.addIgnorableListener(() {
      _timer!.cancel();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _tabController?.dispose();
    _photoViewScaleStateController.dispose();
    super.dispose();
  }

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
          child: Consumer<UserData>(
              // ignore: missing_return
              builder: (context, userSnapshot, child) {
            {
              DateTime loginDate = dateFormat.parse(userSnapshot.loginDate!);
              int interventionDay = date.difference(loginDate).inDays;
              //print(interventionDay);
              if (interventionDay >= 29) {
                interventionDay = 29;
              }

              // CHANGE TO [interventionDay]
              List<GraphArticle> dailyArticles = graphArticles[interventionDay];

              graphArticleLength = dailyArticles.length;
              _tabController =
                  TabController(vsync: this, length: graphArticleLength);
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight * 0.01),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          _tabController?.index = index;
                          _timer?.cancel();
                        },
                        itemCount: dailyArticles.length,
                        itemBuilder: ((context, index) => ListView(
                              shrinkWrap: true,
                              children: [
                                SizedBox(
                                    height: SizeConfig.screenHeight * 0.02),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: ClipRRect(
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxHeight:
                                                  SizeConfig.screenHeight *
                                                      0.50),
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.screenHeight *
                                                      0.01),
                                          // margin: const EdgeInsets.symmetric(
                                          //     horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: kDarkGreen),
                                          ),
                                          child: SizedBox(
                                            child: PhotoView(
                                              filterQuality: FilterQuality.high,
                                              scaleStateController:
                                                  _photoViewScaleStateController,
                                              tightMode: true,
                                              //height: SizeConfig.defaultSize! * 45,
                                              backgroundDecoration:
                                                  const BoxDecoration(
                                                      color: Colors.white),
                                              imageProvider: AssetImage(
                                                dailyArticles[index].graphAsset,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: dailyArticles[index]
                                          .copyrightInfo
                                          .isNotEmpty,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.screenWidth * 0.02,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              dailyArticles[index]
                                                  .copyrightInfo,
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenHeight *
                                                          0.016,
                                                  color: Colors.grey[600]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical:
                                            SizeConfig.screenHeight * 0.01,
                                        horizontal:
                                            SizeConfig.screenWidth * 0.02,
                                      ),
                                      child: NotificationListener<
                                          EnvironmentTimerSwitch>(
                                        onNotification: (notification) {
                                          _timer!.cancel();
                                          return true;
                                        },
                                        child: Column(
                                          children: [
                                            ExpandableText(
                                              dailyArticles[index].articleText,
                                              expandText: 'mehr anzeigen',
                                              collapseText: 'weniger anzeigen',
                                              maxLines: 3,
                                              linkStyle: const TextStyle(
                                                  color: kNeonGreen),
                                              onExpandedChanged: (isExpanded) {
                                                _timer!.cancel();
                                                userCollection
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                    .collection('userBehavior')
                                                    .doc('userBehavior')
                                                    .set({
                                                  'appinfo_${dailyArticles[index].id}':
                                                      true
                                                }, SetOptions(merge: true));
                                              },
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenHeight *
                                                          0.016),
                                            ),
                                            // ExText(
                                            //   hasText: dailyArticles[index]
                                            //       .articleText
                                            //       .text
                                            //       .isNotEmpty,
                                            //   text:
                                            //       dailyArticles[index].articleText,
                                            //   onPressed: userBehaviorReference.set({
                                            //     'appinfo_${dailyArticles[index].id}':
                                            //         true
                                            //   }, SetOptions(merge: true)),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: dailyArticles[index]
                                          .sourceUrls
                                          .isNotEmpty,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: getSourceUrls(
                                            dailyArticles[index].sourceUrls),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                    TabPageSelector(
                      controller: _tabController,
                      indicatorSize: 10,
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ],
    );
  }
}
