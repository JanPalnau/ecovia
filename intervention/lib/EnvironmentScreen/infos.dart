import 'package:flutter/material.dart';

class EnvironmentInfo {
  String title, imgSrc, articleImgSrc;
  int id;
  String description;
  String articleTitle;
  Widget articleDescription;
  List<Uri> sourceUrls;
  EnvironmentInfo(
      {required this.title,
      required this.description,
      required this.imgSrc,
      required this.id,
      required this.articleTitle,
      required this.articleDescription,
      required this.articleImgSrc,
      required this.sourceUrls,
      });
}

List<EnvironmentInfo> environmentInfos = [
  EnvironmentInfo(
      title: "This is an example title",
      description: "This is an example description",
      imgSrc: "assets/pizza_bianca.jpeg",
      id: 0,
      articleTitle: "This is an example title",
      articleDescription: const Text("This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description."),
      articleImgSrc: "assets/pizza_bianca.jpeg",
      sourceUrls: [Uri(scheme: 'https', host: 'google.com', path: ''), Uri(scheme: 'https', host: 'yahoo.com', path: ''),]
  ),
  EnvironmentInfo(
      title: "This is an example title",
      description: "This is an example description",
      imgSrc: "assets/pizza_bianca.jpeg",
      id: 1,
      articleTitle: "This is an example title",
      articleDescription: const Text("This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description. This is an example description."),
      articleImgSrc: "assets/pizza_bianca.jpeg",
      sourceUrls: [Uri(scheme: 'https', host: 'google.com', path: ''), Uri(scheme: 'https', host: 'yahoo.com', path: ''),]
  )
];
