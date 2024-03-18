import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeatWidgetThree extends StatelessWidget {
  const MeatWidgetThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                        color: Colors.black, fontSize: 16),
                    children: const [
                      TextSpan(
                          text:
                              'Im Supermarkt findet man verschiedene Sorten pflanzlicher Streich- und Scheibenwurst. Einige sind näher am Original andere weniger. Auch hier muss man sich einfach mal durchprobieren. Neben den Imitationen von Wurst eignen sich für dich vielleicht auch pflanzliche Gemüse-Aufstriche oder Hummus als Ersatz.', style: TextStyle(fontSize: 16))
                    ]))),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: GoogleFonts.titilliumWeb().fontFamily),
                      children: const [
                        TextSpan(
                            text:
                                'Die Auswahl reicht von Alternativen für Salami und Schinken bis hin zu solchen für Tee- als auch Leberwurst. '),
                      ])),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                        color: Colors.black, fontSize: 16),
                    children: const [
                      TextSpan(
                          text:
                              'Selbst Speck bzw. Bacon kann ersetzt werden. Selbes gilt für Mett oder Hackepeter, welches mit einem super simplen Rezept nachempfunden werden kann oder auch fertig gekauft werden kann. Schau dafür gerne mal in unsere Rezepte oder google nach erhältlichen Fertigprodukten!')
                    ]))),
      ],
    );
  }
}

class MeatWidgetTwo extends StatelessWidget {
  const MeatWidgetTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                        color: Colors.black, fontSize: 16),
                    children: const [
                      TextSpan(
                          text:
                              'Auch jegliche Art von “Bratstück” lässt sich pflanzlich ziemlich gut ersetzen, wobei das Rinder-Steak sicherlich noch am schwierigsten zu imitieren ist. Aber ein “klassisches” Schnitzel kannst du sehr gut durch Produkte aus dem Supermarkt oder ein Selbstgemachtes austauschen.')
                    ]))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  style: TextStyle(
                    fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                      color: Colors.black, fontSize: 16),
                  children: const [
                    TextSpan(
                        text:
                            'Hierbei sind die meisten Alternativen aus Soja, Seitan oder einer Mischung aus beidem. In den meisten Supermärken und Discountern findet man im Kühlregal - direkt neben den Hackalternativen - diverse Produkte. Die Optionen reichen hier von Ersatz für Hähnchen-Geschnetzeltes von bspw. Like Meat bis hin zu pflanzlichem Cordon bleu von der Rügenwalder Mühle.'),
                  ])),
        ),
        
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                        color: Colors.black, fontSize: 16),
                    children: const [
                      TextSpan(
                          text:
                              'Günstiger wird es, wenn man das Ganze selbst zubereitet. Das geht sowohl mit Soja als auch mit Seitan. Stöber dafür gerne mal durch die Rezepte. Dort findest du auch weitere Tipps zur Zubereitung von Seitan. ')
                    ]))),
      ],
    );
  }
}

class MeatWidgetOne extends StatelessWidget {
  const MeatWidgetOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                        color: Colors.black, fontSize: 16),
                    children: const [
                      TextSpan(
                          text:
                              'Hackfleisch kann beim Kochen ziemlich gut pflanzlich ersetzt werden. Je nachdem, was man genau daraus machen möchte, ist die eine oder die andere Alternative besser geeignet.')
                    ]))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  style: TextStyle(
                    fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                      color: Colors.black, fontSize: 16),
                  children: const [
                    TextSpan(
                        text:
                            'Zu kaufen gibt es pflanzliches Hack, welches optisch und geschmacklich nah ans Original kommt von vielen verschiedenen Marken. In jedem gut sortierten Supermarkt solltest du fündig werden. Mittlerweile bieten selbst die Eigenmarken der meisten Discounter pflanzliche Hackalternativen an. Diese Produkte sind meistens aus pflanzlichem Protein, sehr häufig aus Erbsenprotein, und werden wie normales Hackfleisch zubereitet. Viele Marken verkaufen außerdem bereits vorgeformte Patties. Das heißt, wenn du Burger machen möchtest, kannst du statt pflanzlichem Hack auch direkt Patties kaufen. Neben diesen findest du im Kühlregal auch unterschiedliche Alternativen für Bratwurst.'),
                  ])),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      style: TextStyle(
                        fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                          color: Colors.black,
                          fontSize: 16),
                      children: const [
                        TextSpan(
                            text:
                                'Die in vielen Alternativprodukten enthaltene rote Beete sorgt beim Anbraten für das fleischtypische "bluten".'),
                      ])),
            ),
            
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                        color: Colors.black, fontSize: 16),
                    children: const [
                      TextSpan(
                          text:
                              'Probiere am besten einfach unterschiedliche Marken aus. Ein besonders besonders fleischnahes Erlebnis bieten die Produkte der Marke "Beyond Meat".')
                    ]))),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                        color: Colors.black, fontSize: 16),
                    children: const [
                      TextSpan(
                          text:
                              'Möchtest du beispielsweise eine Bolognesesoße oder ein Chili sin carne zubereiten, kannst du die oben genannten Produkte verwenden oder auf Hack/Granulat aus Soja oder Seitan (oder einer Mischung) zurückgreifen, z. B. Tofu Hack. Vorteile davon sind, dass sie in der Regel günstiger und länger haltbar sind, insbesondere wenn du Sojagranulat verwendest, kannst du einen guten Deal machen, da es als Trockenprodukt lange haltbar ist und in großer Menge gekauft werden kann.')
                    ]))),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                        color: Colors.black, fontSize: 16),
                    children: const [
                      TextSpan(
                          text:
                              'Für all diejenigen, die gar keine "fleischige" Alternative suchen eignen sich auch Linsen super als Hackersatz für die Zubereitung einer Bolognese. Genauso kann auch (Räucher)-Tofu zerkrümmelt und in der Pfanne angebraten werden und dann in Tacos oder Soßen als Hackersatz dienen.')
                    ]))),
      ],
    );
  }
}

