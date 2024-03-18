import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/IngredientsScreen/diet_change_details.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/butter_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/cheese_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/cream_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/egg_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/fish_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/instant_meal_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/meat_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/milk_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/sweet_widgets.dart';
import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/yogurt_widgets.dart';
import 'package:ecovia/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../References/references.dart';
import '../size_config.dart';

class DietchangeScreen extends StatefulWidget {
  const DietchangeScreen({Key? key}) : super(key: key);

  @override
  State<DietchangeScreen> createState() => _DietchangeScreenState();
}

class _DietchangeScreenState extends State<DietchangeScreen> {
  @override
  Widget build(BuildContext context) {
    DocumentReference userBehaviorReference = userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userBehavior')
        .doc('userBehavior');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(gradient: backgroundGradient()),
          ),
          GridView.count(
            crossAxisCount: 2,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: [
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[0],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[0],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${0}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[1],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[1],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${1}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[2],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[2],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${2}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[3],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[3],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${3}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[4],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[4],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${4}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[5],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[5],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${5}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[6],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[6],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${6}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[7],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[7],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${7}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[8],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[8],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${8}': true}, SetOptions(merge: true))),
              DietChangeCard(
                  height: 15,
                  width: 40,
                  dietchangeInfo: dietChangeInfos[9],
                  pushTo: (context) => DietChangeInfoDetails(
                        dietchangeInfo: dietChangeInfos[9],
                      ),
                  onPressed: userBehaviorReference.set(
                      {'dietChangeInfo_${9}': true}, SetOptions(merge: true))),
            ],
            //GestureDetector(
            //  behavior: HitTestBehavior.translucent,
            //onTap: () => Navigator.push(
            //    context,
            //  MaterialPageRoute(
            //  builder: (context) =>
            //    InfoPanels(dietchangeInfo: itemList[index]),
            //),
            //),
            //child: InfoCard(
            //height: 15,
            //width: 40,
            //dietchangeInfo: dietChangeInfos[index],
            // )
            //);
          ),
        ],
      ),
    );
  }
}

class DietChangeInfo {
  List<String> subHeadings;
  List<Widget> subWidgets;
  String title, imgSrc, description, subTitle;
  int id;
  DietChangeInfo(
      {required this.title,
      required this.imgSrc,
      required this.id,
      required this.subHeadings,
      required this.subWidgets,
      required this.description,
      required this.subTitle});
}

