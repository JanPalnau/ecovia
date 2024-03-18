import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';

class SweetWidgetOne extends StatelessWidget {
  const SweetWidgetOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      TextSpanWidget(text: 'Wer auf in Schokolade enthaltenes Milchpulver, Buttereinfett und Co. verzichten möchte, kann ganz einfach auf Zartbitterschokolade zurückgreifen. Die Zutatenliste solltest du sicherheitshalber immer noch überprüfen, allerdings enthalten die meisten Zartbitterschokoladen keine tierische Produkte. Auch zu speziellen veganen Alternativen kannst du greifen, die häufig mit Reis- stat Kuhmilch versehen sind, um den Geschmack der Milchschokolade nachzuempfinden. Diese findest du in gut sortierten Supermärkten mittlerweile neben der herkömmlichen Schokolade bspw. von der Marke Rittersport - gekennzeichnet mit dem "vegan" Label.')
    ],);
  }
}

class SweetWidgetTwo extends StatelessWidget {
  const SweetWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Gelantine ist ein tierisches Produkt, was in vielen Weingummisorten enhalten ist. Glücklicherweise gibt es mittlerweile ein großes Angebot an gelatinefreien Produkten. Bekannte Marken wie Haribo, Trolli und Katjes passen die Rezeptur ihrer Produkte mehr und mehr an, sodass viele mittlerweile rein pflanzlich sind.'),
        TextSpanWidget(text: 'Wenn du das nächste mal voller Heißhunger am Weingummi-Regal stehst, guck doch mal nach den Produkten mit dem "V (vegan)" Label und genieße die pflanzlichen Naschereien!'),
      ],
    );
  }
}

class SweetWidgetThree extends StatelessWidget {
  const SweetWidgetThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Wusstest du schon, dass Oreo-Kekse vegan sind? Daneben gibt es Haferkekse, Lotus Biscoff Karamellgebäck, Gewürzspekulatius und weitere Sorten, die alle im regulären Supermarkt erhältlich sind und rein pflanzlich sind! Hier lohnt sich auch immer mal der Blick auf die Zutatenliste, ob Milchpulver, Butter und Co. enthalten sind, da nicht auch Oreos nicht als vegan labelt sind, es aber sind! Viel Spaß beim Ausprobieren!'),
        TextSpanWidget(text: 'Was Kuchen und Torten angeht, ist das Angebot im Supermarkt für vegane Alternativen auf einzelne Produkte beschränkt. Hervorzuheben sind die veganen Strudel- und Kuchensorten der Marke Coppenrath & Wiese. Allerdings gibt es auch bei einigen Bäckereiketten rein pflanzliche Kuchensorten. Genauso findest du Konditoreien und Donut-Shops, die eine rein pflanzliche Produktreihe haben. In beiden Fällen hilft dir eine Google-Suche weiter, um passende Angebote in deiner Nähe zu finden!'),
      ],
    );
  }
}

class SweetWidgetFour extends StatelessWidget {
  const SweetWidgetFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Normalerweise enthält Eiskreme Kuhmilchprodukte wie Sahne, allerdings ist das Sortiment an pflanzlichen Ersatzprodukten hierfür mittlerweile riesig! Magnum, Ben & Jerries sowie Eigenmarken beliebter Supermärkten bieten alle Eissorten an, die statt Kuh- auf Pflanzenmilch als Alternative enthalten. Diese sind mit dem "V"-Label gekennzeichnet. Daneben beseht Eis am Stiel, wie Capri und Co., häufig ohnehin nur aus Fruchtsaft und Zucker.'),
        TextSpanWidget(text: 'Vielleicht bietet auch dein Lieblingseisladen schon pflanzliche Alternativen an - ansonsten kannst du auch einfach Sorbet bestellen. Oder du suchst nach einer veganen Eisdiele, wenn du mal etwas Neues ausprobieren willst.'),
      ],
    );
  }
}