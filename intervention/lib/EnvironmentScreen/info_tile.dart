import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecovia/EnvironmentScreen/graph_article.dart';
import 'package:ecovia/constants.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class InfoTile extends StatefulWidget {
  final dynamic pushTo, onPressed;
  final GraphArticle environmentInfo;

  const InfoTile(
      {Key? key,
      required this.environmentInfo,
      required this.pushTo,
      required this.onPressed})
      : super(key: key);

  //bool recipeSaved = false;

  @override
  State<InfoTile> createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.screenHeight * 0.02),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: widget.pushTo,
            ),
          );
          widget.onPressed;
        },
        child: Container(
          height: SizeConfig.screenHeight * 0.17,
          width: SizeConfig.defaultSize! * 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kNeonGreen,
            boxShadow: const [standardBoxShadow],
          ),
          child: Hero(
            transitionOnUserGestures: false,
            tag: widget.environmentInfo.id,
            child:

                //child: Hero(
                //transitionOnUserGestures: false,
                //tag: widget.dietchangeInfo.id,
                //child: Image(
                //height: SizeConfig.defaultSize * widget.height,
                //width: SizeConfig.defaultSize * widget.width,
                //fit: BoxFit.cover,
                //image: AssetImage(widget.dietchangeInfo.imgSrc),
                //),
                //),

                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: SizeConfig.defaultSize! * 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all(width: 1, color: kDarkGreen), color: Colors.white),
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(widget.environmentInfo.graphAsset),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.defaultSize! * 2,
                    ),
                    Expanded(
                      child: AutoSizeText(widget.environmentInfo.title,
                          style: const TextStyle(
                              //fontSize: 18, 
                              fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ],),
            ),
          ),
        ),
      ),
    );
  }
}
