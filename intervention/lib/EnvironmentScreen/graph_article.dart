import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class GraphArticle {
  final int id;
  final List<int> categories;
  final String graphAsset, title, copyrightInfo;
  final String articleText;
  final List<Uri> sourceUrls;

  const GraphArticle(this.id, this.graphAsset, this.title, this.articleText,
      this.sourceUrls, this.categories, this.copyrightInfo);
}

Map<String, StyledTextTag> tags = {
  'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold))
};

List<List<GraphArticle>> graphArticles = [
  [allGraphArticles[0], allGraphArticles[1]],
  [allGraphArticles[2], allGraphArticles[3]],
  [allGraphArticles[4], allGraphArticles[5]],
  [allGraphArticles[6], allGraphArticles[7]],
  [allGraphArticles[8], allGraphArticles[9]],
  [allGraphArticles[10], allGraphArticles[11]],
  [allGraphArticles[12], allGraphArticles[13]],
  [allGraphArticles[14], allGraphArticles[15]],
  [allGraphArticles[16], allGraphArticles[17]],
  [allGraphArticles[18], allGraphArticles[19]],
  [allGraphArticles[20], allGraphArticles[21]],
  [allGraphArticles[22], allGraphArticles[23]],
  [allGraphArticles[24], allGraphArticles[25]],
  [allGraphArticles[26], allGraphArticles[27]],
  [allGraphArticles[28], allGraphArticles[29]],
  [allGraphArticles[30], allGraphArticles[31]],
  [allGraphArticles[32], allGraphArticles[33]],
  [allGraphArticles[34], allGraphArticles[35]],
  [allGraphArticles[36], allGraphArticles[37]],
  [allGraphArticles[38], allGraphArticles[39]],
  [allGraphArticles[40]],
  [allGraphArticles[41]],
  [allGraphArticles[42]],
  [allGraphArticles[43]],
  [allGraphArticles[44]],
  [allGraphArticles[45]],
  [allGraphArticles[46]],
  [allGraphArticles[47]],
  [allGraphArticles[48]],
  [allGraphArticles[49]],
];
List<GraphArticle> allGraphArticles = [
  GraphArticle(
      0,
      'assets/high_res_appgraphs/app_graph1.png',
      'CO₂-Fußabdruck verschiedener Ernährungsformen',
      graphArticleDescriptions[0],
      graphArticleSourceUrls[0],
      [1], ''),
  GraphArticle(
      1,
      'assets/high_res_appgraphs/app_graph2.png',
      'Milchkonsum der Deutschen in den letzen Jahrzehnten',
      graphArticleDescriptions[1],
      graphArticleSourceUrls[1],
      [1], ''),
  GraphArticle(
      2,
      'assets/high_res_appgraphs/app_graph3.png',
      'Anteil von vegetarisch lebenden Menschen verdoppelt!',
      graphArticleDescriptions[2],
      graphArticleSourceUrls[2],
      [1], ''),
  GraphArticle(
      3,
      'assets/high_res_appgraphs/app_graph4.png',
      'Deutschland führt mit veganen Neueinführungen!',
      graphArticleDescriptions[3],
      graphArticleSourceUrls[3],
      [1], ''),
  GraphArticle(
      4,
      'assets/high_res_appgraphs/app_graph5.png',
      'Positive Effekte von Fleischverzicht auf Cholesterin-Werte',
      graphArticleDescriptions[4],
      graphArticleSourceUrls[4],
      [2], ''),
  GraphArticle(
      5,
      'assets/high_res_appgraphs/app_graph6.png',
      'Krankheitsbedingte Mortalitätsrate verschiedener Ernährungsformen',
      graphArticleDescriptions[5],
      graphArticleSourceUrls[5],
      [2], ''),
  GraphArticle(
      6,
      'assets/high_res_appgraphs/app_graph7.png',
      'Mehr Anmeldungen für den Veganuary denn je!',
      graphArticleDescriptions[6],
      graphArticleSourceUrls[6],
      [1], ''),
  GraphArticle(
      7,
      'assets/high_res_appgraphs/app_graph8.png',
      'Durch Lebensmittel verursachte CO₂-Emissionen',
      graphArticleDescriptions[7],
      graphArticleSourceUrls[7],
      [1], ''),
  GraphArticle(
      8,
      'assets/high_res_appgraphs/app_graph9.png',
      'Anteile von Lebensmitteln an verursachten CO₂-Emissionen',
      graphArticleDescriptions[8],
      graphArticleSourceUrls[8],
      [1], ''),
  GraphArticle(
      9,
      'assets/high_res_appgraphs/app_graph10.png',
      'Ist Fleischersatz umweltfreundlicher? Ja. (Teil 1)',
      graphArticleDescriptions[9],
      graphArticleSourceUrls[9],
      [1], ''),
  GraphArticle(
      10,
      'assets/high_res_appgraphs/app_graph11.png',
      'Ist Fleischersatz umweltfreundlicher? Ja. (Teil 2)',
      graphArticleDescriptions[10],
      graphArticleSourceUrls[10],
      [1], ''),
  GraphArticle(
      11,
      'assets/high_res_appgraphs/app_graph12.png',
      'Ist Fleischersatz umweltfreundlicher? Ja. (Teil 3)',
      graphArticleDescriptions[11],
      graphArticleSourceUrls[11],
      [1], ''),
  GraphArticle(
      12,
      'assets/high_res_appgraphs/app_graph13.png',
      'Pflanzenmilch ist umweltfreundlicher als Kuhmilch!',
      graphArticleDescriptions[12],
      graphArticleSourceUrls[12],
      [1], ''),
  GraphArticle(
      13,
      'assets/high_res_appgraphs/app_graph14.png',
      'Steigende Popularität von Pflanzenmilch',
      graphArticleDescriptions[13],
      graphArticleSourceUrls[13],
      [1], ''),
  GraphArticle(
      14,
      'assets/high_res_appgraphs/app_graph15.png',
      'Fleischersatzprodukte sind beliebter denn je!',
      graphArticleDescriptions[14],
      graphArticleSourceUrls[14],
      [1], ''),
  GraphArticle(15, 'assets/high_res_appgraphs/app_graph16.png', 'Pflanzendrinks boomen!',
      graphArticleDescriptions[15], graphArticleSourceUrls[15], [1], ''),
  GraphArticle(
      16,
      'assets/high_res_appgraphs/app_graph17.png',
      'Die Ernährung der Langlebigsten - Okinawa',
      graphArticleDescriptions[16],
      graphArticleSourceUrls[16],
      [2], ''),
  GraphArticle(
      17,
      'assets/high_res_appgraphs/app_graph18.png',
      'Die Ernährung der Langlebigsten - Ikaria',
      graphArticleDescriptions[17],
      graphArticleSourceUrls[17],
      [2], ''),
  GraphArticle(
      18,
      'assets/high_res_appgraphs/app_graph19.png',
      'Das Problem mit Soja aus Regenwäldern',
      graphArticleDescriptions[18],
      graphArticleSourceUrls[18],
      [1], ''),
  GraphArticle(
      19,
      'assets/high_res_appgraphs/app_graph20.png',
      'Hülsenfrüchte sind umweltfreundliche Eiweißalternativen!',
      graphArticleDescriptions[19],
      graphArticleSourceUrls[19],
      [1, 2], ''),
  GraphArticle(
      20,
      'assets/high_res_appgraphs/app_graph21.png',
      'Bio-Fleisch verursacht sogar mehr Emissionen',
      graphArticleDescriptions[20],
      graphArticleSourceUrls[20],
      [1], ''),
  GraphArticle(
      21,
      'assets/high_res_appgraphs/app_graph22.png',
      'Zahl veganer Restaurants steigt immer weiter!',
      graphArticleDescriptions[21],
      graphArticleSourceUrls[21],
      [1], ''),
  GraphArticle(
      22,
      'assets/high_res_appgraphs/app_graph23.png',
      'Vegane Stars: Ralf Möller',
      graphArticleDescriptions[22],
      graphArticleSourceUrls[22],
      [1, 2], '© CC BY-SA 2.0 (Fotograf: Siebbi)'),
  GraphArticle(
      23,
      'assets/high_res_appgraphs/app_graph24.png',
      'Vegane Stars: Natalie Portman',
      graphArticleDescriptions[23],
      graphArticleSourceUrls[23],
      [1, 2], '© CC BY-SA 2.0'),
  GraphArticle(
      24,
      'assets/high_res_appgraphs/app_graph25.png',
      'Vegane Stars: Joaquin Phoenix',
      graphArticleDescriptions[24],
      graphArticleSourceUrls[24],
      [1, 2], '© CC BY-SA 2.0 (Fotograf: Harald Krichel)'),
  GraphArticle(
      25,
      'assets/high_res_appgraphs/app_graph26.png',
      'Vegane Stars: Billie Eilish',
      graphArticleDescriptions[25],
      graphArticleSourceUrls[25],
      [1], '© CC BY-SA 2.0 (Fotograf: Lars Crommelinck)'),
  GraphArticle(
      26,
      'assets/high_res_appgraphs/app_graph27.png',
      'Fleischersatz mit Till Lindemann',
      graphArticleDescriptions[26],
      graphArticleSourceUrls[26],
      [1], '© CC BY-SA 2.0 (Fotograf: Till Brönner)'),
  GraphArticle(
      27,
      'assets/high_res_appgraphs/app_graph28.png',
      'Konsum von Kuhmilch geht weiter zurück!',
      graphArticleDescriptions[27],
      graphArticleSourceUrls[27],
      [1], ''),
  GraphArticle(
      28,
      'assets/high_res_appgraphs/app_graph29.png',
      'Der deutsche Fleischverzehr sinkt stetig!',
      graphArticleDescriptions[28],
      graphArticleSourceUrls[28],
      [1], ''),
  GraphArticle(
      29,
      'assets/high_res_appgraphs/app_graph30.png',
      '7 Tage vegetarisch: für die Umwelt ein Gewinn',
      graphArticleDescriptions[29],
      graphArticleSourceUrls[29],
      [1], ''),
  GraphArticle(
      30,
      'assets/high_res_appgraphs/app_graph31.png',
      'Was schon eine Woche pflanzliche Ernährung bewirken kann',
      graphArticleDescriptions[30],
      graphArticleSourceUrls[30],
      [1], ''),
  GraphArticle(
      31,
      'assets/high_res_appgraphs/app_graph32.png',
      'Ernährungsgesellschaften zu pflanzlicher Ernährung: Canada',
      graphArticleDescriptions[31],
      graphArticleSourceUrls[31],
      [2], ''),
  GraphArticle(
      32,
      'assets/high_res_appgraphs/app_graph33.png',
      'Ernährungsgesellschaften zu pflanzlicher Ernährung: Australien',
      graphArticleDescriptions[32],
      graphArticleSourceUrls[32],
      [2], ''),
  GraphArticle(
      33,
      'assets/high_res_appgraphs/app_graph34.png',
      'Ernährungsgesellschaften zu pflanzlicher Ernährung: USA',
      graphArticleDescriptions[33],
      graphArticleSourceUrls[33],
      [2], ''),
  GraphArticle(
      34,
      'assets/high_res_appgraphs/app_graph35.png',
      'Die deutsche Gesellschaft für Ernährung nimmt Stellung zu veganer Ernährung',
      graphArticleDescriptions[34],
      graphArticleSourceUrls[34],
      [2], ''),
  GraphArticle(
      35,
      'assets/high_res_appgraphs/app_graph36.png',
      'Fleischverzehr im zeitlichen Verlauf',
      graphArticleDescriptions[35],
      graphArticleSourceUrls[35],
      [1], ''),
  GraphArticle(
      36,
      'assets/high_res_appgraphs/app_graph37.png',
      'Der unaufhaltsame Klimawandel',
      graphArticleDescriptions[36],
      graphArticleSourceUrls[36],
      [1], ''),
  GraphArticle(
      37,
      'assets/high_res_appgraphs/app_graph38.png',
      'Pflanzliche Ernährung hält jung!',
      graphArticleDescriptions[37],
      graphArticleSourceUrls[37],
      [2], ''),
  GraphArticle(
      38,
      'assets/high_res_appgraphs/app_graph39.png',
      'Herzgesund mit pflanzlicher Ernährung',
      graphArticleDescriptions[38],
      graphArticleSourceUrls[38],
      [2], ''),
  GraphArticle(
      39,
      'assets/high_res_appgraphs/app_graph40.png',
      'Die unglaubliche Wirkung sekundärer Pflanzenstoffe',
      graphArticleDescriptions[39],
      graphArticleSourceUrls[39],
      [2], ''),
  GraphArticle(
      40,
      'assets/high_res_appgraphs/app_graph41.png',
      'Gesundheitsrisiken von hohem Fleischkonsum',
      graphArticleDescriptions[40],
      graphArticleSourceUrls[40],
      [2], ''),
  GraphArticle(
      41,
      'assets/high_res_appgraphs/app_graph42.png',
      'Eisenmangel? Nicht mit diesen pflanzlichen Lebensmitteln',
      graphArticleDescriptions[41],
      graphArticleSourceUrls[41],
      [2], ''),
  GraphArticle(
      42,
      'assets/high_res_appgraphs/app_graph43.png',
      'Aber muss ich nicht Fleisch essen, um Vitamin B12 zu bekommen?',
      graphArticleDescriptions[42],
      graphArticleSourceUrls[42],
      [2], ''),
  GraphArticle(
      43,
      'assets/high_res_appgraphs/app_graph44.png',
      'Sind Sojaprodukte eigentlich gesund?',
      graphArticleDescriptions[43],
      graphArticleSourceUrls[43],
      [2], ''),
  GraphArticle(
      44,
      'assets/high_res_appgraphs/app_graph45.png',
      'Umweltfreundliche Ernährung: Die Möglichkeiten und Grenzen vegetarischer Kost',
      graphArticleDescriptions[44],
      graphArticleSourceUrls[44],
      [1], ''),
  GraphArticle(
      45,
      'assets/high_res_appgraphs/app_graph46.png',
      'Pflanzenpower mit Spitzensportlerin Melanie Fraunschiel',
      graphArticleDescriptions[45],
      graphArticleSourceUrls[45],
      [1, 2], '© CC BY-SA 2.0 (Fotograf: V.kleppig)'),
  GraphArticle(
      46,
      'assets/high_res_appgraphs/app_graph47.png',
      '"Vegan Strongman" Patrik Baboumian"',
      graphArticleDescriptions[46],
      graphArticleSourceUrls[46],
      [1, 2], '© CC BY-SA 2.0 (Fotograf: Deivitrix)'),
  GraphArticle(
      47,
      'assets/high_res_appgraphs/app_graph48.png',
      'Veganer Kraftprotz: Arnold Schwarzenegger',
      graphArticleDescriptions[47],
      graphArticleSourceUrls[47],
      [1, 2], '© CC BY-SA 2.0 (Fotograf: Gage Skidmore)'),
  GraphArticle(
      48,
      'assets/high_res_appgraphs/app_graph49.png',
      'Der Anteil tierischer Produkte an unserer ernährungsbezogenen CO₂-Bilanz',
      graphArticleDescriptions[48],
      graphArticleSourceUrls[48],
      [1], ''),
  GraphArticle(
      49,
      'assets/high_res_appgraphs/app_graph50.png',
      'Pflanzliche Ernährung muss nicht teuer sein!',
      graphArticleDescriptions[49],
      graphArticleSourceUrls[49],
      [1, 2], '')
];

