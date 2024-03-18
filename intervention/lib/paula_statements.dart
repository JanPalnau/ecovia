import 'package:flutter/material.dart';

class PaulaStatement {
  final int? id;
  final String? statement;

  PaulaStatement({this.id, this.statement});
}



List<PaulaStatement> paulaStatementsInitial = [
  PaulaStatement(id: 1, statement: "Hey, mein Name ist Lea und ich helfe dir, dich nachhaltiger zu ernähren. Tipp mich doch mal an! 🐣 "),
  PaulaStatement(id: 2, statement: "Siehst du wie schön grün meine Wiese ist? Leider könnte sich das zukünftig ändern..."),
  PaulaStatement(id: 3, statement: "Denn bedroht der Klimawandel unseren gesamten Planeten - mein Zuhause eingeschlossen."),
  PaulaStatement(id: 4, statement: "Jüngsten Schätzungen zufolge, haben wir nur noch 14 Jahre um die schlimmsten Folgen des Klimawandels zu verhindern (IPCC, 2021)."),
  PaulaStatement(id: 5, statement: "Glücklicherweise können wir unseren CO₂-Fußabdruck durch unser Verhalten positiv beeinflussen."),
  PaulaStatement(id: 6, statement: "Dazu zählt u.A. auch unsere Ernährung, weshalb ich dir bei der Umstellung auf eine umweltfreundlichere Ernährungsweise helfen möchte. 😊"),
  PaulaStatement(id: 7, statement: "CO₂-intensiv ist hier vorallem der Konsum von Fleisch und anderen tierischen Produkten."),
  PaulaStatement(id: 8, statement: "Außerdem kann die ansteigende Nutztierhaltung die globale Lebensmittelversorgung langfristig gefährden."),
  //PaulaStatement(id: 8, statement: "Gleichzeitig stellen auch pflanzliche Lebensmittel, die in der Produktion viel Wasser verbrauchen oder importiert werden müssen, ein Problem für die Umwelt dar."),
  PaulaStatement(id: 9, statement: "Da fragt man sich schnell was man denn jetzt essen soll."),
  PaulaStatement(id: 10, statement: "Aber keine Sorge, dafür bin ich ja hier, um dich zu unterstützen."),
  PaulaStatement(id: 11, statement: "Dazu gebe ich dir täglich neue Tipps und Informationen rund um das Thema nachhaltige Ernährung und versuche dich zu motivieren!"),
  PaulaStatement(id: 12, statement: "Natürlich zeige ich dir auch leckere Rezepte oder schlage dir passende Restaurants und Lieferdienste vor."),
  PaulaStatement(id: 13, statement: "Öffne deshalb am besten direkt jeden Morgen die App. Ich erinnere dich aber auch per Push-Benachrichtigung im Verlauf des Tages! 😎",),
];


Widget getTextWidgets(List<String> paulaStrings) {
  return Row(children: paulaStrings.map((item) => Text(item)).toList());
}

// class PaulaStatementsFinished {
//   final int? id;
//   bool? finished;
//   final String? name;

//   PaulaStatementsFinished({this.id, this.finished, this.name});
// }

// List<PaulaStatementsFinished> paulaStatementsFinished = [
//   PaulaStatementsFinished(id: 1, finished: false, name: "paulaStatementsInitial")
// ];
   

