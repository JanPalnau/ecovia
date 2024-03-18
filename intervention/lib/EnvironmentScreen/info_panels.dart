import 'package:ecovia/EnvironmentScreen/diet_info_lists.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPanels extends StatefulWidget {
  const InfoPanels({Key? key, this.dietchangeInfo}) : super(key: key);
  final List<Item>? dietchangeInfo;
  @override
  State<InfoPanels> createState() => _InfoPanelsState();
}

class _InfoPanelsState extends State<InfoPanels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kLightYellow,
                  kLightGreen,
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionPanelList.radio(
                  animationDuration: const Duration(milliseconds: 200),
                  dividerColor: kDarkGreen,
                  elevation: 1,
                  children: widget.dietchangeInfo!
                      .map((item) => ExpansionPanelRadio(
                          backgroundColor: Colors.white.withOpacity(1),
                          canTapOnHeader: true,
                          value: item.header,
                          headerBuilder: (context, isExpanded) => ListTile(
                                  title: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.header,
                                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                          ),
                          body: ListTile(
                              title: Text(
                            item.description,
                            style: const TextStyle(fontSize: 22),
                          ))))
                      .toList(),
                ),
              ),
            ],
          )),
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
        ],
      ),
    );
  }

 

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1.5,
      toolbarHeight: SizeConfig.defaultSize! * 10,
      leading: IconButton(
          icon: Icon(
                CupertinoIcons.back,
                color: kDarkGreen,
                size: SizeConfig.defaultSize! * 4,
              ),
          onPressed: () => Navigator.pop(context)),
      centerTitle: true,
      title: Text(
        "PLANTY",
        style: GoogleFonts.oswald(
          textStyle:
              const TextStyle(fontSize: 50, color: Color.fromRGBO(48, 84, 70, 1)),
        ),
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset(
              "assets/fi-rr-search.svg",
            ),
            onPressed: () {}),
        SizedBox(
          width: SizeConfig.defaultSize! * 0.5,
        ),
      ],
    );
  }
}