//List<GraphArticle> allGraphArticles = graphArticles.expand((element) => element).toList();

List<String> graphArticleDescriptions = [
  'Dass die Produktion von tierischen Nahrungsmitteln mehr Treibhausgasemissionen verursacht als die Produktion von pflanzlichen Lebensmitteln, haben viele von uns schon mal gehört. Doch wie groß sind die Unterschiede zwischen unterschiedlichen Ernährungsstilen tatsächlich? Dieser Frage sind die AutorInnen Scarborough et al. (2014) in Großbritannien nachgegangen. In ihrer Stichprobe von run 45.000 TeilnehmerInnen war das durchschnittliche CO₂-Äquivalent für Personen mit hohem Fleischkonsum am höchsten (7.19 kg CO₂e/Tag). Der Tagesbedarf wurde hierbei auf 2000 kcal standardisiert. Mit sinkendem Fleischkonsum verringerten sich auch die durch die Ernährung verursachten CO₂-Emissionen. So belief sich das CO₂-Äquivalent von VegetarierInnen und solchen, die zusätzlich noch Fisch konsumierten auf rund 4 kg CO₂e/Tag. Den geringsten Ausstoß an Kohlenstoffemissionen wiesen Personen mit einer rein pflanzlichen Ernährung auf (2.89 kg CO₂e/Tag). Was bedeutet das für unsere eigene Ernährung? Jeder Verzicht auf tierische Lebensmittel, insbesondere Fleisch, kommt der Umwelt zugute!',
  'Nach Zahlen des Bundesinformationszentrums Landwirtschaft (BZL) berichtet die Bundesanstalt für Landwirtschaft und Ernährung (BMEL) von einem Rückgang des Pro-Kopf-Milchvebrauchs um 2,2 kg im Vergleich zum Vorjahr. Damit ist der Milchkonsum auf dem niedrigsten Niveau seit 1991. Neben der Produktion von Konsummilch ging auch die Herstellung von Butter-, Milchfett- und Milchstreicherzeugnissen um sieben Prozent zurück. Ein möglicher Grund für die geringere Nachfrage ist der steigende Konsum pflanzlicher Ersatzprodukte. Wenn du mehr über diese umweltfreundlicheren Alternativen lernen möchte, öffne gerne den „Zutaten“ Tab.',
  'Laut dem Ernährungsreport 2021 vom Bundesanstalt für Landwirtschaft und Ernährung (BMEL) hat sich die Anzahl sowohl von VegetarierInnen als auch VeganerInnen in einem Jahr verdoppelt! So landeten nur noch bei 26% der Befragten Fleisch täglich auf dem Teller, wohingegen immerhin 76% täglich Obst und Gemüse konsumierten. Als Gründe für den Kauf von pflanzlichen Ersatzprodukten wurde allen voran Neugier (71%) angegeben. Vielleicht möchtest du es den Befragten ja einmal nachmachen – in dem Wissen, dass pflanzliche Alternativen ebenfalls einen geringeren CO₂-Fußabdruck aufweisen.',
  'Deutschland ist zu einer Hochburg für pflanzliche Alternativen geworden! Gemäß einer Studie von Mintel (2018) kamen 15% aller veganen Neueinführungen aus der Bundesrepublik. Während im Jahr 2013 nur ca. 4% der neuen Lebensmittel und Getränke „vegan“ gelabelt wurden, lag der Anteil bei 14% im Jahr 2018. Begründet sehen die Autoren der Studie den Anstieg nicht nur in der Popularität pflanzlicher Ernährung. Ein viel höherer Prozentsatz von KonsumentInnen sei im Rahmen einer „flexitarischen“ Ernährung am Verzehr pflanzlicher Alternativen interessiert. Egal ob du komplett pflanzlich durchstarten möchtest oder nur einzelne Produkte ersetzen willst, es warten mehr pflanzliche Alternativen für Fleisch und Milchprodukte als je zuvor auf dich in deinem Supermarkt! Probiere sie doch mal aus.',
  'Wäre es nicht schön, wenn du mit einer pflanzlicheren Ernährung nicht nur unserem Planeten, sondern auch deiner Gesundheit etwas Gutes tust? Tatsächlich zeigten die Ergebnisse einer Meta-Analyse der AutorInnen Dinu et al., die 96 Studien zu diesem Thema einschloss, dass VegetarierInnen und VeganerInnen einen geringeren Cholesterinspiegel aufwiesen als Personen, die sich mischköstlich ernährten. Gleiches galt für Body-Mass-Index und Glukoselevel. Darüberhinaus war das Risiko der Sterblichkeit durch koronare Herzerkrankungen bei VegetarierInnen im Vergleich zu MischköstlerInnen um 25% geringer und das Risiko des Auftretens von Krebserkrankungen um 8% verringert. Bei VeganerInnen war das Risiko sogar um 15% geringer. Das ein oder andere Stück Fleisch zu ersetzen, könnte also auch für deine Gesundheit zuträglich sein.',
  '',
  'Der Veganuary hat seit dem Start der Kampagne im Jahr 2014 mehr als 1,5 Millionen dazu inspiriert sich den mindestens den Monat Januar lang rein pflanzlich zu ernähren. Dabei haben sich allein im letzten Jahr rund 582.000 offiziell für den Veganuary angemeldet. Einer Kantar-Studie zufolge nehmen sogar bis zu 10 Mal so viele Personen teil. Beweggründe für die Teilnahme war allen voran Tierschutz (46%), gefolgt von Gesundheit (22%) und Umweltschutz (21%). Über den Monat Januar hinaus planten 75% ihren Fleischkonsum zu halbieren und rund 40% sogar eine rein pflanzliche Ernährung beizubehalten. Das mag aber nicht für jeden etwas sein. Wenn der langfristige Verzicht für dich etwas zu extrem klingt, mag es mehr Sinn machen den Konsum tierischer Produkte an einzelnen Stellen zu reduzieren. Dabei unterstützen wir dich gerne und die Umwelt dankt es dir genauso!',
  'Wenn es um die Bekämpfung des Klimawandels geht, wird sich häufig auf „saubere Energie“ fokussiert. Tatsächlich macht der Energiesektor, bezogen auf Elektrizität, Heizen, Transport und industrielle Prozesse, den Großteil der globalen Treibhausgasemissionen aus. Gleichzeitig ist aber auch das globale Nahrungsmittelsystem mit einem Anteil von rund 26% an den Gesamtemissionen einen großen Beitrag zum Fortschritt des Klimawandels. Das Schöne ist, dass mit der Reduzierung deines Konsums von tierischen Produkten viel tun kannst, um diesem entgegenzuwirken. Deine täglichen Rezeptvorschläge warten auf dich, um dich dabei zu unterstützen und dabei neue kulinarische Erfahrungen zu sammeln.',
  'Nutztierhaltung und Aquakultur machen rund 31% der Treibhausgasmissionen aus, die durch Lebensmittel verursacht werden. Das sind 10% mehr als der Beitrag von pflanzlichen Lebensmitteln, welche für den menschlichen Verzehr produziert werden, obwohl diese in absoluter Menge wesentlich mehr produziert werden. Zudem macht die Produktion von Tierfutter inklusive benötigter Landnutzung zusätzliche 22% der Emissionen aus. Damit sind vegetarische und pflanzliche Alternativen für Fleisch, wie Milchprodukte, Eier, Hülsenfrüchte und Tofu sind günstigere Proteinquellen – nicht nur für die Umwelt, sondern den Geldbeutel! Selbst Fleischersatzprodukte sind von Eigenmarken der gängigen Supermarktketten mittlerweile günstig zu kaufen. Und wenn es dein Geldbeutel zulässt, lohnt sich der Aufpreis für Käsealternativen und Co. ebenfalls.',
  'Okay, Fleisch verursacht viel CO₂-Emissionen – verstanden. Doch wie groß ist der Unterschied zu pflanzlichen Alternativen denn nun wirklich? Eine Studie der AutorInnen Santo et al. gibt Einblicke: Die durch Rindfleisch verursachten CO₂-Emissionen betrugen knapp 42 kg pro 100g Protein. Das entspricht in etwa der 10-fachen Menge von Geflügelfleisch und Eiern. Geflügelfleisch verursacht wiederum mit rund 5kg Kohlenstoffemissionen pro 100g Protein doppelt so viel wie pflanzlicher Fleischersatz. Das bildet sich auch im Landvebrauch der Lebensmittel ab (Bild 2). Innerhalb der Gruppe pflanzlicher Alternativen gilt: je unverarbeiteter desto umweltfreundlicher. So sind Hülsenfrüchte wie Linsen und Bohnen mit einem CO₂-Fußabdruck von weniger als 1 kg pro 100g Protein am günstigen. Und ja das gilt auch für dein Portemonnaie! In einer 500 Gramm Packung Linsen (Preis: i.d.R. 2 Euro) stecken mehr als 120 Gramm Eiweiss. Gepaart mit ihrem hohen Gehalt an Mikronährstoffen, komplexen Kohlenhydraten und Balaststoffen ist die Linse das perfekte Grundnahrungsmittel! Egal ob im indischen Linsen-Dal, in der deutschen Linsensuppe oder als vollwertiges Burger-Patty.',
  '',
  'Wie umweltfreundlich ist eigentlich der Konsum von Fisch im Vergleich zu Fleisch? Der CO₂-Fußabdruck von Fisch ist im Durchschnitt mit rund 5 kg CO₂-Emissionen vergleichbar hoch mit dem von Schweinefleisch. Allerdings liegt der Wasserverbrauch im Mittel über 2500 Liter Wasser pro 100g Protein! Das ist bis zu 100 Mal mehr als pflanzliche Alternativen wie Fleischersatzprodukte, Hülsenfrüchte und Tofu.',
  'Auch der Ersatz von Kuhmilch und Milchprodukten hilft deinen durch die Ernährung verursachten Kohlenstoff-Fußabdruck zu verringern. Das Gute: Die gängigen Pflanzendrinks wie Soja-, Mandel-, Hafer- und Reismilch sind sich in ihrer Umweltfreundlichkeit sehr ähnlich. Das heißt: Trinke was dir schmeckt! Falls die Welt der Pflanzenmilch noch neu für dich ist probiere dich also gerne mal durch. Genauso findest du in jedem gut sortiertem Supermarkt eine Vielfalt an pflanzlichen Alternativen für Milchprodukte wie Streich-, Streu- und Scheibenkäse, sowieso Joghurt und Skyr. Auch wenn ein Verzicht auf Käse natürlich genauso möglich ist, fällt es vielen schwer diese heißgeliebte Köstlichkeit aufzugeben und die Ersatzprodukte können beim Umstieg kulinarisch sehr hilfreich sein.',
  'Pflanzenmilch? Wer trinkt denn sowas? Der Großteil, tatsächlich! Während der Markanteil von Pflanzenmilch in Europa und den USA schon bei 54% gegenüber tierischer Milch liegt (46%), ist er in Latein-Amerika und Asien mit einer Quote von rund zwei Dritteln sogar noch höher!',
  'Laut dem statistischen Bundesamt steigt die Produktion von vegetarischen und veganen Fleischersatzprodukten aufgrund steigender Nachfrage weiter an! Gleichzeitig ist die Nettoerzeugung (Schlachtgewicht) von Fleisch im Jahr 2021 um 2,4% im Vergleich zum Vorjahr zurückgegangen, basierend auf Daten vom Bundesministerium für Ernährung und Landwirtschaft.',
  'Die steigende Popularität von Pflanzendrinks als Alternative für tierische Milch zeigt sich auch in den Importzahlen. So gibt das Statistische Bundesamt einen Anstieg der Importe von 2017 bis 2020 um 130% an. Jüngsten Daten zufolge hat sich der Import von 2020 bis 2021 um weitere 50% verhöht und belief sich damit im letzten Jahr auf 296,1 Millionen Tonnen! Vielleicht ist dir die wachsende Vielfalt an Pflanzendrinks, sowohl was Sorten als auch Marken betrifft, im Supermarkt schon aufgefallen. So oder so, probiere dich gerne mal durch das Sortiment. Gängige Sorten wie Hafer-, Soja- oder Reismilch liegen mittlerweile im selben Preissegment wie Kuhmilch und enthalten i.d.R. zugesetztes Kalzium, damit du auch pflanzlich optimal versorgt bleibst!',
  'Die Blue Zones – mehr oder weniger isolierte Regionen (z.B. Halbinseln) unterschiedlicher Regionen der Erde, in denen die Menschen eine überdurchschnittlich hohe Lebenserwartung haben. Der Lebensstil der BewohnerInnen dieser fünf identifizierten Regionen zeichnet sich neben regelmäßiger körperlicher Aktivität, sozialem Engagement und Familienfokus auch durch eine größtenteils pflanzliche Ernährung und insbesondere hohem Konsum von Hülsenfrüchten aus. Eine dieser Zonen befindet sich in Okinawa, Japan, einer der Orte mit den meisten über 100-Jährigen. Mit Blick auf die Ernährung der Ansässigen fällt nach dem immens hohen Anteil an Süßkartoffeln außerdem auf, dass kein Fleisch konsumiert wird. Tatsächlich ist Fisch, in geringen Mengen, das einzige tierische Lebensmittel was in der Region konsumiert wird. Die Haupteiweißquelle ist neben Reis, Getreide und Gemüse, die entgegen vieler Vermutungen ebenfalls Protein enthalten, Hülsenfrüchte. Ihre Ernährung trägt dazu bei, dass sie weniger unter den gängigen Volkskrankheiten des Westens (Diabetes, koronare Herzerkrankungen, etc.) zu leiden haben. Viel entscheidender als das erhöhte Lebensalter ist vielleicht der langfristige Erhalt körperlicher Fitness, auch im hohen Alter. Verglichen mit unsererer Ernährung, mag das Ernährungsverhalten in Okinawa wohl extrem wirken. Aber schon eine Reduzierung tierischer Lebensmittel kann nicht nur deinen CO₂-Fußabdruck senken, sondern auch gesundheitliche Vorteile bieten.',
  'Auch in Ikaria, Griechenland, ein weiterer Ort von überdurchschnittlicher Lebenserwartung gekennzeichnet, ist der Konsum von pflanzlichen Nahrungsmitteln sehr hoch. Der Fleisch- und Fischverzehr macht unter den IkarianerInnen zusammen nur 11% der Ernährung aus. Zu gleichen Teilen werden Hülsenfrüchte als Alternative für tierisches Eiweiss konsumiert. Wenn du dich also kulinarisch in der mediterranen Küche zuhause fühlst, probiere es doch mal aus, tierisches Protein mit Hülsenfrüchten zu ersetzen. Wie wäre es beispielweise mit einer Linsenbolognese? Check unsere Rezepte ab!',
  'Aber ist Soja nicht schlecht für die Umwelt? Es stimmt zwar, dass für die Herstellung von Sojaprodukten einiger Hersteller Regenwald gerodet wird. Allerdings wird rund 77% des Sojas als Tierfutter verwendet und macht damit den Fleischkonsum zu einem größeren Problem für den Erhalt des Regenwaldes als der menschliche Konsum von Sojaprodukten. Wenn du Sojaprodukte im Supermarkt kaufst, kommt das für die Herstellung verwendete Soja in aller Regel sowieso nicht aus Regelwaldregionen. Mache also kein halt vor ihnen, wenn dir Tofu, Tempeh & Co. schmecken. Damit der Tofu auch ordentlich Geschmack bekommt, findest du Ideen in unserem Rezepte-Tab.',
  '',
  '',
  'Neben der Zunahme an Neueinführungen pflanzlicher Alternativen, ist auch die Anzahl an pfanzlichen Gastronomiebetrieben in den letzten Jahren stark angestiegen. Mit Blick auf den hohen Anteil an VegetarierInnen und VeganerInnen wird sich dieser Trend zukünftig wahrscheinlich fortsetzen. Dabei wurden nicht mal jene erfasst, die nur einzelne vegetarische und vegane Gerichte zu ihrer bestehenden Speisekarte aufgenommen haben. Vielleicht hält auch schon dein Lieblingsrestaurant pflanzliche Alternativen bereit. Ansonsten findest du hier passende Restaurants und Lieferdienste in deiner Gegend. Und wenn es unterwegs mal schnell gehen muss, halten gängige Fastfoodketten mittlerweile eine Reihe an pflanzlichen Burgeralternativen bereit – selbst in ländlichen Regionen wo es ansonsten noch an Gastronomie mit pflanzlicher Cuisine mangeln kann.',
  'Bodybuilder und „Gladiator“- Star Ralf Möller ernährt sich mittlerweile rein pfanzlich. Als Motivation für seine Ernährungsumstellung gibt Möller in einem Interview mit Focus neben Umwelt- und Tierschutz auch gesundheitliche Vorteile an. Neben seinen Cholesterin-Werten, hätte sich auch seine athletische Perfomance seit der Ernährungsumstellung vor mittlerweile rund 5 Jahren stark verbessert. Zu jenen, die es sich nicht vorstellen können auf Fleisch zu verzichten – wie er einst selbst – sagte er Folgendes: „Viele Menschen verbinden mit vegan eine eher freudlose, unsexy Lebensweise. Das ist falsch. Es geht nicht darum, zu verzichten oder gar zu hungern, sondern neue hervorragende Gerichte zu entdecken.“',
  'Auch die Schauspielerin Natalie Portman ernährt sich seit vielen Jahren pflanzlich. Schon als sie neun Jahre alt war entschied sie sich dazu, kein Fleisch mehr zu essen, weil sie sich Tieren nah fühlte. So landen auch auf dem Familienesstisch mit ihren eigenen Kindern pflanzliche Köstlichkeiten',
  'Wie auch Natalie Portman, ernährt sich Joaquin Phoenix, bekannt als Schauspieler in Filmen wie „Joker“ und „Her“, seit seiner Kindheit pflanzlich. Dazu motiviert hat ihn neben seiner Empathie gegenüber Tieren auch insbesondere der negative Einfluss vom Konsum tierischer Produkte auf die Umwelt.',
  'Die Musikerin Billie Eilish ernährt sich ebenfalls rein pflanzlich – und das seit mittlerweile sieben Jahren. Der Umstieg sei ihr nicht schwer gefallen, da Fleisch in ihrem Leben noch nie eine große Rolle gespielt hätte. „Ich habe Fleisch nie vermisst – es gab für mich nichts zu vermissen.“, so Eilish. Seither informiert sie auch ihre rund 100 Millionen Follower große Instagram-Community über die Möglichkeit einer pflanzlichen Ernährung. Genauso ernährt sich auch ihre Familie mittlerweile rein pflanzlich, viele Freunde hingegen nicht. Dazu erläutert Eilish, dass sie niemandem etwas vorschreiben möchte.',
  'Skandal-Rocker Till Lindemann, Frontmann der Band Rammstein, nahm im Januar 2022 am „Veganuary“ teil. Dementsprechend ernährte er sich den Monat Januar über rein pflanzlich. Darüber hinaus bewarb er das Event im Rahmen einer Kampagne des Herstellers pflanzlicher Fleischersatzprodukte „Like Meat“. Dabei ist Lindemann bekennender Fleischliebhaber. Doch um das Aufzwingen einer pflanzlichen Ernährung geht es beim „Veganuary“ auch gar nicht, sondern darum, Fleischersatzalternativen auszuprobieren. Wenn selbst Till Lindemann Pflanzenburgern eine Chance gibt, warum nicht auch du?',
  'Der Milchkonsum der Deutschen sinkt auf 47,8 kg/Kopf (Stand: 2021) und erreicht damit den niedrigsten Wert seit 1991! Basierend auf vorläufigen Daten wird auch in der abschließenden Versorgungsbilanz für das Jahr 2022 ein weiterer Rückgang des Milchverzehrs erwartet. Du willst Teil dieses Trends sein? Probiere doch mal Pflanzendrinks aus. Sie sind genauso zu genießen wie herkömmliche Kuhmilch, egal ob im Kaffee, Müsli oder zum Backen. Darüber freut sich nicht zuletzt auch die Umwelt.',
  'Der Pro-Kopf-Verzehr von Fleisch sinkt weiter! Mit 55kg/Kopf im Jahr 2021 ist der Fleischkonsum in einem Rekordtief seit dem Jahr 1989. Das geht aus Angaben der vorläufigen Versorgungsbilanz des Bundesministeriums für Ernährung und Landwirtschaft hervor. Im Vergleich zum Vorjahr wurden im Durchschnitt 2,3 kg weniger Fleisch konsumiert.',
  'Basierend auf den Daten einer Studie der AutorInnen Scarborough et al. (2014) kannst du schon mit einer Woche Fleischverzicht bis zu 13 kg CO₂-Emissionen einsparen! Falls du viel Fleisch, insbesondere rotes, isst, kann der Verzicht darauf noch wesentlich mehr Emissionen einsparen.',
  'Wer es radikaler angehen möchte und sich eine Woche lang rein pfanzlich ernährt, spart sogar bis zu 20 kg CO₂ ein! Auch wenn Milchprodukte und Eier insgesamt umweltfreundlicher sind, trägt der Verzicht auf diese zu einer zusätzlichen Ersparnis von rund 7 kg CO₂ im Vergleich zu dem bloßen Verzicht auf Fleisch bei.',
  'Die „Dietitians of Canada“, die Ernährungsgesellschaft Kanadas, äußert sich schon seit  2014 sehr positiv zur pflanzlichen Ernährungsweise. Sie stufen eine rein pflanzliche Ernährung für alle Lebensphasen, inklusive Schwangerschaft und Stillzeit, als bedarfsgerecht ein. Darüberhinaus schreiben sie der pflanzlichen Ernährungsweise weitere Vorteile, wie ein vermindertes Risiko Volkskrankheiten zu entwickeln, zu. Die AutorInnen liefern ausführliche Ernährungstipps, um alle kritischen Nährstoffe durch die Ernährung abdecken zu können. Wenn du planst, dich langfristig rein pflanzlich zu ernähren, lohnt es sich, das fünfseitige Dokument einmal durchzulesen! Wie bei der Mischkost, kommt es auch auf die Ausgewogenheit einer pflanzlichen Ernährung an. Eine vollwertige und abwechslungsreiche Ernährung, bestehend aus Obst, Gemüse, Hülsenfrüchten, gesunden Kohlenhydratquellen sowie Nüssen und Samen kann alle Nährstoffe abdecken. Lediglich Vitamin B12 sollte präventiv supplementiert werden, wenn langfristig auf tierische Produkte verzichtet wird. Glücklicherweise ist Vitamin B12 mittlerweile schon in vielen pflanzlichen Ersatzprodukten, wie Pflanzenmilch, enthalten. Vitamin B12 kommt übrigens nicht natürlicherweise in tierischen Produkten vor, sondern wird ausschließlich von Mikroorganismen gebildet.',
  'Genau wie Kanada, äußern sich auch die Ernährungsgesellschaften Australiens‘ und der USA positiv zu vegetarischen und veganen Ernährungsweisen. So appellieren sie an die Umsetzung einer pflanzenbetonten Ernährung mit viel Gemüse und Obst, Vollkorngetreide und Proteinquellen wie Hülsenfrüchten und Nüssen.',
  '',
  'Auch die Deutsche Gesellschaft für Ernährung e.V. (DGE) erkennt die potenziellen Vorteile einer pflanzlichen Ernährung an. Sie betont lediglich, dass eine langfristig vegane Kost gut geplant werden sollte, um alle kritischen Nährstoffe abdecken zu können. Die DGE hält eine rein pflanzliche Ernährung für bedarfsgerecht, wenn (1) eine Supplementierung und Kontrolle des Vitamin B12 erfolgt, (2) nährstoffdichte Lebensmittel gezielt konsumiert werden, um Mängeln vorzubeugen und (3) Ernährungsberatung erfolgt, um ein Grundverständnis über die eigene Ernährung zu erlangen. Damit ähnelt die Position der DGE zur veganen Ernährung denen anderer Ernährungsgesellschaften. Generell empfiehlt auch die DGE eine vorwiegend vegetarische Kost mit hohen Anteilen an Gemüse und Obst. Wenn du dich langfristig vegan ernähren möchtest, um deinen CO₂-Fußabdruck zu reduzieren, gibt es mittlerweile auch online genügend Angebote für eine passende Ernährungsberatung.',
  'Der Fleischkonsum der Deutschen hat sich in den letzten zwei Jahrhunderten vervielfacht! Auch wenn der Trend seit dem Jahr 2000 leicht rückläufig ist, trägt der hohe Fleischkonsum substantiell zu den durch die Ernährung verursachten CO₂-Emissionen und dem Aufkommen von Volkserkrankungen wie Bluthochdruck und koronaren Herzerkrankungen bei. Vielleicht willst du es ja mal vergangenen Generationen nachmachen und deinen Fleischkonsum beschränken. Dabei kann es helfen bestimmte „Fleischtage“ für sich selbst festzulegen, wie einst für den Sonntagsbraten und sich den Rest der Woche vegetarisch zu ernähren.',
  'Die Erderwärmung schreitet aufgrund der durch Menschen verursachten Treibhausgasemissionen immer weiter fort. Naturkatastrophen sind auch in Deutschland angekommen und selbst mit Klimawanderung ist innerhalb Deutschlands aus den Küstenregionen aufgrund des Meeresspiegelanstiegs bis 2050 zu rechnen. Der Mensch verursacht also nicht nur den Klimawandel, sondern trägt ebenso dessen Konsequenzen -  auch wir im Zentrum Europas. Dabei begann der lineare, unaufhörliche Temperaturanstieg erst vor rund 60 Jahren. Eine Rückkehr zur Lebensweise älterer Generationen kann dabei helfen, das weitere Fortschreiten aufzuhalten. Dazu zählt die Rückkehr zu einem geringeren Fleischkonsum. Wenn du Ideen brauchst wie du Fleisch ersetzen kannst, stöbere gerne mal durch unsere Rezepte.',
  'Viele kosmetische Produkte versprechen einen Anti-Aging-Effekt, Studien zufolge kann dieses Versprechen tatsächlich von einer pflanzlichen Ernährung gehalten werden! Laut den AutorInnen Solway et al. (2020) maximiert eine pflanzliche Ernährung das antioxidative Potenzial und verlängert die Telomere, was Zellschäden vorbeugt. Ein weiterer Grund, weniger tierischer Produkte und mehr Pflanzen in deine Ernährung einzubauen!',
  'Eine pflanzliche Ernährung hilft bei der Vorbeugung koronarer Herzerkrankungen, so Studien der AutorInnen Satija et al. (2017) und Kahleova und KollegInnen (2017). Ein geringeres Risiko zeige sich schon bei dem bloßen Umstieg auf eine vegane Ernährung. Maßgeblich für den Effekt sei allerdings die Vollwertigkeit der pflanzlichen Ernährung. Um das Risiko koronarer Herzerkrankungen zu minimieren, sollten dementsprechend verarbeitete Lebensmittel vermieden werden und die Ernährung stattdessen vorwiegend aus Gemüse, Obst, Hülsenfrüchte, vollwertigen Kohlenhydraquellen sowie Nüssen und Samen bestehen.',
  'Obst und Gemüse sind reich an sekundären Pflanzenstoffen! Von Chlorophyll hast du bestimmt schon mal gehört und vielleicht auch von Phytinsäure. Letztere hat häufig eher einen negativen Ruf, da sie die Aufnahme einiger Nährstoffe vermindern kann. Im Kontext einer nährstoffarmen Ernährung kann dies tatsächlich ein Problem darstellen, allerdings hat die Phytinsäure ebenso sehr positive Effekte. So verhindert sie die Bildung gefährlicher Radikale, was u.A zur Erklärung herangezogen wird, warum eine Ernährung reich an Phytinsäure Darmkrebs und entzündlichen Darmerkrankungen vorbeugen kann. Das Schöne: richtig zubereitet ist das Gemüse nicht nur gesund, sondern schmeckt auch gut. Du brauchst Inspiration beim Kochen? – Check unsere Rezepte aus!',
  'Seit 2015 stuft die World Health Organisation (WHO) verarbeitete Fleischprodukte wie Wurst als krebserregend ein, da sich beim Pökeln und Räuchern Chemikalien wie N-Nitrosoverbindungen bilden können. Daneben schreibt die WHO auch rotem Fleisch (Rind, Schwein, Wildfleisch, etc.) in unverarbeiteter Form eine potenziell krebserregende Wirkung im Menschen zu. Studienergebnisse deuten auf ein erhöhtes Darm- sowie Brustkrebsrisiko und ein potenziell erhöhtes Risiko für die Entstehung anderer Krebsarten durch einen hohen Konsum von rotem Fleisch. Zum Glück gibt es mittlerweile viele pflanzliche Alternativen, um Hackfleisch, Burger und co. zu ersetzen. Eine besonders vollwertige Alternative stellen Hülsenfrüchte dar, die du ebenfalls zu einer Bolognese oder Burgern verarbeiten kannst.',
  'Aber mangelt es bei einer pflanzlichen Ernährung nicht an Eisen? Überhaupt nicht! Lediglich auf die Lebensmittelauswahl kommt es an. Vollwertige Lebensmittel wie Vollkornprodukte, Hülsenfrüchte und Blattgemüse enthalten extrem viel Eisen. Um die Absorption zu verbessern, lohnt es sich Obst und Gemüse mit Vitamin C zu den eisenhaltigen Lebensmitteln, wie Haferflocken oder Linsen, zu essen. Dunkles Blattgemüse wie Spinat hat sowohl einen hohen Eisen als auch Vitamin C Gehalt und stellt damit einen sehr guten Eisenlieferanten dar. Außerdem kannst du allein mit einer großen Portion Haferflocken zum Frühstück rund die Hälfte deines Tagesbedarfs an Eisen decken.',
  'Ein Vitamin B12 Mangel wird in der Öffentlichkeit häufig als mögliche Langzeitfolge einer pflanzliche Ernährung dargestellt, da Vitamin B12 ausschließlich in tierischen Produkten enthalten sei. Doch stimmt das? Wo kommt das Vitamin überhaupt her? Vitamin B12 wird ausschließlich von Bakterien gebildet und kommt damit natürlich im Erdboden, aber auch dem Magen-Darmtrakt von Nutztieren vor, die wir dann schlachten und konsumieren. Doch können sich so nur Wiederkäuer wie Kühe selbst mit Vitamin B12 adäquat selbst versorgen. Dementsprechend wird Vitamin B12 auch dem Tierfutter zugesetzt. Damit nehmen wir es dann sekundär über den Konsum tierischer Produkte zu uns. Viel effizienter wäre es, das Vitamin uns direkt zuzuführen. Glücklicherweise gibt es genügend günstige Nahrungsergänzungsmittel sowie Lebensmittel, denen Vitamin B12 schon zugesetzt wird. Übrigens: Vitamin B12 Mangel ist auch bei MischköstlerInnen sehr verbreitet. Probiere doch mal Pflanzenmilch aus, der das Vitamin zugesetzt ist, um deinen Tagesbedarf zu decken!',
  'Soja hat nicht nur ein Aminosäurenprofil, welches dem von Fleisch stark ähnelt, sondern senkt das Risiko an Herzkreislauferkrankungen und Krebs zu leiden. Die enthaltenen Isoflavine schützen außerdem vor Osteoporose. Entgegen einiger Äußerungen, die auf Ergebnissen von Tierstudien beruhen, senkt der Konsum von Soja weder den Testosteronspiegel noch die Fruchtbarkeit im Menschen (Messina, 2010). Insbesondere fermentierte Sojaprodukte wie Tempeh, die durch die Fermentierung leichter verdaulich sind, haben eine blutdrucksenkende, anti-entzündliche und anti-diabetische Wirkung. Wenn du Soja verträgst, probiere doch mal unsere Rezepte aus, um aus dem neutralen Tofu eine Leckerei zu zaubern!',
  'Verglichen mit Rindfleisch sind Milchprodukte und Eier wesentlich umweltfreundlicher, da ihr CO₂-Äquivalent um ein Vielfaches geringer ist. Gleiches gilt im Übrigen für Schweinefleisch im Vergleich zu Rindfleisch. Wenn du deinen CO₂-Fußabdruck verringern möchtest, macht es also Sinn als Erstes Rindfleisch zu ersetzen. Mit Blick auf pflanzliche Eiweißquellen wird allerdings deutlich, dass jegliche tierische Produkte verhältnismäßig viel Kohlenstoffemissionen verursachen. Wenn du es schaffst einzelne tierische Produkte durch pflanzliche Alternativen zu ersetzen, kannst du deine durch die Ernährung verursachten CO₂-Emissionen weiter senken!',
  'Melanie Fraunschiel, östereichische Meisterin und Wiener Meisterin im Olympischen Boxen zu ihrer Ernährung: „Ich war früher, bevor ich mich pflanzenbasiert ernährt habe, sehr oft krank und habe auch viele Diäten durchgemacht. Jedenfalls war ich nach einem grippalen Infekt endlich wieder im Training und ein Boxkollege hat mir das Buch „Thrive“ von Brandon Brazier, dem veganen Triathleten, ans Herz gelegt. Ich habe mich mit meinen Problemen im Bereich der Haut, Gesundheit und Leistungsfähigkeit in seinen Ausführungen wieder erkannt. Das war für mich der Startschuss, diese Art der Ernährung auszuprobieren!“',
  'Strong-Man, Weltrekordhalter und stärkster Mann Deutschlands Patrik Baboumian ernährt sich seit 2005 vegetarisch und seit 2011 vegan! Er erregte mediale Aufmerksamkeit, weil er mit einer rein pflanzenbasierten Ernährung in Strong-Man-Wettbewerben verschiedene Titel gewann. In der Dokumentation The Game Changers (2018) zum Thema „Veganismus im Hochleistungssport“, die von James Cameron produziert wurde, ist Patrik ebenfalls zu sehen.',
  'Der österreichisch-amerikanische Kraftprotz Arnold Schwarzenegger behauptet, dass sein kürzlich erfolgter Wechsel zur pflanzlichen Ernährung seinen Cholesterinspiegel drastisch gesenkt hat. Seit seiner Änderung des Lebensstils fühle sich der mittlerweile 75-Jährige „insgesamt gesünder und jünger.“ Schwarzenegger ist ein Verfechter der pfanzlichen Ernährung und erschien in der Dokumentation Die Game Changers, die auf Netflix zu sehen ist. Er ermutigt auch junge Bodybuilder, seinem Beispiel zu folgen und ihre Steaks gegen Hülsenfrüchte auszutauschen. Statt einem radikalen Umstieg, hat er nach und nach tierische Produkte durch pflanzliche Alternativen ersetzt.',
  'Laut dem World Wide Fund For Nature (WWF) sind nahezu 70 % der direkten Treibhausgasemissionen unserer Ernährung sind auf tierische Produkte zurückzuführen, auf pflanzliche Produkte dagegen nur knapp ein Drittel. Unser Hunger auf Fleisch bedingt nicht nur mehr Treibhausgase, sondern auch erhöhten Landverbrauch. Rund 77% der landwirtschaftlichen Flächen wird für die Nutztierhaltung belegt. Gleichzeitig liefern tierische Produkte nur 18% unserer konsumierten Gesamtkalorien. Um dem Welthunger und der steigenden Weltbevölkerung zu begegnen, wäre es wesentlich effizienter die landwirtschaftlich genutzten Flächen für Ackerbau pflanzlicher Lebensmittel zu verwenden, welcher aktuell rund 23% Anteil der Flächennutzung ausmacht, aber 82% der globalen Kalorienversorgung.',
  'Aber ist eine pflanzliche Ernährung denn nicht super teuer? Das kommt ganz individuell auf deine persönliche Lebensmittelauswahl an. Pflanzendrinks liegen im selben Preissegment wie Kuhmilch, einige Ersatzprodukte können aber teurer sein. Insgesamt sind viele hochwertige tierische Produkte, insbesondere in Bio-Qualität, wie verschiedene Fleischstücke und Käsesorten sogar teurer als pflanzliche Alternativen. Da Fleischersatzprodukte für Hack, Burger und Co. mittlerweile auch von Discountern angeboten werden, kannst du dich selbst mit einer „veganisierten“ Mischkost, in der du einfach tierische Produkte mit entsprechenden pflanzlichen Alternativen ersetzt, relativ günstig ernähren. Die gesündere, umweltfreundlichere und glücklicherweise preisgünstigste Möglichkeit, auf Hülsenfrüchte wie Linsen und Bohnen als Alternative für Fleisch zurückzugreifen, könnte für dich aber ebenso interessant sein. Genauso sind texturiertes Sojaeiweiss, Seitanpulver und Co. in roher Form sehr günstig und können in einer Vielzahl von Rezepten als Fleischersatz eingesetzt werden. Generell gilt: Je unverarbeiteter desto günstiger. Was Obst und Gemüse angeht, lohnt es sich nicht nur für die Umwelt, sondern auch für deinen Geldbeutel, regionale und saisonale Produkte zu kaufen. Äpfel, Karotten und Kohl sind aktuell auch frisch und in Bio-Qualität günstig zu erwerben. Um Geld zu sparen lohnt es sich außerdem, Obst und Gemüse, wie Beeren, Spinat und Brokkoli, tiefgefroren zu kaufen.'
];

