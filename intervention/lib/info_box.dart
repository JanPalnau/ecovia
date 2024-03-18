import 'package:ecovia/HomeScreen/home_infos.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/size_config.dart';
import 'constants.dart';

class HomeInfoBoxPageView extends StatefulWidget {
  const HomeInfoBoxPageView(
      {Key? key,
      required this.interventionDay,
      this.color,
      this.height,
      this.titleColor,
      this.descriptionColor,
      this.border,
      required this.infos,
      required this.tabController,
      required this.pageController,
      required this.onPageChanged})
      : super(key: key);

  final double? height;
  final Color? color, titleColor, descriptionColor;
  final dynamic border;
  final List<List<HomeInfo>> infos;
  final TabController? tabController;
  final PageController? pageController;
  final int interventionDay;
  final void Function(int?) onPageChanged;

  @override
  State<HomeInfoBoxPageView> createState() => _HomeInfoBoxPageViewState();
}

class _HomeInfoBoxPageViewState extends State<HomeInfoBoxPageView> {
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
        controller: widget.pageController,
        itemCount: 3,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            //height: SizeConfig.screenHeight * 0.2,
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.all(SizeConfig.defaultSize! * 1),
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.defaultSize! * 1,
                horizontal: SizeConfig.defaultSize! * 2),
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius:
                    BorderRadius.circular(SizeConfig.defaultSize! * 1.8),
                border: widget.border,
                boxShadow: const [standardBoxShadow]),
            child: InkWell(
              onTap: () async {
                HomeTimerSwitch(true).dispatch(context);
                // if(widget.infos[widget.interventionDay][index].sourceUrls.isNotEmpty) {
                //   if (await canLaunchUrl(widget.infos[widget.interventionDay][index].sourceUrls[0])) {
                //     await launchUrl(widget.infos[widget.interventionDay][index].sourceUrls[0]);
                //    } else {
                //       throw 'Maps konnte nicht geöffnet werden.';
                //   }
                // }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //SizedBox(
                      //height: SizeConfig.defaultSize * 2,
                      //),
                      widget.infos[widget.interventionDay][index].title
                              .isNotEmpty
                          ? Text(
                              widget.infos[widget.interventionDay][index].title,
                              style: TextStyle(
                                color: widget.titleColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 0.5,
                      ),
                      Container(
                        //color: Colors.red,
                        padding: const EdgeInsets.all(10),
                        //height: SizeConfig.defaultSize! * 18,
                        //height: SizeConfig.screenHeight * 0.15,
                        child: Text(
                          widget
                              .infos[widget.interventionDay][index].description,
                          // minFontSize: 8,
                          // maxFontSize: 30,
                          //softWrap: true,
                          //presetFontSizes: const [24, 22, 20, 18, 16],
                          style: TextStyle(
                            //wordSpacing: 2, 
                            fontSize: SizeConfig.defaultSize! * 1.8, 
                          color: widget.descriptionColor),
                          textAlign: TextAlign.start,
                        ),
                      )

                      //SizedBox(
                      //height: SizeConfig.defaultSize * 1,
                      //),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabPageSelector(
                        //selectedColor: Colors.white,
                        controller: widget.tabController,
                        indicatorSize: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class HomeTimerSwitch extends Notification {
  final bool val;
  HomeTimerSwitch(this.val);
}
