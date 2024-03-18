import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import '../size_config.dart';

buildAppBar() {
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

    // Visibility(
    //   visible: isVisible,
    //     child: InkWell(
    //       onTap: onTap,
    //         child: Container(
    //           padding: EdgeInsets.all(12),
    //   decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    //   child: Icon(Icons.star_border, color: kDarkGreen, size: 40,),
    // )))

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
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
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