List<List<Uri>> graphArticleSourceUrls = [
  [Uri(scheme: 'https', host: 'doi.org', path: '/10.1007/s10584-014-1169-1')],
  [
    Uri(
        scheme: 'https',
        host: 'ble.de',
        path:
            '/SharedDocs/Pressemitteilungen/DE/2022/220502_Milchmarkt_2021.html')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'bmel.de',
        path: '/DE/themen/ernaehrung/ernaehrungsreport2021.html')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'de.mintel.com',
        path:
            '/pressestelle/deutschland-dominiert-weiterhin-bei-veganen-produkteinfuehrungen#:~:text=Vor%20f%C3%BCnf%20Jahren%20waren%20nur,als%20verdreifacht%20(%2B240%20Prozent')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'doi.org',
        path: '/10.1080/10408398.2016.1138447')
  ],
  [],
  [
    Uri(
        scheme: 'https',
        host: 'veganuary.com',
        path: '/wp-content/uploads/2021/12/Veganuary_2022_Pressekit.pdf')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'ourworldindata.org',
        path: '/food-ghg-emissions')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'ourworldindata.org',
        path: '/food-ghg-emissions')
  ],
  [Uri(scheme: 'https', host: 'doi.org', path: '/10.3389/fsufs.2020.00134')],
  [Uri(scheme: 'https', host: 'doi.org', path: '/10.3389/fsufs.2020.00134')],
  [Uri(scheme: 'https', host: 'doi.org', path: '/10.3389/fsufs.2020.00134')],
  [
    Uri(
        scheme: 'https',
        host: 'de.statista.com',
        path:
            '/statistik/daten/studie/1179366/umfrage/co%25E2%2582%2582-emissionen-von-kuhmilch-und-pflanzlicher-milch/#:~:text=Mit%20Blick%20auf%20den%20CO%E2%82%82,Mandelmilch%20bei%200%2C7%20Kilogramm, https://proveg.com/plant-based-food-and-lifestyle/vegan-alternatives/plant-milk-report/')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'proveg.com',
        path:
            '/plant-based-food-and-lifestyle/vegan-alternatives/plant-milk-report/')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'destatis.de',
        path:
            '/DE/Presse/Pressemitteilungen/Grafiken/Newsroom/2022/_Statisch/20220509-infografik-fleischersatzprodukte.png?__blob=poster'),
    Uri(
        scheme: 'https',
        host: 'bmel-statistik.de',
        path:
            '/ernaehrung-fischerei/versorgungsbilanzen/fleisch#:~:text=Im%20Jahr%202021%20betrug%20die,Millionen%20Tonnen%20Schlachtgewicht%20(SG))')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'destatis.de',
        path:
            '/DE/Presse/Pressemitteilungen/Grafiken/Aussenhandel/2021/_Statisch/20210601-zdw-infografik-pflanzendrinks.png?__blob=poster')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'books.google.de',
        path:
            '/books?hl=de&lr=&id=cW9aBAAAQBAJ&oi=fnd&pg=PA13&dq=blue+zones+diet&ots=1zrkBxZOgZ&sig=7UHVgdfdL592-rbgK47uuZAwHP4#v=onepage&q=blue%20zones%20diet&f=false')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'books.google.de',
        path:
            '/books?hl=de&lr=&id=cW9aBAAAQBAJ&oi=fnd&pg=PA13&dq=blue+zones+diet&ots=1zrkBxZOgZ&sig=7UHVgdfdL592-rbgK47uuZAwHP4#v=onepage&q=blue%20zones%20diet&f=false')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'science.org',
        path: '/doi/abs/10.1126/science.aaq0216'),
    Uri(
        scheme: 'https',
        host: 'nature.com',
        path: '/articles/s43016-021-00225-9')
  ],
  [Uri(scheme: 'https', host: 'doi.org', path: '/10.1007/s10584-014-1169-1')],
  [
    Uri(
        scheme: 'https',
        host: 'doi.org',
        path: '/10.1016/j.jclepro.2017.05.041')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'de.statista.com',
        path:
            '/statistik/daten/studie/381076/umfrage/anzahl-veganer-gastronomiebetriebe-in-deutschland/')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'statista.com',
        path:
            '/infografik/23002/anzahl-der-veganen-restaurants-in-deutschland/')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'focus.de',
        path:
            '/gesundheit/ernaehrung/ralf-moeller-darum-lebe-ich-vegan_id_10849655.html')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'peta.org',
        path: '/features/natalie-portman-vegan-quotes/')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'vegnews.com',
        path:
            '/2020/10/joaquin-phoenix-on-veganism-the-environment-and-social-justice-a-vegnews-exclusive-interview')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'ratgeber.bunte.de',
        path:
            '/billie-eilish-lebt-vegan-das-sind-ihre-gruende-und-ernaehrungstipps_142530#:~:text=Billie%20Eilish%20ist%20%C3%BCberzeugte%20Veganerin,viel%20der%20S%C3%A4ngerin%20nicht%20schwer')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'gala.de',
        path:
            '/lifestyle/food/till-lindemann-isst-pflanzenburger--vom-fleischliebhaber-zum-veganer--22377380.html')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'spiegel.de',
        path:
            '/wirtschaft/service/fleisch-fleischverzehr-in-deutschland-sinkt-auf-rekordtief-a-93759dc4-80e8-4935-b17a-e284693f6eda'),
    Uri(
        scheme: 'https',
        host: 'ble.de',
        path:
            '/SharedDocs/Pressemitteilungen/DE/2022/220502_Milchmarkt_2021.html')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'spiegel.de',
        path:
            '/wirtschaft/service/fleisch-fleischverzehr-in-deutschland-sinkt-auf-rekordtief-a-93759dc4-80e8-4935-b17a-e284693f6eda, https://www.bmel-statistik.de/ernaehrung-fischerei/versorgungsbilanzen/fleisch')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'link.springer.com',
        path: '/article/10.1007/s10584-014-1169-1/tables/3')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'link.springer.com',
        path: '/article/10.1007/s10584-014-1169-1/tables/3')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'dietitianonadietdotcom.files.wordpress.com',
        path: '/2017/11/healthy-eating-for-vegans.pdf')
  ],
  [
    Uri(scheme: 'https', host: 'eatforhealth.gov.au', path: '/guidelines'),
    Uri(
        scheme: 'https',
        host: 'dietaryguidelines.gov',
        path:
            '/sites/default/files/2020-12/Dietary_Guidelines_for_Americans_2020-2025.pdf')
  ],
  [],
  [
    Uri(
        scheme: 'https',
        host: 'dge.de',
        path:
            '/wissenschaft/weitere-publikationen/dge-position/vegane-ernaehrung/?L=0')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'researchgate.net',
        path:
            '/publication/315797322_Tiere_masten_und_essen_Die_Fabrikation_des_globalen_Fleisch-Komplexes/figures?lo=1')
  ],
  [Uri(scheme: 'https', host: 'ipcc.ch', path: '/report/ar6/wg1/')],
  [
    Uri(
        scheme: 'https',
        host: 'ncbi.nlm.nih.gov',
        path: '/pmc/articles/PMC7380694/')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'sciencedirect.com',
        path: '/science/article/pii/S0735109717375216?via%3Dihub'),
    Uri(
        scheme: 'https',
        host: 'mdpi.com',
        path: '/2072-6643/9/8/848?post=blogbottomoi')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'tandfonline.com',
        path: '/doi/abs/10.1080/07352689.2012.664979'),
    Uri(
        scheme: 'https',
        host: 'acsjournals.onlinelibrary.wiley.com',
        path:
            '/doi/abs/10.1002/1097-0142(19850815)56:4%3C717::AID-CNCR2820560402%3E3.0.CO;2-4'),
    Uri(
        scheme: 'https',
        host: 'sciencedirect.com',
        path: '/science/article/abs/pii/089158499290010E'),
    Uri(
        scheme: 'https',
        host: 'tandfonline.com',
        path: '/doi/abs/10.1080/01635589309514232')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'jamanetwork.com',
        path: '/journals/jamainternalmedicine/article-abstract/411256'),
    Uri(
        scheme: 'https',
        host: 'aacrjournals.org',
        path:
            '/cebp/article/13/9/1509/168674/Red-Meat-Chicken-and-Fish-Consumption-and-Risk-of'),
    Uri(
        scheme: 'https',
        host: 'academic.oup.com',
        path: '/ajcn/article/100/suppl_1/386S/4576503?login=false'),
    Uri(
        scheme: 'https',
        host: 'hsph.harvard.edu',
        path:
            '/nutritionsource/2015/11/03/report-says-eating-processed-meat-is-carcinogenic-understanding-the-findings/')
  ],
  [Uri(scheme: 'https', host: 'fdc.nal.usda.gov', path: '/error.html')],
  [Uri(scheme: 'https', host: 'swissveg.ch', path: '/B12?language=de')],
  [
    Uri(
        scheme: 'https',
        host: 'sciencedirect.com',
        path: '/science/article/abs/pii/S0308814618313153'),
    Uri(
        scheme: 'https',
        host: 'sciencedirect.com',
        path: '/science/article/pii/S2666154321001678')
  ],
  [
    Uri(
        scheme: 'https',
        host: 'science.org',
        path: '/doi/abs/10.1126/science.aaq0216')
  ],
  [],
  [],
  [],
  [
    Uri(
        scheme: 'https',
        host: 'science.org',
        path: '/doi/10.1126/science.aaq0216'),
    Uri(
        scheme: 'https',
        host: 'science.org',
        path: '/doi/10.1126/science.aaw9908')
  ],
  [],
];