List<DietChangeInfo> dietChangeInfos = [
  DietChangeInfo(
      id: 1,
      title: "Fleisch",
      description:
          'Das Sortiment eines jeden gut sortierten Supermarktes hält mittlerweile verschiedene Fleischersatzprodukte bereit. Diese sind besonders beim Umstieg auf eine pflanzlichere Ernährung geeignet, um den Fleischgeschmack nicht missen zu müssen und gleichzeitig CO₂-Emissionen einzusparen! So findest du Ersatz für Hack, Schnitzel, Burger und Co. Der pflanzliche Fleischersatz besteht meistens aus einer oder mehreren Proteinquellen, Trinkwasser, Öl, Gewürzen, Kräutern, Salz und Verdickungsmitteln, wie Johannisbrotkernmehl. Als Hauptproteinquelle dient meist Soja, Erben- oder Weizeneiweiß. Hier erfährst du wie sich verschiedene Arten von Fleischprodukten ersetzen kannst, sowohl mit fertigen Produkten, die den Fleischgeschmack nachahmen, als auch unverarbeiteten Alternativen wie Hülsenfrüchten.',
      subTitle: 'Kein Fleisch? Kein Problem, nur gewusst wie!',
      imgSrc: "assets/replacement_foods/meat.jpeg",
      subHeadings: [
        'Hack, Burger & Bratwurst',
        'Schnitzel, Filet & Geschnetzeltes',
        'Wurst & Speck'
      ],
      subWidgets: [
        const MeatWidgetOne(),
        const MeatWidgetTwo(),
        const MeatWidgetThree()
      ]),
  DietChangeInfo(
      id: 2,
      title: "Fisch",
      description:
          'Auch für FischliebhaberInnen gibt es genügend Möglichkeiten den Geschmack des Meeres auf pflanzliche Weise umweltfreundlicher zu genießen. Von Sushi, über Fischstäbchen, bis hin zu Räucherlachs: Egal ob du verzehrfertige Ersatzprodukte suchst oder bereit bist den Kochlöffel zu schwingen, nachfolgend werden dir mögliche Fischalternativen vorgestellt.',
      subTitle: 'Alternativen vorgestellt',
      imgSrc: "assets/replacement_foods/fish.jpeg",
      subHeadings: [
        'Fischgeschmack',
        'Thunfisch & Lachs',
        "Fischstäbchen und Co.",
        "Sushi",
        "Omega-3-Fettsäuren"
      ],
      subWidgets: [
        const FishWidgetOne(),
        const FishWidgetTwo(),
        const FishWidgetThree(),
        const FishWidgetFour(),
        const FishWidgetFive()
      ]),
  DietChangeInfo(
      id: 3,
      title: "Eier",
      description:
          'Morgens darf das Rührei bei dir nicht fehlen? Backen ist dein Hobby? Kein Problem, auch ohne Ei kannst du deine kulinarischen Wünsche erfüllen - nur gewusst wie!',
      subTitle:
          'Backe backe Kuchen, der Bäcker hat gerufen: Backen geht auch ohne Ei.',
      imgSrc: "assets/replacement_foods/egg.jpeg",
      subHeadings: [
        'Geschmack und Farbe',
        'Rührei',
        "Ei zum Binden"
      ],
      subWidgets: [
        const EggWidgetOne(),
        const EggWidgetTwo(),
        const EggWidgetThree(),
      ]),
  DietChangeInfo(
      id: 4,
      title: "Milch",
      description:
          'Die Auswahl an Pflanzendrinks, Alternativen zur herkömmlichen Kuhmilch, wird immer größer. Egal ob im Kaffee, Müsli oder beim Backen - Milch zu ersetzen ist einfacher denn je! Wir stellen dir die unterschiedlichen Sorten der Pflanzendrinks vor, damit du für dich die beste findest!',
      subTitle: 'Für jeden die passende Milchalternative!',
      imgSrc: "assets/replacement_foods/milk.jpeg",
      subHeadings: [
        'Milch',
        'Barista-Varianten'
      ],
      subWidgets: [
        const MilkWidgetOne(),
        const MilkWidgetTwo(),
      ]),
  DietChangeInfo(
      id: 5,
      title: "Käse",
      description:
          '"Ohne Käse - Ohne mich" So geht es vielen Menschen, die dem Käsegenuss verfallen sind. Mitverantwortlich dafür sind neben dem guten Geschmack auch die enthaltenen morphinähnlichen Casomorphine, die dann an Opioid-Rezeptoren im Gehirn binden. Wenn du Käse durch umweltfreundliche Alternativen ersetzen möchtest, musst du auf deinen Käserausch aber nicht verzichten. Welche rein pflanzlichen Ersatzmöglichkeiten es gibt zeigen wir dir nachfolgend (allesamt leider opiodfrei 😉)',
      subTitle: '',
      imgSrc: "assets/replacement_foods/cheese.jpeg",
      subHeadings: [
        'Scheiben- und Frischkäse',
        "Streukäse",
        "Feta, Mozzarella und Camembert"
      ],
      subWidgets: [
        const CheeseWidgetOne(),
        const CheeseWidgetTwo(),
        const CheeseWidgetThree()
      ]),
  DietChangeInfo(
      id: 6,
      title: "Joghurt & Quark",
      description:
          'Das Angebot an pflanzlichen Joghurtalternativen ist mittlerweile riesig! Gesüßt oder ungesüßt, mit oder ohne Früchten, von Hafer- bis Lupinenjoghurt.',
      subTitle: 'Alternativen für jeden Geschmack!',
      imgSrc: "assets/replacement_foods/yogurt.jpeg",
      subHeadings: ['Joghurt & Skyr', "Quark"],
      subWidgets: [const YogurtWidgetOne(), const YogurtWidgetTwo()]),
  DietChangeInfo(
      id: 7,
      title: "Butter",
      description:
          'Auf dem Brot darf die Butter bei vielen Menschen nicht fehlen. Leider ist sie als konzentriertes Milchprodukt alles andere als umweltfreundlich. Wir zeigen dir, wie du sie nicht nur auf Brot, sondern auch anderweitig in der Küche ersetzen kannst.',
      subTitle: 'Alles in Butter - auch mit pflanzlichen Alternativen!',
      imgSrc: "assets/replacement_foods/butter.jpeg",
      subHeadings: [
        'Butter auf Brot',
        'Butter beim Kochen/Backen'
      ],
      subWidgets: [
        const ButterWidgetOne(),
        const ButterWidgetTwo(),
      ]),
  DietChangeInfo(
      id: 8,
      title: "Sahne & Co.",
      description:
          'Egal ob in der Torte, zum Kochen oder Kuchen. Sahne darf als Geschmacksträger nicht fehlen. Wir zeigen dir umweltfreundliche, pflanzenbasierte Alternativen für Sahne, Schmand & Crème Fraîche.',
      subTitle: 'Whip it plantbased!',
      imgSrc: "assets/replacement_foods/cream.jpeg",
      subHeadings: ['Sahne, Schmand & Crème Fraîche'],
      subWidgets: [const CreamWidgetOne()]),
  DietChangeInfo(
      id: 9,
      title: "Süßigkeiten",
      description:
          'Auch wenn in den meisten Süßigkeiten tierische Produkte nur in geringeren Mengen enthalten sind, hat insbesondere der Ersatz von sahnehaltigem Kuchen und Eiscreme einen positiven Einfluss auf deinen CO₂-Fußabdruck. Lerne fertige Alternativen kennen, um umweltfreundlich zu naschen!',
      subTitle: 'Alles was die Naschkatze braucht',
      imgSrc: "assets/replacement_foods/sweets.jpeg",
      subHeadings: [
        'Schokolade',
        'Weingummi',
        'Kekse & Kuchen',
        'Eiscreme'
      ],
      subWidgets: [
        const SweetWidgetOne(),
        const SweetWidgetTwo(),
        const SweetWidgetThree(),
        const SweetWidgetFour()
      ]),
  DietChangeInfo(
      id: 10,
      title: "Fertigprodukte",
      description:
          'Wenn mal die Lust zu kochen fehlt, soll etwas fertiges auf den Esstisch. Beliebte Gerichte wie Tiefkühlpizza, -pasta und Co. sind nicht nur hochkalorisch, sondern auch reich an Fleisch, Käse und anderen tierischen Produkten. Wir zeigen dir, wie es auch pflanzlich und damit wesentlich umweltfreundlicher schnell gehen kann. ',
      subTitle: 'Wenn es mal schnell gehen soll',
      imgSrc: "assets/replacement_foods/pizza.jpeg",
      subHeadings: [
        'Pizza',
        "Tiefkühlgerichte",
        'Konserven (Ravioli & Co.)'
      ],
      subWidgets: [
        const InstantMealWidgetOne(),
        const InstantMealWidgetTwo(),
        const InstantMealWidgetThree()
      ]),
];

