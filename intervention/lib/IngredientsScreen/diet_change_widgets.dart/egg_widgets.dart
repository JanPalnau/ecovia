import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';

class EggWidgetOne extends StatelessWidget {
  const EggWidgetOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Egal in welchem Rezept du Ei ersetzen möchtest - Wenn du Geschmack und Farbe nachahmen möchtest, gibt zwei Zutaten, die dabei helfen: Kurkuma für die Farbe und Kala Namak für den Geschmack. Kala Namak ist ein Gewürzsalz, das neben der indischen und ayurvedischen Küche auch in der veganen Küche sehr beliebt ist, da es durch die enthaltenen Schwefelverbindungen einen rauchigen Ei-ähnlichen Geschmack liefert.'),
      ],
    );
  }
}

class EggWidgetTwo extends StatelessWidget {
  const EggWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Du isst zum Frühstück gerne Rührei? Wieso probierst du nicht mal eine umweltfreundliche Alternative? Neben Produkten wie "Veganes Ei", die einen fertigen Ersatz für Rührei und Omelette bieten, kann genauso herkömmlicher Tofu als proteinreicher Ersatz verwendet werden. Hierzu einfach einen Block Naturtofu zerkrümmeln, in die Pfanne geben und mit Kurkuma und Kala Namak würzen und ein paar Minuten bis zur gewünschten Konsistenz anbraten. Tipp: Wer es etwas saftiger mag sollte Seidentofu nehmen, da dieser mehr Wasser enthält als anderer Tofu.'),
        TextSpanWidget(text: 'Daneben findest du online auch Rezepte basierend auf Kichererbsenmehl, um Rührei oder Omelettes ohne Ei zu zaubern.'),
        TextSpanWidget(text: 'Probiere doch mal eine dieser Alternativen aus!')
      ],
    );
  }
}

class EggWidgetThree extends StatelessWidget {
  const EggWidgetThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Während auf das Rührei auch verzichtet werden kann, darf das Ei in vielen Gerichten und Backwaren als Bindemittel natürlich nicht fehlen. Oder gibt es auch hier Möglichkeiten das Ei zu ersetzen? Ja, gibt es! Zum Binden eignen sich ebenfalls bereits genannte Alternativen wie Kichererbsenmehl. Insbesondere für süße Speisen können ca. 50 g Apfelmus oder 1 pürierte/zerdrückte Banane (entspricht 1 Ei) als Ersatz dienen - bspw. in Kuchenrezepten.'),
        TextSpanWidget(text: 'Darüberhinaus können alle BäckerInnen da draußen in Rührteigen mit Seidentofu (60 g püriert pro Ei) als Alternative experimentieren. 2 EL Kichererbsen- oder Johannisbrotkernmehl kann angerührt in 4 EL Wasser genauso verwendet werden.'),
        TextSpanWidget(text: 'Für Experimentierfreudige gibt es noch unzählige andere Alternativen, wie bspw. Aquafaba (Kichererbsenwasser), welches aufgeschäumt als Eischnee-Ersatz dient. Anfangs ist es meist am einfachsten nach einem konkreten Rezept zu googlen, wie "veganer Käsekuchen" oder "Quiche ohne Ei". So hast du konkrete Handlungsanweisungen, die zu einem gelungenen Endergebnis führen!'),
        TextSpanWidget(text: 'Wie du siehst gibt es genügend umweltfreundliche Alternativen zum Ei, viel Spaß beim Ausprobieren!')
      ],
    );
  }
}