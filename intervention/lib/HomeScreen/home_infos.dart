import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class HomeInfo {
  final int id;
  final String title, imageAsset;
  final String description;
  final String articleText;
  final List<Uri> sourceUrls;

  const HomeInfo(this.id, this.title, this.description, this.articleText, this.imageAsset, this.sourceUrls);
}

Map<String, StyledTextTag> tags = {'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold))};

List<List<HomeInfo>> homeInfos = [
  [
  HomeInfo(0, '', ('Eine pflanzliche oder pflanzenbasierte Ernährung ist gleichbedeutend mit einer veganen Ernährung. D.h. es wird vollständig auf tierische Lebensmittel verzichtet, wobei bei einer vegetarischen Ernährung lediglich auf Fleisch und i.d.R. Fisch verzichtet wird.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Pflanzendrinks verursachen nur ein Drittel der Kohlenstoffemissionen von Kuhmilch. Durch den Zusatz von Kalzium in vielen Pflanzendrinks stellen sie eine vollwertige Alternative zur Kuhmilch dar. Probiere sie doch mal aus!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Immer mehr Menschen bezeichnen sich als Flexitarier, d.h. sie essen zwar Fleisch machen es aber nicht zum Mittelpunkt ihrer Ernährung. '), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Rindfleisch verursacht acht Mal so viel Kohlenstoffemissionen wie andere Fleischsorten!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Du isst gerne Spaghetti Bolognese? Ersetze das Hackfleisch einfach mit pflanzlichem Hack, Linsen oder Räuchertofu und spare bis zu 3,5 kg CO₂ ein!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Eine umweltfreundliche Ernährung muss nicht vegetarisch oder rein pflanzlich sein. Die Reduktion einzelner tierischer Lebensmittel, insbesondere Fleisch, kann deinen CO₂-Fußabdruck erheblich senken – egal ob du einmal die Woche auf Fleisch verzichtest oder jeden Tag!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
   [
  HomeInfo(0, '', ('Eine pflanzenbasierte Ernährung kann Volkskrankheiten wie Bluthochdruck und Herzkreislauferkrankungen vorbeugen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Vergiss nicht dein tägliches Ernährungsprotokoll auszufüllen, um zusehen wie viel CO₂-Emissionen du gestern durch deine Ernährung verursacht hast!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Du hast vorher noch nie versucht deinen Fleischkonsum zu reduzieren? Kein Problem, fang klein an und probiere es aus eine einzelne Fleischmahlzeit zu ersetzen oder ein bestimmtes Lebensmittel wie Hähnchenbrust durch eine pflanzliche Alternative zu ersetzen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
   [
  HomeInfo(0, '', ('Fleisch verbraucht in der Produktion 10 Mal und Fisch sogar 100 Mal so viel Wasser wie pflanzlicher Fleischersatz!'), (''),'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Egal ob auf Brot oder zum Überbacken: passende Käsealternativen findest du in jedem gut sortierten Supermarkt! Probiere sie doch mal aus. Wenn du mehr über Sie erfahren willst, checke den „Zutaten“ Tab bei den Rezepten. '), (''),'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Aller Anfang ist schwer! Fange klein an, indem du die tierischen Lebensmittel ersetzt, auf die du am ehesten verzichten kannst, wie beispielsweise Milch im Müsli oder die Wurst auf dem Brot.'), (''),'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
   [
  HomeInfo(0, '', ('Hast du schon mal probiert Kuhmilch durch Pflanzendrinks zu ersetzen?'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Du isst gerne außer Haus? Deine Lieblingsrestaurants bieten vielleicht auch fleischlose Gerichte an, die du noch nicht probiert hast. Ansonsten findest du hier passende Restaurants.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Warum den Fleischkonsum reduzieren? Weil Fleisch das CO₂-intensivste Lebensmittel ist und damit das Fortschreiten des Klimawandels begünstigt. Als Folge dessen wird es auch für uns zukünftig vermehrte Umweltkatastrophen und Klimawanderung bedeuten, da küstennahe Gebiete bis 2050 aufgrund des steigenden Meeresspiegels unbewohnbar werden.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
   [
  HomeInfo(0, '', ('Ein Rindfleischburger verbraucht 2530 Liter Wasser, ein pflanzlicher Burger nur 158 Liter!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Du möchtest deinen Konsum tierischer Produkte reduzieren, aber weißt nicht wie? Stöbere doch mal durch unsere Rezepte, um kulinarische Ideen zu sammeln!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Du planst einen Pizza-Abend auf der Couch? Wie gut, dass viele Pizzarias mittlerweile pflanzlichen Käseersatz anbieten, wenn du es mal vegan probieren möchtest.'), ('Heute Lust auf Döner? – Wie wäre es mit einem selbst gemachten frischen Gemüsedöner? Genauso kannst du beim Dönerladen deines Vertrauens Falafel- statt Fleischdöner bestellen!'), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
   [
  HomeInfo(0, '', ('Für 1 kg Rindfleisch sind 15500 Liter Wasser nötig – mit dieser Wassermenge könnte man 1 Jahr lang duschen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Schon gewusst? Gängige Fastfoodketten bieten mittlerweile pflanzliche Burgerpatties an. Diese verursachen nur den Bruchteil an CO2-Emissionen eines Fleischburgers.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Leider verursacht Biofleisch genauso viel und teilweise sogar noch mehr CO₂-Emissionen als Fleisch aus herkömmlicher Produktion. Glücklicherweise gibt es pflanzliche Alternativen, die wesentlich umweltfreundlicher sind.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
   [
  HomeInfo(0, '', ('Für einen Liter Kuhmilch werden 1050 Liter Wasser benötigt, für einen Liter Sojamilch nur 297 Liter!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Beantworte den täglichen Ernährungsfragebogen, um Feedback über deine Ernährung zu bekommen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Mittlerweile ernähren sich rund 8 Millionen Menschen in Deutschland vegetarisch!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
   [
  HomeInfo(0, '', ('Hülsenfrüchte veursachen nur 20% der CO₂-Emissionen von Schweine- und Hühnerfleisch sowie nur rund 2% der Emissionen von Rindfleisch.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Wie wäre es heute mal mit einer Portion Hülsenfrüchten statt einem Stück Fleisch zum Essen? Probiere unser Tofu-Rezept aus!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Pflanzendrinks gibt es in jedem gut sortierten Supermarkt. Da sie nicht gekühlt werden müssen, findest du sie in der Regel im Regal wo die reguläre H-Milch steht.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),

  ],
   [
  HomeInfo(0, '', ('Um deinen CO2-Fußabdruck zu reduzieren lohnt es sich insbesondere auf Rindfleisch zu verzichten!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Probiere heute doch mal eine fleischfreie Mahlzeit in deine Ernährung einzubauen!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Entgegen der Vermutung vieler, kann eine pflanzliche Ernährung wesentlich günstiger als eine mischköstliche sein. Das Teuerste an einer pflanzlichen Ernährung sind die Ersatzprodukte, die mittlerweile allerdings auch in allen Discountern günstig zu erwerben sind. Noch günstiger sind vollwertige Alternativen wie Hülsenfrüchte (Linsen, Kidneybohnen, etc.).'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Starte pflanzlich in den Tag! Statt Kuhmilch kannst du einfach Pflanzendrinks verwenden, egal ob im Müsli oder im Pfannkuchenteig. Die beliebste Alternative ist Sojamilch, die mit 3 g pro 100 Milliliter genauso viel Eiweiß enthält wie Kuhmilch.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Dir fällt es schwer auf Käse zu verzichten? Probiere doch mal pflanzliche Alternativen wie von Bedda, Vio Life oder Simply V aus. Erhältlich in gut sortierten Supermärkten.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Viele Stars wie bspw. Beyoncé, Zac Efron, Ariana Grande und Joaquin Phoenix ernähren sich rein pflanzlich!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Feste fleischfreie Tage einzuplanen hilft vielen, ihren Fleischkonsum zu reduzieren. Probiere es doch auch mal aus!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Probiere doch mal eines unserer leckeren pflanzlichen Rezepte aus! Im „Rezepte“ Tab findest du kulinarische Vielfalt - von traditionell deutscher Küche bis hin zu asiatischen Köstlichkeiten.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Im "Profil"-Reiter kannst du deine CO₂-Emissionen einsehen, wenn du am Ernährungsprotokoll teilgenommen hast. So kannst du sehen wie viel Emissionen du eingespart hast.'), ('Du isst gerne Wurst auf deinem Brot? Mittlerweile gibt es für alle möglichen Sorten wie Salami, Teewurst und sogar Mett eine pflanzliche Alternative. Diese findest du im Kühlregal jedes gut sortierten Supermarkts. '), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Pflanzendrinks verursachen nur ein Drittel der Kohlenstoffemissionen von Kuhmilch.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Jede fleischfreie Mahlzeit zählt! Du musst dich nicht vegetarisch oder rein pflanzlich ernähren, um etwas zu bewirken!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Warum den Fleischkonsum reduzieren? Weil die Produktion von tierischen Produkten, insbesondere Fleisch, benötigt bis zu 50 Mal mehr Landflächen als der Anbau von pflanzlichen Alternativen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Hast du schon mal versucht spezifische fleischfreie Tag einzuplanen? Versuche es doch mal, um deinen CO₂-Fußabdruck zu reduzieren!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Fleischersatzprodukte findest du mittlerweile bei allen Supermarktketten im Kühlregal! Probiere sie doch mal aus!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Auch viele bekannte Sportler wie Ralf Möller, Arnold Schwarzenegger und Melanie Fraunschiel ernähren sich pflanzlich!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Fleisch aufzugeben fällt dir schwer? Nach Fleisch verursacht Käse die meisten CO2-Emissionen. Wie du Käse ersetzen kannst, lernst du im Zutaten-Tab bei den Rezepten.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Warum den Fleischkonsum reduzieren? Weil der Konsum von rotem und verarbeitetem Fleisch mit der Entstehung von verschiedenen Krebsarten und koronaren Herzerkrankungen in Verbindung gebracht wird.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Im Vergleich zu 2020 ernähren sich mittlerweile doppelt so viele Menschen vegetarisch und vegan.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Auch wenn Fisch im Durchschnitt weniger CO₂-Emissionen verursacht als Fleisch, ist Fisch aufgrund des hohen Wasserverbrauchs in der Produktion ebenfalls problematisch.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Plane fleischlose Mahlzeiten am besten im Voraus, beispielsweise für den nächsten Tag!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Im Reiter "Ziele" kannst du persönliche Ernährungsziele formulieren, damit du dich in deinem Tempo umstellen kannst.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Wenn du mit anderen Menschen zusammenlebst oder du generell gerne mit anderen kochst, frag doch mal, ob sie mit dir zusammen ein vegetarisches oder rein pflanzliches Rezept ausprobieren wollen. Inspiration findest du mit unseren Rezepten!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Mit einer pflanzlichen Ernährung kannst du deine durch die Ernährung verursachten CO₂-Emissionen im Vergleich zur Mischkost halbieren!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Du isst gerne Nutella? Probiere doch mal eine pflanzliche Alternative wie Bionella oder andere pflanzliche Schoko Cremes aus – erhältlich in allen gut sortierten Supermärkten!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Noch keine Dinnerpläne? Wie wäre es mit einem fleischlosen Abendessen. Wenn du selbst kochen willst, probiere doch eines unserer Rezepte aus, ansonsten findest du hier passende Restaurants.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Auch für Joghurt, Skyr, Eiscreme und Co. findest du in jedem gut sortierten Supermarkt pflanzliche Ersatzprodukte! Probiere Sie doch mal aus!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Check den Umwelt-Tab für tägliche Informationen rund um umweltfreundliche Ernährung!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('In den meisten Kantinen und auch beim Bäcker findest du vegetarische und vegane Alternativen, wenn es in der Mittagspause mal schnell gehen muss.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Im Tab Umwelt findest du Informationen zu umweltfreundlicher Ernährung!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Hast du schon probiert Kuhmilch durch Pflanzendrinks zu ersetzen?'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Du kochst gerne für mehrere Tage im Voraus? Probiere doch mal Rezepte wie ein Linsen-Dal oder -Eintopf aus.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Lerne wie du einzelne Zutaten pflanzlich ersetzen kannst im entsprechenden Reiter „Zutaten“ bei den Rezepten!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Durch den Zusatz von Kalzium und Vitamin B12 in vielen Pflanzendrinks und pflanzlichen Joghurtalternativen stellen diese eine vollwertige Alternative zu Kuhmilchprodukten dar. Probiere sie doch mal aus!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Wenn du viel unterwegs bist, könnte es für dich vielleicht Sinn machen, dir etwas Gesundes vorzubereiten und mitzunehmen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Wie wäre es heute mal mit einer Portion Hülsenfrüchten statt einem Stück Fleisch zum Essen? Probiere unser Tofu-Rezept aus!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Immer mehr Menschen bezeichnen sich als Flexitarier, d.h. sie essen zwar Fleisch machen es aber nicht zum Mittelpunkt ihrer Ernährung.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Ein Rindfleischburger verbraucht 2530 Liter Wasser, ein pflanzlicher Burger nur 158 Liter!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Vergiss nicht dein tägliches Ernährungsprotokoll auszufüllen, um zusehen wie viel CO₂-Emissionen du gestern durch deine Ernährung verursacht hast!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Probiere heute doch mal eine fleischfreie Mahlzeit in deine Ernährung einzubauen!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Rindfleisch verursacht acht Mal so viel Kohlenstoffemissionen wie andere Fleischsorten!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Eine umweltfreundliche Ernährung muss nicht vegetarisch oder rein pflanzlich sein. Die Reduktion einzelner tierischer Lebensmittel, insbesondere Fleisch, kann deinen CO₂-Fußabdruck erheblich senken – egal ob du einmal die Woche auf Fleisch verzichtest oder jeden Tag!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Fleischersatzprodukte findest du mittlerweile bei allen Supermarktketten im Kühlregal! Probiere sie doch mal aus!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Du möchtest deinen Konsum tierischer Produkte reduzieren, aber weißt nicht wie? Stöbere doch mal durch unsere Rezepte, um kulinarische Ideen zu sammeln!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Warum den Fleischkonsum reduzieren? Weil Fleisch das CO₂-intensivste Lebensmittel ist und damit das Fortschreiten des Klimawandels begünstigt. Als Folge dessen wird es auch für uns zukünftig vermehrte Umweltkatastrophen und Klimawanderung bedeuten, da küstennahe Gebiete bis 2050 aufgrund des steigenden Wasserspiegels unbewohnbar werden.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Fleischverzicht fällt dir schwer? Fange klein an, indem du die tierischen Lebensmittel ersetzt, auf die du am ehesten verzichten kannst, wie beispielsweise Milch im Müsli oder die Wurst auf dem Brot. '), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Für 1 kg Rindfleisch sind 15500 Liter Wasser nötig – mit dieser Wassermenge könnte man 1 Jahr lang duschen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Beantworte den täglichen Ernährungsfragebogen, um Feedback über deine Ernährung zu bekommen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Eine pflanzenbasierte Ernährung kann Volkskrankheiten wie Bluthochdruck und Herzkreislauferkrankungen vorbeugen. '), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Hast du schon versucht spezifische fleischfreie Tag einzuplanen? Probiere es doch mal!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Mit einer pflanzlichen Ernährung kannst du deine durch die Ernährung verursachten CO₂-Emissionen im Vergleich zur Mischkost halbieren!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Starte pflanzlich in den Tag! Statt Kuhmilch kannst du einfach Pflanzendrinks verwenden, egal ob im Müsli oder im Pfannkuchenteig. Die beliebste Alternative ist Sojamilch, die mit 3 g pro 100 Milliliter genauso viel Eiweiß enthält wie Kuhmilch.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Für einen Liter Kuhmilch werden 1050 Liter Wasser benötigt, für einen Liter Sojamilch nur 297 Liter!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Jede fleischfreie Mahlzeit zählt! Du musst dich nicht vegetarisch oder rein pflanzlich ernähren, um etwas zu bewirken!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Mittlerweile ernähren sich rund 8 Millionen Menschen in Deutschland vegetarisch!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Fleisch aufzugeben fällt dir schwer? Nach Fleisch verursacht Käse die meisten CO₂-Emissionen. Wie du Käse ersetzen kannst, lernst du im Zutaten-Tab bei den Rezepten.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Warum den Fleischkonsum reduzieren? Weil die Produktion von tierischen Produkten, insbesondere Fleisch, benötigt bis zu 50 Mal mehr Landflächen als der Anbau von pflanzlichen Alternativen.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Entgegen der Vermutung vieler, kann eine pflanzliche Ernährung wesentlich günstiger als eine mischköstliche sein. Das Teuerste an einer pflanzlichen Ernährung sind die Ersatzprodukte, die mittlerweile allerdings auch in allen Discountern günstig zu erwerben sind. Noch günstiger sind vollwertige Alternativen wie Hülsenfrüchte (Linsen, Kidneybohnen, etc.).'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Um deinen CO₂-Fußabdruck zu reduzieren lohnt es sich insbesondere auf Rindfleisch zu verzichten!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Dir fällt es schwer auf Käse zu verzichten? Probiere doch mal pflanzliche Alternativen wie von Bedda, Vio Life oder Simply V aus. Erhältlich in gut sortierten Supermärkten.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Viele Stars wie bspw. Beyoncé, Zac Efron, Ariana Grande und Joaquin Phoenix ernähren sich rein pflanzlich!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
  [
  HomeInfo(0, '', ('Noch keine Dinnerpläne? Wie wäre es mit einem fleischlosen Abendessen. Wenn du selbst kochen willst probiere doch eines unserer Rezepte aus, ansonsten findest du hier passende Restaurants.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Check den Umwelt-Tab für tägliche Informationen rund um umweltfreundliche Ernährung!'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  HomeInfo(0, '', ('Im Vergleich zu 2020 ernähren sich mittlerweile doppelt so viele Menschen vegetarisch und vegan.'), (''), 'assets/image.png', [Uri(scheme: 'https', host: 'google.com', path: '')]),
  ],
];