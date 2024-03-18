import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget getSourceUrls(List<Uri> sourceUrls) {
  if(sourceUrls.isNotEmpty){
    
  }
  List<Widget> list = [];
  for (var i = 0; i < sourceUrls.length; i++) {
    list.add(GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        if (await canLaunchUrl(sourceUrls[i])) {
          await launchUrl(sourceUrls[i]);
        } else {
          throw 'Konnte Link nicht öffen ($sourceUrls[i].toString)';
        }
      },
      child: Row(
        
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: RichText(
              text: TextSpan(children: [
                WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(2, -4),
                    child: Text(
                      '${i + 1}',
                      //superscript is usually smaller in size
                      textScaleFactor: 0.7,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Flexible(
            child: Text(
              sourceUrls[i].toString(),
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    ));
  }
  return Column(children: list);
}
