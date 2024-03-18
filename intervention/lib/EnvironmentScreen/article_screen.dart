import 'package:ecovia/EnvironmentScreen/infos.dart';
import 'package:ecovia/Screens/build_app_bars.dart';
import 'package:flutter/material.dart';
import 'get_source_urls.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key, required this.environmentInfo})
      : super(key: key);

  final EnvironmentInfo environmentInfo;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithBackButton(() => Navigator.pop(context)),
      body: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      widget.environmentInfo.articleTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 150.0,
                      margin: const EdgeInsets.all(10.0),
                      child: Image.asset(widget.environmentInfo.articleImgSrc),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.environmentInfo.articleDescription,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Quellen:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    getSourceUrls(widget.environmentInfo.sourceUrls),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