class DietChangeCard extends StatefulWidget {
  final dynamic pushTo, onPressed;
  final double height;
  final double width;
  final DietChangeInfo dietchangeInfo;

  const DietChangeCard({
    Key? key,
    required this.height,
    required this.width,
    required this.dietchangeInfo,
    required this.pushTo,
    required this.onPressed,
  }) : super(key: key);

  //bool recipeSaved = false;

  @override
  State<DietChangeCard> createState() => _DietChangeCardState();
}

class _DietChangeCardState extends State<DietChangeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
        child: Column(
          children: [
            Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: SizeConfig.defaultSize! * 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [standardBoxShadow],
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Hero(
                        transitionOnUserGestures: false,
                        tag: widget.dietchangeInfo.id,
                        child: Container(
                          height: SizeConfig.defaultSize! * 13,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(0.3),
                                      BlendMode.lighten),
                                  image: AssetImage(
                                    widget.dietchangeInfo.imgSrc,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        height: SizeConfig.defaultSize! * 5,
                        width: SizeConfig.defaultSize! * 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(1),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Center(
                            child: Text(
                          widget.dietchangeInfo.title,
                          style:
                              const TextStyle(color: kDarkGreen, fontSize: 16),
                        )),
                      ),
                    ],
                  ),
                ),
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
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Expanded(
              //           flex: 9,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               // Container(
              //               //   decoration: BoxDecoration(
              //               //     borderRadius: BorderRadius.circular(15),
              //               //     color: Colors.white.withOpacity(0.8),
              //               //   ),
              //               //   child: Padding(
              //               //     padding: const EdgeInsets.all(8.0),
              //               //     child: Text(widget.dietchangeInfo.title,
              //               //         style: TextStyle(
              //               //             fontSize: 18,
              //               //             fontWeight: FontWeight.bold)),
              //               //   ),
              //               // ),
              //               // SizedBox(
              //               //   height: 8,
              //               // ),
              //               // Container(
              //               //   decoration: BoxDecoration(
              //               //       borderRadius: BorderRadius.circular(15),
              //               //       color: Colors.white.withOpacity(0.8)),
              //               //   child: Padding(
              //               //     padding: const EdgeInsets.all(8.0),
              //               //     child: Text(
              //               //       widget.dietchangeInfo.description,
              //               //       style: TextStyle(fontSize: 17),
              //               //     ),
              //               //   ),
              //               // )
              //             ],
              //           ),
              //         ),
              //       ]),
              // ),
            ]),
          ],
        ),
      ),
    );
  }
}
