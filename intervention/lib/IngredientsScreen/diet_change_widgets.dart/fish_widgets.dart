import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';

class FishWidgetOne extends StatelessWidget {
  const FishWidgetOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Wenn du Gerichten Fischgeschmack geben möchtest, wie es sonst bspw. Fischsoße tun würde, kannst du Nori-Flocken oder Nori-Blätter verwenden. Diese getrockneten Algenblätter werden typischerweise auch bei der Zubereitung von Sushi verwendet, finden aber auch in anderen Gerichten der japanischen Küche Anwendung. Neben dem Meergeschmack bringen sie auch ordentlich Umami auf den Teller - perfekt geeignet, um Suppen und Salate zu verfeinern! '),
      ],
    );
  }
}



class FishWidgetTwo extends StatelessWidget {
  const FishWidgetTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextSpanWidget(text: 'Auch der Markt für Fischersatz hält mittlerweile viele Alternativen bereit.'),
        const TextSpanWidget(text: 'So gibt es beispielsweise Ersatzprodukte für Thunfisch, der wie herkömmlicher Thunfisch aus der Dose in Rezepten verwendet werden kann. Diesen findest du in gut sortierten Supermärkten i.d.R. im Kühlregal für pflanzliche Ersatzprodukte neben den Fleischersatzprodukten, manchmal aber auch ungekühlt im Bio-Regal.'),
        const TextSpanWidget(text: 'Ebenso gibt es Alternativen für Lachs. Sowohl als Filet zum Anbraten als auch in roher Form als Topping für Nigiri Sushi. Diese sind allerdings selten in regulären Supermärkten zu finden. Demgegenüber findest du Räucherlachs-Alternativen mittlerweile in gut sortierten Supermäkrten i.d.R. im Kühlregal für vegetarische und vegane Produkte. Wenn du Interesse daran hast, google am besten nach deinem gesuchten Produkt mit dem Zusatz "vegan". So findest du auch passende Rezepte für bspw. Räucherlachs-Ersatz.'),
      ],
    );
  }
}

class FishWidgetThree extends StatelessWidget {
  const FishWidgetThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSpanWidget(text: 'Verschiedene Marken bieten außerdem Alternativen für Fischstäbchen und Backfisch an. Diese findest du im Supermarkt häufig im Kühlregal oder der Tiefkühlabteilung. Wenn dir der Fischgeschmack bei Fischstäbchen nicht unbedingt fehlt, könnten auch Gemüsestäbchen (bspw. von Iglo) etwas für dich sein.'),
          ],
        ),
      ],
    );
  }
}

class FishWidgetFour extends StatelessWidget {
  const FishWidgetFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Du bist Sushi-LiebhaberIn und das wird sich auch nie ändern? Kein Problem! Selbst im Supermarkt findest du mittlerweile vegetarisches und veganes Sushi. Zu diesem zählen u.A. die ohnehin rein pflanzlichen Avocado-, Gurken-, und Tofu-Maki. Gemüse-Maki und Nigiri kannst du ebenso in jedem Sushi-Restaurant bestellen. Allerdings gibt es mittlerweile auch California Rolls und "Lachs"-Nigiri rein pflanzlich. Suche doch mal nach einem veganen Sushi-Restaurant und probiere etwas Neues aus!')
      ],
    );
  }
}

class FishWidgetFive extends StatelessWidget {
  const FishWidgetFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextSpanWidget(text: 'Aber ich muss doch Fisch oder Fischöl essen, um die essenziellen Omega-3-Fettsäuren zu bekommen! Die gute Nachricht, falls der gesundheitliche Aspekt deine Hauptmotivation für den Fischkonsum ist: Nein musst du nicht! Die kurzkettigen Omega-3-Fettsäuren (ALA) bekommst du neben Lein- und Chiasamen, Walnüssen und Hanfsamen auch über eine vollwertige Ernährung ohne speziell ausgewählte Lebensmittel. Aus den kurzkettigen synthetisiert unser Körper dann die langkettigen (EPA und DHA), welche u.A. wichtig für die Hirnfunktion sind. Die Forschungsliteratur ist allerdings nicht eindeutig, ob nicht dennoch eine Supplementierung aufgrund der schwankenden Synthese-Raten sinnvoll ist. Das Gute: statt Fischöl einfach Algenöl, welches die langkettigen Omega-3-Fettsäuren schon enthält, einnehmen. Dieses bekommst du online, in Reformhäusern oder auch Apotheken.')
      ],
    );
  }
}
