import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';

class YogurtWidgetOne extends StatelessWidget {
  const YogurtWidgetOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextSpanWidget(text: 'Analog zu den Pflanzendrinks gibt es auch Joghurtalternativen, die auf Basis unterschiedlicher Ausgangsprodukte hergestellt werden. Die beliebsten Varianten sind hierbei Soja-, Lupinen-, Kokos- und Haferjoghurt. Die Soja- und Lupinenprodukte ähneln durch ihre Nährwerte am meisten herkömmlichen Produkten aus Kuhmilch.'),
        const TextSpanWidget(text: 'Daneben werden mittlerweile auch pflanzliche Skyr-Varianten angeboten, die nochmal mehr Eiweiß enthalten. Das Kühlregal der meisten Supermärkte hält verschiedene Geschmacksrichtungen, von ungesüßt, über Vanille, bis hin zu fruchtig, bereit.'),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16),
                    children: [
                      TextSpan(
                          text:
                              '')
                    ]))),
      ],
    );
  }
}

class YogurtWidgetTwo extends StatelessWidget {
  const YogurtWidgetTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16),
                      children: [
                        TextSpan(
                            text:
                                'Auch wenn es nicht allzu viele spezielle Quarkalternativen gibt, werden diese vereinzelt beispielsweise von Simply V angeboten. Zur Zubereitung von Kräuterquark oder Tzatziki eignet sich allerdings auch herkömmlicher, ungesüßter Joghurt - oder Skyr für eine festere, cremigere Konsistenz. Verfeinert mit Kräutern oder Knoblauch, Salz und Pfeffer zauberst du den perfekten Dip!'),
                      ])),
            ),
          ],
        ),
      ],
    );
  }
}