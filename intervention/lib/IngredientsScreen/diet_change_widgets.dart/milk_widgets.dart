import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';

class MilkWidgetOne extends StatelessWidget {
  const MilkWidgetOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextSpanWidget(text: 'Sicher sind dir Pflanzendrinks wie Soja- oder Hafermilch schon beim Einkauf begegnet. Mittlerweile gibt es ein vielfältiges Angebot an Milchersatzprodukten, welches für jeden Geschmack etwas bereithält.'),
        const TextSpanWidget(text: 'Zu den beliebtesten pflanzlichen Alternativen zählen Soja-, Hafer- und Mandeldrinks. Im Vergleich zu anderen Pflanzendrinks ist Sojamilch etwas dickflüssiger und erinnert damit von der Konsistenz her an herkömmliche Vollmilch. Deshalb eignet sie sich besonders gut fürs Aufschäumen. Zudem ist Sojamilch sehr eiweißreich.'),
        const TextSpanWidget(text: 'Tipp: Wer als UmsteigerIn besonders nah am Kuhmilchgeschmack bleiben möchte, sollte die "Not Milk" von Alpro ausprobieren.'),
        const TextSpanWidget(text: 'Mandelmilch ist dagegen dünnflüssiger, kalorienärmer und besitzt einen stärkeren Eigengeschmack - typisch für alle Nussdrinks. Eignen tun sich diese ebenfalls für Kaffee, Müsli und Co., können bei hohen Temperaturen aber auch flocken. Dem ein oder anderen mögen diese aber besonders als Glas Milch gefallen.'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSpanWidget(text: 'Die neutralste und verträglichste, aber auch wässrigste Alternative ist wohl die Reismilch. Demgegenüber ist der glutenhaltige Haferdrink süßer und kalorienhaltiger.'),
          ],
        ),
        const TextSpanWidget(text: 'Probiere am besten unterschiedliche Drinks aus, um die für dich passenden zu finden! Natürlich kannst du Pflanzenmilch auch selbst herstellen. Die einfachste Methode ist: Nussmus mit Wasser, einer Prise Salz sowie ggf. etwas Süßungsmittel (z.B. Datteln) im Mixer pürieren.'),
      ],
    );
  }
}

class MilkWidgetTwo extends StatelessWidget {
  const MilkWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Wer aufschäumbare Milchalternativen für ausgefallene Kaffeekreationen sucht, kann zu den cremigeren Barista-Versionen der entsprechenden Pflanzendrinks greifen. Hier hast du ebenfalls die selben Auswahlmöglichkeiten. Wenn du also schon eine Sorte an Pflanzendrinks gefunden hast, die dir besonders gut schmeckt, kannst du für den Kaffee einfach die Barista-Variante wählen - falls du es mal cremiger möchtest oder deine Milch für den Cappuccino und Co. aufschäumen willst!'),
      ],
    );
  }
}
