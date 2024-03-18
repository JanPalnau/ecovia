import 'package:ecovia/EnvironmentScreen/info_screen.dart';
import 'package:ecovia/EnvironmentScreen/quicktips_screen.dart';
import 'package:ecovia/Screens/state_container.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/showcase_labels_list.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showcaseview/showcaseview.dart';

class EnvironmentBody extends StatefulWidget {
  const EnvironmentBody({Key? key}) : super(key: key);

  @override
  State<EnvironmentBody> createState() => _EnvironmentBodyState();
}

class _EnvironmentBodyState extends State<EnvironmentBody> {
  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    GlobalKey environmentKeyOne = container.environmentKeyOne;
    GlobalKey environmentKeyTwo = container.environmentKeyTwo;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.defaultSize! * 0.5),
            Material(
              type: MaterialType.transparency,
              //color: Colors.transparent,
              color: kDarkGreen,
              child: TabBar(
                controller: container.environmentTabController,
                tabs: [
                  Showcase(
                    key: environmentKeyOne,
                    description: showCaseLabels[9],
                    targetBorderRadius: BorderRadius.circular(16),
                    targetPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    tooltipBorderRadius: BorderRadius.circular(16),
                    tooltipPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    // overlayPadding:
                    //     const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    // shapeBorder: const CircleBorder(),
                    child: const Tab(
                      icon: Icon(Icons.crop_square),
                      //text: "Quicktips".toUpperCase(),
                    ),
                  ),
                  Showcase(
                    key: environmentKeyTwo,
                    description: showCaseLabels[10],
                    targetBorderRadius: BorderRadius.circular(16),
                    targetPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    tooltipBorderRadius: BorderRadius.circular(16),
                    tooltipPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    // overlayPadding:
                    //     const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    // shapeBorder: const CircleBorder(),
                    child: Tab(
                      //text: "Infos".toUpperCase(),
                      icon: SvgPicture.asset('assets/fi-rr-apps.svg'),
                    ),
                  ),
                ],
                labelColor: Colors.black,
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2),
                    insets: EdgeInsets.symmetric(horizontal: 10)),
                unselectedLabelColor: Colors.black.withOpacity(0.3),
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: container.environmentTabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    QuicktipsScreen(),
                    InfoScreen(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
