import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';

class ButterWidgetOne extends StatelessWidget {
  const ButterWidgetOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Die einfachste Art Butter zu ersetzen ist mit... Genau, Margarine! Mittlerweile gibt es aber auch spezielle Sorten, die Konsistenz und Geschmack von Butter sehr stark ähneln. Im Kühlregal neben der Butter wirst du diesbezüglich fündig.'),
        TextSpanWidget(text: 'Allerdings kannst du auch Nussbutter oder -Mus als Ersatz ausprobieren. Insbesondere wenn du gerne Marmelade auf dem Brot isst, sorgt sie für die perfekte Harmonie auf dem Brot - ala Peanutbutter & Jelly Sandwich.'),
        TextSpanWidget(text: 'Vielleicht schmeckt dir das Brot aber auch ganz ohne Butter - das spart nicht nur CO₂-Emissionen, sondern auch Kalorien ein. Mit einem Aufstrich wie Hummus oder Marmelade bleibt das Brot auch ohne Butter saftig!')
      ]
    );
  }
}

class ButterWidgetTwo extends StatelessWidget {
  const ButterWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Um dem fertigen Gericht beim Kochen einen buttrigen Geschmack zu verleihen, kannst du ebenfalls Margarine und vergleichbare Butteralternativen aus dem Kühlregal verwenden. Dahingegen eignen sich zum Anbraten am besten Pflanzenöle, wie du sie wahrscheinlich ohnehin schon benutzt. Allerdings gibt es spezielle Öle mit Buttergeschmack, wenn die veganen Pancakes mal besonders buttrig schmecken sollen.'),
        TextSpanWidget(text: 'Margarine und Pflanzenöle eigenen sich genauso beim Backen als Ersatz für Butter im Teig. Hierbei sollte allerdings daraufgeachtet werden, ein neutrales Öl, wie bspw. Rapsöl, zu verwenden.'),
        TextSpanWidget(text: 'Wer es fettarm mag, kann auch mit Obstmus (Bsp.: Apfelmus) als Alternative experimentieren. Achte darauf ein Mus zu verwenden, das geschmacklich zu deinem Rezept passt. Probiere es beim nächsten Kuchenbacken doch mal mit einer dieser Ersatzmöglichkeiten aus! Genaue Rezepte für dein Wunschkuchen am besten vorab googlen (bspw. "Bienenstich Rezept vegan"), damit es auch auf Anhieb rein pflanzlich gelingt!'),
        TextSpanWidget(text: 'Um Inspiration zu finden hilft dir auch unser Rezept-Tab weiter.')
      ],
    );
  }
}