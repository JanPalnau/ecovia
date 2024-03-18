import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';


class CheeseWidgetOne extends StatelessWidget {
  const CheeseWidgetOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextSpanWidget(text: 'Die meisten veganen Käsesorten werden aus einer Basis von Nüssen und Öl hergestellt. Allerdings gibt es auch gereifte Käsesorten, die auf Cashewkernen oder Mandeln basieren. Für den Reifeprozess wird auf (vegane) Milchsäurebakterien und Käsekulturen zurückgegriffen, genau wie bei der „herkömmlichen“ Käseherstellung.'),
        const TextSpanWidget(text: 'Damit ergeben sich Alternativen für viele herkömmliche Käsesorten, von Scheiben- bis Streichkäse. Diese sind in unterschiedlichen Geschmacksrichtungen in allen gut sortierten Supermärkten mittlerweile zu finden.'),
        const TextSpanWidget(text: 'Im Kühlregal für vegetarische und vegane Ersatzprodukte findest du Ersatz für Scheibenkäse, welcher durch den milden Geschmack an Butterkäse oder jungen Gouda erinnert. Allerdings gibt es auch "Cheddar"-, "Ziegenkäse" oder Kräuterscheiben.'),
        const TextSpanWidget(text: 'Auch pflanzlichen Frischkäse findest du im selben Kühlregal. Dieser ist i.d.R. in den gängigen Sorten des Originals erhältlich. Daneben lohnt es sich auch Hummus und vegetarische Aufstriche als Alternative auszuprobieren.'),
      ],
    );
  }
}


class CheeseWidgetTwo extends StatelessWidget {
  const CheeseWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        TextSpanWidget(text: 'Auch wenn du pflanzliche Käsealternativen selbst reiben kannst, gibt es auch schon fertigen Reibegenuss als Ersatz. Dieser schmilzt i.d.R. besser und ist damit gut für Pizza, Lasagne und Co. geeignet.'),
        TextSpanWidget(text: 'Wer Parmesan ersetzen möchte, kann auf Pastagenuss von Simply V oder vergleichbare Produkte zurückgreifen. Als unverarbeitete, kalorienarme Alternative sind auch Hefeflocken sehr empfehlenswert, da sie Gerichten nicht nur viel Umami Geschmack verleihen, sondern auch reich an B-Vitaminen sind! Diese sind in gut sortierten Supermärkten, Drogerien oder Bioläden zu bekommen.'),
      ],
    );
  }
}

class CheeseWidgetThree extends StatelessWidget {
  const CheeseWidgetThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextSpanWidget(text: 'Du suchst Ersatz für bestimmte Käsesorten? Glücklicherweise gibt es im Supermarkt passende Alternativen zu Feta, Mozzarella und Camembert.'),
        const TextSpanWidget(text: 'Ersatzprodukte für Feta gibt es mittlerweile von vielen Marken, die sich nicht nur für Salate eignen, sondern auch für berühmte One-Pot Pasta verwenden lassen.'),
        const TextSpanWidget(text: 'Bezüglich Camembert ist die Palette an Alternativen im regulären noch gering, allerdings ist der "Come on Bert" von Bedda weitläufig erhältlich, der mit seiner cremigen Konsistenz nah an das Original rankommt. Teurere Produkte, die online oder im Bioladen zu finden sind, punkten zusätzlich mit ihrer klassischen Käsereifung. Damit bekommen sie nicht nur einen käsigeren Geschmack, sondern bestehen auch nur aus i.d.R. Cashewkernen oder Mandeln.'),
        const TextSpanWidget(text: 'Gleiches gilt für Mozzarella: vereinzelte Produkte sind in Supermärkten erhältlich, ein Ersatz kann aber auch relativ einfach mit Cashewkernen und Flohsamenschalen zuhause gezaubert werden.'),
        const TextSpanWidget(text: 'Fündig wirst du bei der Suche nach Ersatz für spezielle Käsesorten am besten online - sogar Alternativen zu Blauschimmelkäse gibt es! Dort findest du auch passende Rezepte, um mit Käsekulturen deinen eigenen Cashewkäse zuhause zu machen!'),
      ],
    );
  }
}