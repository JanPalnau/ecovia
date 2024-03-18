import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:ecovia/showcase_labels_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showcaseview/showcaseview.dart';
import '../constants.dart';
import '../size_config.dart';

buildAppBar(int ecoPoints, GlobalKey key) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: Colors.white, 
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    //elevation: 5,

    leading: Builder(
      builder: (BuildContext context) => IconButton(
          icon: SvgPicture.asset(
            "assets/fi-rr-menu-burger.svg",
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          }),
    ),
    actions: [
      Tooltip(
        showDuration: const Duration(seconds: 2),
        decoration: BoxDecoration(color: kDarkGreen, borderRadius: BorderRadius.circular(12), boxShadow: const [standardBoxShadow]),
        textStyle: const TextStyle(color: Colors.white),
        triggerMode: TooltipTriggerMode.tap,
        message: 'Du hast aktuell $ecoPoints EcoPoints',
        child: Showcase(
          key: key,
          description: showCaseLabels[20],
          child: RowSuper(
            innerDistance: -50,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: kNeonGreen,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18))),
                width: SizeConfig.defaultSize! * 6.5,
                height: SizeConfig.defaultSize! * 3.2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ecoPoints.toString(),
                        style: TextStyle(color: Colors.yellow[300]),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: SizeConfig.defaultSize! * 4.5,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.yellow[600],
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.yellow[700]!)),
                child: SvgPicture.asset(
                  'assets/clover-icon.svg',
                ),
              ),
        
              // ElevatedButton(
              //   onPressed: () {},
              //   child: SvgPicture.asset(
              //     'assets/clover-icon.svg',
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.all(4),
              //     elevation: 5,
              //     primary: Colors.yellow,
              //     side: BorderSide(color: Colors.yellow[700]!, width: 2),
              //     fixedSize: const Size(35, 35),
              //     shape: const CircleBorder(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // Visibility(
      //   visible: isVisible,
      //     child: InkWell(
      //       onTap: onTap,
      //         child: Container(
      //           padding: EdgeInsets.all(12),
      //   decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      //   child: Icon(Icons.star_border, color: kDarkGreen, size: 40,),
      // )))
    ],
    centerTitle: true,
    title: Container(
      height: SizeConfig.defaultSize! * 10,
      width: SizeConfig.defaultSize! * 15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ecoviaIconWithText,
        ),
      ),
    ),
    // title: Padding(
    //   padding: const EdgeInsets.only(bottom: 15),
    //   child: Text(
    //     "PLANTY",
    //     style: GoogleFonts.oswald(
    //       textStyle:
    //           TextStyle(fontSize: 50, color: Color.fromRGBO(48, 84, 70, 1)),
    //     ),
    //   ),
    // ),
  );
}

buildPreQuestionnaireAppBar() {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: Colors.white, 
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
    backgroundColor: Colors.transparent,
    //backgroundColor: Colors.lightGreen[50],
    //shadowColor: Colors.black38,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    //elevation: 5,

    centerTitle: true,
    title: Container(
      height: SizeConfig.defaultSize! * 10,
      width: SizeConfig.defaultSize! * 15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ecoviaIconWithText,
        ),
      ),
    ),
    // title: Padding(
    //   padding: const EdgeInsets.only(bottom: 15),
    //   child: Text(
    //     "PLANTY",
    //     style: GoogleFonts.oswald(
    //       textStyle:
    //           TextStyle(fontSize: 50, color: Color.fromRGBO(48, 84, 70, 1)),
    //     ),
    //   ),
    // ),
  );
}

AppBar buildAppBarWithBackButton(onPressed) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: Colors.white, 
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    //elevation: 5,
    leading: IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: kDarkGreen,
          size: SizeConfig.defaultSize! * 4,
        ),
        onPressed: onPressed),
    centerTitle: true,
    title: Container(
      height: SizeConfig.defaultSize! * 10,
      width: SizeConfig.defaultSize! * 15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ecoviaIconWithText,
        ),
      ),
    ),
  );
}

AppBar buildSimpleAppBar() {
  return AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            centerTitle: true,
            title: Container(
              height: SizeConfig.defaultSize! * 10,
              width: SizeConfig.defaultSize! * 15,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ecoviaIconWithText,
                ),
              ),
            ),
          );
}
