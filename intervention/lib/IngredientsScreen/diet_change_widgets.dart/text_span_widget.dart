import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSpanWidget extends StatelessWidget {
  const TextSpanWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: GoogleFonts.titilliumWeb().fontFamily,),
                children: [TextSpan(text: text)])));
  }
}
