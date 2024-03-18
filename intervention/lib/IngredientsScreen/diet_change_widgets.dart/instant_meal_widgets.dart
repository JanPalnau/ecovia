import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';

class InstantMealWidgetOne extends StatelessWidget {
  const InstantMealWidgetOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Manchmal muss es einfach eine Fertigpizza sein - egal ob aus dem Tiefkühlfach oder von deinem Lieblingslieferdienst. Das muss sich auch nicht ändern, nur weil du dich umweltfreundlicher ernähren willst.'),
        TextSpanWidget(text: 'Von Marken wie Dr. Oetker, Veganz und Eigenmarken beliebter Supermarktketten findest du vegetarische und vegane Pizzen im Tiefkühlregal. Diese sind in der veganen Variante mit pflanzlichem Käseersatz belegt. Auch bei bekannten Lieferdiensten gibt es mittlerweile häufig die Option entweder vegane Pizzasorten zu bestellen oder auch individuell eine Pizza mit veganem statt Kuhmilch-Käse zu bestellen. Daneben findest du über die Suchfunktion in der Lieferdienst-App auch ausgeschrieben vegetarische oder vegane Restaurants - einschließlich Pizzerias.'),
      ],
    );
  }
}

class InstantMealWidgetTwo extends StatelessWidget {
  const InstantMealWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Neben Tiefkühlpizza findest du viele pflanzliche Fertiggerichte, die du im Supermarkt in Eile mitnehmen kannst. Neben Salaten, Sushi-Boxen, Wraps und Sandwiches aus der Kühltheke, gibt es auch fertige Tiefkühlgerichte von Frosta und anderen Marken zu kaufen. Das "V"-Label hilft dir, die passendes Produkte zu finden. Daneben sind natürlich auch Pommes und Co. rein pflanzlich.'),
      ],
    );
  }
}

class InstantMealWidgetThree extends StatelessWidget {
  const InstantMealWidgetThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Neben Obst- und Gemüsekonserven, gibt es auch Ravioli mit Gemüsefüllung sowie vegetarische und vegane Eintöpfe, die sich gut mit Mikrowellen-Reis paaren lassen, wenn es mal schnell gehen muss.'),
        TextSpanWidget(text: 'Außerdem stellen Kidneybohnen, Kichererbsen und Linsen aus der Dose eine super Alternative zu tierischen Proteinquellen dar und eignen sich super, um einen schnellen Salat zu zaubern.'),
      ],
    );
  }
}