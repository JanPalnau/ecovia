import 'package:flutter/material.dart';

List<BoxShadow> animatedGradientBoxShadow = const [
  BoxShadow(
    color: Color.fromARGB(182, 0, 0, 0),
    blurRadius: 15.0,
    spreadRadius: 0,
    offset: Offset(0, 4), // shadow direction: bottom right
  )
];

const BoxShadow standardBoxShadow = BoxShadow(
  color: Color.fromARGB(93, 0, 0, 0),
  blurRadius: 10.0,
  spreadRadius: 0.0,
  offset: Offset(0, 4), // shadow direction: bottom right
);
const kDarkGreen = Color.fromRGBO(48, 84, 70, 1);
const kLightGreen = Color.fromRGBO(143, 169, 44, 1);
const kNeonGreen = Color.fromARGB(255, 63, 173, 120);
const kLightYellow = Color.fromRGBO(233, 238, 213, 1);
LinearGradient flashyGradient = const LinearGradient(
  colors: [Color.fromARGB(255, 61, 105, 88), kDarkGreen, Color.fromARGB(255, 63, 173, 120)], stops: [0.001, 0.2, 09],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
LinearGradient flashyRedGradient = const LinearGradient(
  colors: [Color.fromARGB(255, 150, 20, 11), Color.fromARGB(255, 135, 19, 11), Color.fromARGB(255, 198, 55, 45)], stops: [0.001, 0.2, 09],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
LinearGradient greenLineChartGradient = LinearGradient(
  colors: [
    kDarkGreen.withOpacity(0.8),
    const Color.fromARGB(255, 63, 173, 120).withOpacity(0.4)
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);
LinearGradient yellowLineChartGradient = LinearGradient(
  colors: [Colors.orange.withOpacity(0.5), Colors.yellow.withOpacity(0.5)],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);
LinearGradient backgroundGradient() {
  dynamic color(double opacity) {
    Color color = const Color.fromARGB(255, 251, 255, 241).withOpacity(opacity);
    return color;
  }

  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      // Colors.white,
      // Colors.white,
      // Colors.white,
      // Colors.white,
      // Colors.white,
      // Colors.white,
      // Colors.white,
      // color(0.1),
      // color(0.2),
      // color(0.3),
      // color(0.4),
      // color(0.6),
      Colors.white,
      color(0.5),
      color(1),
    ],
  );
}

  List<AssetImage> backgroundImageList = [
    const AssetImage('assets/background/background_1.jpg'),
    const AssetImage('assets/background/background_2.jpg'),
    const AssetImage('assets/background/background_3.jpg'),
    const AssetImage('assets/background/background_4.jpg'),
    const AssetImage('assets/background/background_5.jpg'),
    const AssetImage('assets/background/background_6.jpg'),
    const AssetImage('assets/background/background_7.jpg'),
  ];
  List<AssetImage> paulaImageList = [
    const AssetImage('assets/paula_gifs/paula1.gif'),
    const AssetImage('assets/paula_gifs/paula2.gif'),
    const AssetImage('assets/paula_gifs/paula3.gif'),
    const AssetImage('assets/paula_gifs/paula4.gif')
  ];

  AssetImage ecoviaIconWithText = const AssetImage('assets/ecovia_images/ecovia_logo_with_text.png');
    AssetImage ecoviaIcon = const AssetImage('assets/ecovia_images/ecovia_logo.png');