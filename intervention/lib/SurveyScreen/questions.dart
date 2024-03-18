class DietQuestion {
  final int? id;
  final String? question;
  final double? portionConversion;
  final double? emissionMultiplier;
  final double? landUse;
  final String? name;
  final List<LikertScale>? scale;
  final bool? backButtonVisible;
  final String? imgSrc;

  DietQuestion(
      {this.id,
      this.name,
      this.question,
      this.portionConversion,
      this.emissionMultiplier,
      this.landUse,
      this.scale,
      this.backButtonVisible,
      this.imgSrc});
}

//Sources: https://sci-hub.hkvisa.net/10.1016/j.jclepro.2017.05.041 original source not found yet
List<DietQuestion> dietQuestions = [
  DietQuestion(
    id: 1,
    name: 'tea',
    scale: answerOptionsTea,
    backButtonVisible: false,
    imgSrc: 'assets/portion_images/coffee_portion.png',
    question:
        "Wie viel Tee, Kaffee oder Kakao haben Sie gestern getrunken? (Bsp.: schwarzer Kaffee, Kräutertee, heißer Kakao)",
    portionConversion: 111.11111111,
    emissionMultiplier: 5.3,
    landUse: 0,
  ),
  DietQuestion(
    id: 2,
    name: 'freeDrinks',
    scale: answerOptionsGlasses,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/softdrink_portion.png',
    question:
        "Wie viele alkoholfreie Getränke (bspw. Fruchtsaft, Energy-Drinks, Softdrinks) haben Sie gestern getrunken?",
    portionConversion: 5,
    emissionMultiplier: 0.5,
    landUse: 0.2,
  ),
  DietQuestion(
    id: 3,
    name: 'alcDrinks',
    scale: answerOptionsAlcDrinks,
    backButtonVisible: true,
    imgSrc: '',
    question:
        "Wie viele alkoholische Getränke haben Sie gestern getrunken? (Portion = 150 ml Wein/1 Schnapsglas/ 0,33 l Flasche Bier)",
    portionConversion: 6,
    emissionMultiplier: 1,
    landUse: 0,
  ),
  DietQuestion(
    id: 4,
    name: 'animalMilk',
    scale: answerOptionsGlasses,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/milk_portion.png',
    question:
        "Wie viel tierische Milch (bspw. Kuhmilch) haben Sie gestern getrunken? (Bsp.: Glas Milch, im Kaffee, im Müsli)",
    portionConversion: 5,
    emissionMultiplier: 1.34,
    landUse: 0.5,
  ),
  DietQuestion(
    id: 5,
    name: 'plantMilk',
    scale: answerOptionsGlasses,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/milk_portion.png',
    question:
        "Wie viel pflanzliche Milch (bspw. Hafermilch) haben Sie gestern getrunken? (Bsp.: Glas Milch, im Kaffee, im Müsli)",
    portionConversion: 5,
    emissionMultiplier: 0.325,
    landUse: 0.25,
  ),
  DietQuestion(
    id: 6,
    name: 'fruits',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: '',
    question: "Wie viel Obst haben Sie gestern gegessen? (roh, gegart)",
    portionConversion: 8,
    emissionMultiplier: 0.4875,
    landUse: 0.1,
  ),
  DietQuestion(
    id: 7,
    name: 'vegetables',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/veggie_portion.png',
    question: "Wie viel Gemüse haben Sie gestern gegessen? (roh, gegart)",
    portionConversion: 8,
    emissionMultiplier: 0.486,
    landUse: 0.1,
  ),
  DietQuestion(
    id: 8,
    name: 'bread',
    scale: answerOptionsBread,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/bread_portion.png',
    question:
        "Wie viel Brot oder Brötchen haben Sie gestern gegessen? (Bsp.: Vollkornbrot, Laugenbrötchen)",
    portionConversion: 20,
    emissionMultiplier: 0.6333333,
    landUse: 0.3,
  ),
  DietQuestion(
    id: 9,
    name: 'butter',
    scale: answerOptionsTeaspoon,
    backButtonVisible: true,
    imgSrc: '',
    question: "Wie viel Butter haben Sie gestern gegessen?",
    portionConversion: 166.6666666666667,
    emissionMultiplier: 9.75,
    landUse: 3,
  ),
  DietQuestion(
    id: 10,
    name: 'margarine',
    scale: answerOptionsTeaspoon,
    backButtonVisible: true,
    imgSrc: '',
    question:
        "Wie viel pflanzliche Margarine oder pflanzliche Butteralternative haben Sie gestern gegessen?",
    portionConversion: 166.6666666666667,
    emissionMultiplier: 2.333333333333333,
    landUse: 0.9,
  ),
  DietQuestion(
    id: 11,
    name: 'eggs',
    scale: answerOptionsEggs,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/eggs_portion.png',
    question:
        "Wie viele Eier haben Sie gestern gegessen? (Bsp.: gekocht, als Rühr-, Spiegelei)",
    portionConversion: 18.181818181818182,
    emissionMultiplier: 3.0,
    landUse: 3,
  ),
  DietQuestion(
    id: 12,
    name: 'animalCheese',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/cheese_portion.png',
    question:
        "Wie viel Käse (Hart-, Weich-, Schnitt- und Frischkäse aus tierischer Milch) haben Sie gestern gegessen? (Portionsgrößen siehe Bilder)",
    portionConversion: 40,
    emissionMultiplier: 5.7,
    landUse: 1.5,
  ),
  DietQuestion(
    id: 13,
    name: 'plantCheese',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/cheese_portion.png',
    question:
        "Wie viel pflanzliche Käsealternativen (für Hart-, Weich-, Schnitt- und Frischkäse) haben Sie gestern gegessen? (Portionsgrößen siehe Bilder)",
    portionConversion: 40,
    emissionMultiplier: 2.0,
    landUse: 0,
  ),
  DietQuestion(
    id: 14,
    name: 'animalJogurt',
    scale: answerOptionsJar,
    backButtonVisible: true,
    imgSrc: '',
    question:
        "Wie viel Joghurt, Quark oder Dickmilch (aus tierischer Milch) haben Sie gestern gegessen?",
    portionConversion: 5,
    emissionMultiplier: 2.51666666666,
    landUse: 0,
  ),
  DietQuestion(
    id: 15,
    name: 'plantJogurt',
    scale: answerOptionsJar,
    backButtonVisible: true,
    imgSrc: '',
    question:
        "Wie viel pflanzliche Alternativen für Joghurt, Quark oder Dickmilch haben Sie gestern gegessen?",
    portionConversion: 5,
    emissionMultiplier: 0.65,
    landUse: 0.3,
  ),
  DietQuestion(
    id: 16,
    name: 'spread',
    scale: answerOptionsTeaspoonTwo,
    backButtonVisible: true,
    imgSrc: '',
    question:
        "Wie viel Brotaufstrich haben Sie gestern gegessen? (Bsp.: Marmelade, Honig, Erdnussbutter, vegetarischer Brotaufstrich)",
    portionConversion: 50,
    emissionMultiplier: 2.0,
    landUse: 0,
  ),
  DietQuestion(
    id: 17,
    name: 'potatoes',
    scale: answerOptionsPotatoes,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/frenchfries_portion.png',
    question:
        "Wie viel Kartoffeln haben Sie gestern gegessen? (Bsp.: Pommes Frites, gekochte oder gebackene Kartoffeln)",
    portionConversion: 5,
    emissionMultiplier: 0.275,
    landUse: 0.1,
  ),
  DietQuestion(
    id: 18, question: "Wie viel Reis haben Sie gestern gegessen",
    name: 'rice',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/rice_portion.png',
    portionConversion: 13.33333333333,
    emissionMultiplier: 3.1, //60 Gramm oder Teller Reis (Foto)
    landUse: 0.7,
  ),
  DietQuestion(
    id: 19,
    name: 'pasta',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/pasta_portion.png',
    question:
        "Wie viel Nudeln und andere Kohlenhydratquellen (Bulgur, Couscous, Hirse, Quinoa, Amaranth etc.) haben Sie gestern gegessen",
    portionConversion: 13.33333333333,
    emissionMultiplier: 0.7,
    landUse: 0.4,
  ),
  DietQuestion(
    id: 20,
    name: 'legumes',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: '',
    question: "Wie viel Hülsenfrüchte haben Sie gestern gegessen?",
    portionConversion: 4.16666666666667,
    emissionMultiplier: 1.4333333333333,
    landUse: 0,
  ),
  DietQuestion(
    id: 21,
    name: 'nuts',
    scale: answerOptionsTablespoon,
    backButtonVisible: true,
    imgSrc: '',
    question: "Wie viel Nüsse oder Samen haben Sie gestern gegessen?",
    portionConversion: 80,
    emissionMultiplier: 1.15,
    landUse: 0.5,
  ),
  DietQuestion(
    id: 22,
    name: 'pork',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/meat_portion.png',
    question:
        "Wie viel Schweinefleisch haben Sie gestern gegessen? (Bsp.: Schnitzel, Schweinehack)",
    portionConversion: 6.66666666667, //150 gramm
    emissionMultiplier: 4.6,
    landUse: 0,
  ),
  DietQuestion(
    id: 23,
    name: 'beef',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/meat_portion.png',
    question:
        "Wie viel Rindfleisch oder Wildfleisch haben Sie gestern gegessen? (Bsp.: Steak, Rinderhack)",
    portionConversion: 6.66666666667,
    emissionMultiplier: 13.6,
    landUse: 6,
  ),
  DietQuestion(
    id: 24,
    name: 'poultry',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/poultry_portion.png',
    question:
        "Wie viel Geflügelfleisch haben Sie gestern gegessen? (Bsp.: Hähnchenbrust, Chicken Nuggets)",
    portionConversion: 6.66666666667,
    emissionMultiplier: 5.5,
    landUse: 4,
  ),
  DietQuestion(
    id: 25,
    name: 'sausages',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: '',
    question: "Wie viel Bratwurst oder Currywurst haben Sie gestern gegessen?",
    portionConversion: 10, // 1 Stück = 100 Gramm
    emissionMultiplier: 2.9,
    landUse: 4,
  ),
  DietQuestion(
    id: 26,
    name: 'animalDeli',
    scale: answerOptionsSlices,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/deli_portion.png',
    question:
        "Wie viel Wurst und Schinken (Bsp.: Salami, Leberwurst, Hähnchenaufschnitt) haben Sie gestern gegessen?",
    portionConversion: 40,
    emissionMultiplier: 5.4,
    landUse: 4,
  ),
  DietQuestion(
    id: 27,
    name: 'plantDeli',
    scale: answerOptionsSlices,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/deli_portion.png',
    question:
        "Wie viel pflanzliche Wurstalternativen (bspw. für Salami, Leberwurst) haben Sie gestern gegessen?",
    portionConversion: 40,
    emissionMultiplier: 1.7,
    landUse: 0,
  ),
  DietQuestion(
    id: 28,
    name: 'fish',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: '',
    question:
        "Wie viel Fisch haben Sie gestern gegessen? (Bsp.: Fischfilet, geräucherter Lachs",
    portionConversion: 40,
    emissionMultiplier: 1.7,
  ),
  DietQuestion(
    id: 29,
    name: 'tofu',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: '',
    question: "Wie viel Tofu, Tempeh haben Sie gestern gegessen?",
    portionConversion: 6.66666666667, // 150g
    emissionMultiplier: 0.85,
    landUse: 0.5,
  ),
  DietQuestion(
    id: 30,
    name: 'meatSubstitutes',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: '',
    question:
        "Wie viel Fleisch- und Fischersatzprodukte (bspw. pflanzliche Burger, Hack, Schnitzel, Fischstäbchen, Seitan) haben Sie gestern gegessen? (NICHT gemeint: Wurstalternativen)",
    portionConversion: 6.66666666667,
    emissionMultiplier: 1.775,
    landUse: 2,
  ),
  //DietQuestion(
  //  id: 31,
  // question: "Wie viel Kuchen oder süße Backwaren haben Sie gestern gegessen?",
  //portionConversion: 0,
  //emissionMultiplier: 0,
  //landUse: 0,
  //),
  //DietQuestion(
  //id: 32, question: "Wie viele Süßigkeiten (bspw. 1 Tafel Schokolade) haben Sie gestern gegessen?",
  //portionConversion: 10,
  //emissionMultiplier: 4.1,
  //landUse: 0,
  //),
  DietQuestion(
    id: 31,
    name: 'cereal',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: '',
    question: "Wie viel Frühstückscerealien haben Sie gestern gegessen?",
    portionConversion: 12.5, //80 Gramm
    emissionMultiplier: 0.6,
    landUse: 0.3,
  ),
  DietQuestion(
    id: 32,
    name: 'saltySnacks',
    scale: answerOptionsPortions,
    backButtonVisible: true,
    imgSrc: 'assets/portion_images/saltysnacks_portion.png',
    question:
        "Wie viele salzige Snacks (bspw. Chips) haben Sie gestern gegessen? (NICHT gemeint: Nüsse)",
    portionConversion:
        16.66666666667, //60 Gramm (vgl. Umfrage Vebraucherzentrale)
    emissionMultiplier: 1.1,
    landUse: 0.67,
  ),
  DietQuestion(
      id: 33,
      name: 'animalCream',
      scale: answerOptionsCream,
      backButtonVisible: true,
      imgSrc: '',
      question:
          "Wie viel Sahne, Schmand oder Crème fraîche (aus tierischer Milch) haben Sie gestern gegessen?",
      portionConversion: 33.33333333,
      emissionMultiplier: 4.75,
      landUse: 1.5 // Milch mal 3,
      ),
  DietQuestion(
    id: 34,
    name: 'plantCream',
    scale: answerOptionsCream,
    backButtonVisible: true,
    imgSrc: '',
    question:
        "Wie viel pflanzliche Sahne- oder Schmand-Alternative (bspw. Hafer-Cuisine, Crème Vega) haben Sie gestern gegessen?",
    portionConversion: 33.3333333333,
    emissionMultiplier: 0.6,
    landUse: 0.3,
  ),
];

class BasicQuestion {
  final int? id;
  final String? question;
  final String? name;

  BasicQuestion({this.id, this.question, this.name});
}

class BasicQuestionnaire {
  final int? id;
  final List<BasicQuestion>? questions;
  final List<LikertScale>? scale;

  BasicQuestionnaire({this.id, this.questions, this.scale});
}

List<BasicQuestionnaire> questionnaires = [
  BasicQuestionnaire(
      id: 0, questions: bigFiveQuestions, scale: answerOptionsFivePoints),
  BasicQuestionnaire(
      id: 1, questions: darkTriadQuestions, scale: answerOptionsFivePoints),
  BasicQuestionnaire(
      id: 2,
      questions: environmentalismQuestions,
      scale: answerOptionsFivePoints),
  BasicQuestionnaire(
      id: 3, questions: foodNeophobiaQuestions, scale: answerOptionsFivePoints),
  BasicQuestionnaire(
      id: 4,
      questions: meatAttachmentQuestions,
      scale: answerOptionsFivePoints),
  BasicQuestionnaire(
      id: 5,
      questions: foodConsumptionOrientationQuestions,
      scale: answerOptionsFivePoints),
  BasicQuestionnaire(
      id: 6, questions: selfEfficacyQuestions, scale: answerOptionsFivePoints),
  BasicQuestionnaire(
    id: 7, questions: willingnessQuestions, scale: answerOptionsFivePoints
  )
];

List<BasicQuestion> bigFiveQuestions = [
  BasicQuestion(id: 0, question: "Ich bin eher ruhig.", name: "extra_1"),
  BasicQuestion(
      id: 1, question: "Ich bin einfühlsam, warmherzig.", name: "agree_1"),
  BasicQuestion(id: 2, question: "Ich bin eher unordentlich.", name: "con_1"),
  BasicQuestion(id: 3, question: "Ich mache mir oft Sorgen.", name: "neuro_1"),
  BasicQuestion(
      id: 4,
      question: "Ich kann mich für Kunst, Musik und Literatur begeistern.",
      name: "open_1"),
  BasicQuestion(
      id: 5,
      question: "Ich neige dazu, die Führung zu übernehmen.",
      name: "extra_2"),
  BasicQuestion(
      id: 6,
      question: "Ich bin manchmal unhöflich und schroff.",
      name: "agree_2"),
  BasicQuestion(
      id: 7,
      question: "Ich neige dazu, Aufgaben vor mir herzuschieben.",
      name: "con_2"),
  BasicQuestion(
      id: 8,
      question: "Ich bin oft deprimiert, niedergeschlagen.",
      name: "neuro_2"),
  BasicQuestion(
      id: 9,
      question: "Mich interessieren abstrakte Überlegungen wenig.",
      name: "open_2"),
  BasicQuestion(
      id: 10,
      question: "Ich bin voller Energie und Tatendrang.",
      name: "extra_3"),
  BasicQuestion(
      id: 11,
      question:
          "Ich schenke anderen leicht Vertrauen, glaube an das Gute im Menschen",
      name: "agree_3"),
  BasicQuestion(
      id: 12,
      question: "Ich bin verlässlich, auf mich kann man zählen.",
      name: "con_3"),
  BasicQuestion(
      id: 13,
      question: "Ich bin ausgeglichen, nicht leicht aus der Ruhe zu bringen.",
      name: "neuro_3"),
  BasicQuestion(
      id: 14,
      question: "Ich bin originell, entwickle neue Ideen.",
      name: "open_3"),
  BasicQuestion(
      id: 15,
      question: "Ich gehe aus mir heraus, bin gesellig.",
      name: "extra_4"),
  BasicQuestion(
      id: 16,
      question: "Ich habe mit anderen wenig Mitgefühl.",
      name: "agree_4"),
  BasicQuestion(
      id: 17,
      question: "Ich bin systematisch, halte meine Sachen in Ordnung.",
      name: "con_4"),
  BasicQuestion(
      id: 18,
      question: "Ich bleibe auch in stressigen Situationen gelassen.",
      name: "neuro_4"),
  BasicQuestion(
      id: 19,
      question: "Ich bin nicht sonderlich kunstinteressiert.",
      name: "open_4"),
  BasicQuestion(
      id: 20,
      question:
          "In einer Gruppe überlasse ich lieber anderen die Entscheidung.",
      name: "extra_5"),
  BasicQuestion(
      id: 21, question: "Ich begegne anderen mit Respekt.", name: "agree_5"),
  BasicQuestion(
      id: 22,
      question: "Ich bleibe an einer Aufgabe dran, bis sie erledigt ist.",
      name: "con_5"),
  BasicQuestion(
      id: 23,
      question: "Ich bin selbstsicher, mit mir zufrieden.",
      name: "neuro_5"),
  BasicQuestion(
      id: 24,
      question:
          "Es macht mir Spaß, gründlich über komplexe Dinge nachzudenken und sie zu verstehen.",
      name: "open_5"),
  BasicQuestion(
      id: 25,
      question: "Ich bin weniger aktiv und unternehmungslustig als andere. ",
      name: "extra_6"),
  BasicQuestion(
      id: 26,
      question: "Ich neige dazu, andere zu kritisieren.",
      name: "agree_6"),
  BasicQuestion(
      id: 27, question: "Ich bin manchmal ziemlich nachlässig.", name: "con_6"),
  BasicQuestion(
      id: 28,
      question: "Ich kann launisch sein, habe schwankende Stimmungen.",
      name: "neuro_6"),
  BasicQuestion(
      id: 29,
      question: "Ich bin nicht besonders einfallsreich.",
      name: "open_6"),
];

List<BasicQuestion> sociodemographicQuestions = [
    BasicQuestion(
        id: 1, question: 'Welchem Geschlecht fühlen Sie sich zugehörig?',
        name: 'gender'),
    BasicQuestion(
        id: 2, question: 'Bitte geben Sie Ihren höchsten Bildungsabschluss an.',
        name: 'education')
  ];

List<BasicQuestion> darkTriadQuestions = [
  BasicQuestion(
      id: 0,
      question: "Es ist nicht ratsam, seine Geheimnisse preiszugeben.",
      name: "mach_1"),
  BasicQuestion(
      id: 1,
      question: "Andere sehen mich als natürliche Führungsperson.",
      name: "nar_1"),
  BasicQuestion(
      id: 2,
      question: "Ich mag es, mich an Autoritäten zu rächen.",
      name: "psy_2"),
  BasicQuestion(
      id: 3,
      question:
          "Ich setze gerne raffinierte Manipulation ein, um zu kriegen was ich will.",
      name: "mach_2"),
  BasicQuestion(
      id: 4,
      question: "Ich liebe es, im Mittelpunkt zu stehen.",
      name: "nar_2"),
  BasicQuestion(
      id: 5, question: "Ich vermeide gefährliche Situationen.", name: "psy_2"),
  BasicQuestion(
      id: 6,
      question:
          "Man muss wichtige Personen auf seine Seite ziehen, was auch immer es kostet.",
      name: "mach_3"),
  BasicQuestion(
      id: 7,
      question: "Viele Gruppenaktivitäten sind ohne mich lahm.",
      name: "nar_3"),
  BasicQuestion(
      id: 8,
      question: "Eine Racheaktion muss schnell und fies sein.",
      name: "psy_3"),
  BasicQuestion(
      id: 9,
      question:
          "Vermeide direkte Konflikte mit anderen, denn sie könnten in der Zukunft von Nutzen sein.",
      name: "mach_4"),
  BasicQuestion(
      id: 10,
      question:
          "Ich weiß, dass ich etwas Besonderes bin, da mir das jeder sagt.",
      name: "nar_4"),
  BasicQuestion(
      id: 11,
      question: "Menschen sagen oft, dass ich außer Kontrolle bin.",
      name: "psy_4"),
  BasicQuestion(
      id: 12,
      question:
          "Es ist ratsam, Informationen im Hinterkopf zu behalten, die man später gegen bestimmte Personen verwenden kann.",
      name: "mach_5"),
  BasicQuestion(
      id: 13,
      question: "Ich mag es, wichtige Personen kennenzulernen.",
      name: "nar_5"),
  BasicQuestion(
      id: 14, question: "Es stimmt, dass ich gemein sein kann.", name: "psy_5"),
  BasicQuestion(
      id: 15,
      question:
          "Man sollte auf den richtigen Moment warten, um sich an Menschen zu rächen.",
      name: "mach_6"),
  BasicQuestion(
      id: 16,
      question: "Ich werde verlegen, wenn mir jemand Komplimente macht.",
      name: "nar_6"),
  BasicQuestion(
      id: 17,
      question: "Menschen bereuen es jedes Mal, wenn sie sich mit mir anlegen.",
      name: "psy_6"),
  BasicQuestion(
      id: 18,
      question: "Manche Dinge sollte man verbergen, um seinen Ruf zu schützen.",
      name: "mach_7"),
  BasicQuestion(
      id: 19,
      question:
          "Ich bin schon mal mit berühmten Persönlichkeiten verglichen worden.",
      name: "nar_7"),
  BasicQuestion(
      id: 20,
      question: "Ich bin noch nie mit dem Gesetz in Konflikt geraten.",
      name: "psy_7"),
  BasicQuestion(
      id: 21,
      question:
          "Stelle sicher, dass deine Pläne dir und nicht den Anderen nutzen.",
      name: "mach_8"),
  BasicQuestion(
      id: 22,
      question: "Ich bin ein durchschnittlicher Mensch.",
      name: "nar_8"),
  BasicQuestion(
      id: 23,
      question:
          "Ich genieße es, Sex mit Menschen zu haben, die ich kaum kenne.",
      name: "psy_8"),
  BasicQuestion(
      id: 24,
      question: "Die meisten Menschen können manipuliert werden.",
      name: "mach_9"),
  BasicQuestion(
      id: 25,
      question: "Ich bestehe darauf, den Respekt zu erhalten, der mir gebührt.",
      name: "nar_9"),
  BasicQuestion(
      id: 26,
      question: "Ich würde alles sagen, um zu bekommen, was ich will.",
      name: "psy_9"),
];

List<BasicQuestion> environmentalismQuestions = [
  BasicQuestion(
      id: 0,
      question:
          "Wir nähern uns dem Limit der Bevölkerungszahl, die die Erde bewältigen kann.",
      name: "env_1"),
  BasicQuestion(
      id: 1,
      question:
          "Die Menschen haben das Recht ihre natürliche Umwelt zu verändern, um sie an ihre Bedürfnisse anzupassen.",
      name: "env_2"),
  BasicQuestion(
      id: 2,
      question:
          "Wenn die Menschen sich in die Natur einmischen, hat das oft katastrophale Konsequenzen.",
      name: "env_3"),
  BasicQuestion(
      id: 3,
      question:
          "Der menschliche Einfallsreichtum wird dafür sorgen, dass wir die Erde NICHT unbewohnbar machen.",
      name: "env_4"),
  BasicQuestion(
      id: 4,
      question: "Die Menschen missbrauchen die Umwelt schwer.",
      name: "env_5"),
  BasicQuestion(
      id: 5,
      question:
          "Die Erde hat eine Menge natürlicher Ressourcen, wenn wir nur lernen diese zu fördern.",
      name: "env_6"),
  BasicQuestion(
      id: 6,
      question:
          "Pflanzen und Tiere haben das gleiche Recht zu leben wie Menschen.",
      name: "env_7"),
  BasicQuestion(
      id: 7,
      question:
          "Das Gleichgewicht der Natur ist stark genug, um den Einfluss der modernen Industrienationen zu bewältigen.",
      name: "env_8"),
  BasicQuestion(
      id: 8,
      question:
          "Abgesehen von unseren speziellen Fähigkeiten sind wir Menschen immer noch den Naturgesetzen unterworfen.",
      name: "env_9"),
  BasicQuestion(
      id: 9,
      question:
          "Die so genannte “Umweltkrise” mit der die Menschheit konfrontiert ist, wird völlig übertrieben.",
      name: "env_10"),
  BasicQuestion(
      id: 10,
      question:
          "Die Erde ist wie ein Raumschiff mit wenig Platz und wenig Ressourcen.",
      name: "env_11"),
  BasicQuestion(
      id: 11,
      question:
          "Menschen sind dazu geboren, über den Rest der Natur zu herrschen.",
      name: "env_12"),
  BasicQuestion(
      id: 12,
      question:
          "Das Gleichgewicht der Natur ist sehr empfindlich und leicht zu stören.",
      name: "env_13"),
  BasicQuestion(
      id: 13,
      question:
          "Die Menschen werden möglicherweise genug darüber lernen, wie die Natur funktioniert, um sie kontrollieren zu können.",
      name: "env_14"),
  BasicQuestion(
      id: 14,
      question:
          "Wenn die Dinge so weitergehen wie bisher, werden wir bald eine große Umweltkatastrophe erleben.",
      name: "env_15"),
];

List<BasicQuestion> foodNeophobiaQuestions = [
  BasicQuestion(
      id: 0,
      question: "Ich probiere ständig neue und verschiedene Lebensmittel aus.",
      name: "foodNeo_1"),
  BasicQuestion(
      id: 1,
      question: "Ich traue neuen Lebensmitteln nicht.",
      name: "foodNeo_2"),
  BasicQuestion(
      id: 2,
      question:
          "Wenn ich nicht weiss, was in einem Lebensmittel enthalten ist, probiere ich es nicht aus.",
      name: "foodNeo_3"),
  BasicQuestion(
      id: 3,
      question: "Ich mag Essen aus unterschiedlichen Kulturen.",
      name: "foodNeo_4"),
  BasicQuestion(
      id: 4,
      question:
          "Das Essen aus anderen Kulturen sieht eigenartig aus, so dass ich es nicht esse.",
      name: "foodNeo_5"),
  BasicQuestion(
      id: 5,
      question: "An sozialen Anlässen probiere ich neue Speisen aus.",
      name: "foodNeo_6"),
  BasicQuestion(
      id: 6,
      question:
          "Ich fürchte mich davor, Speisen zu essen, die ich nie vorher gegessen habe.",
      name: "foodNeo_7"),
  BasicQuestion(
      id: 7,
      question: "Ich bin sehr wählerisch in Bezug auf Essen.",
      name: "foodNeo_8"),
  BasicQuestion(id: 8, question: "Ich esse fast alles.", name: "foodNeo_9"),
  BasicQuestion(
      id: 9,
      question:
          "Ich gehe gerne an Orte, wo Essen aus anderen Kulturen serviert wird.",
      name: "foodNeo_10"),
];

List<BasicQuestion> meatAttachmentQuestions = [
  BasicQuestion(
      id: 0,
      question: "Fleisch zu essen, ist eine der schönsten Freuden im Leben.",
      name: "meatAttachment_1"),
  BasicQuestion(
      id: 1,
      question: "Fleisch ist unersetzlich in meiner Ernährung.",
      name: "meatAttachment_2"),
  BasicQuestion(
      id: 2,
      question:
          "Aufgrund unserer Position in der Nahrungskette, haben wir das Recht Fleisch zu essen.",
      name: "meatAttachment_3"),
  BasicQuestion(
      id: 3,
      question:
          "Ich habe es schlechtes Gewissen, wenn ich daran denke, Fleisch zu essen.",
      name: "meatAttachment_4"),
  BasicQuestion(
      id: 4,
      question: "Ich liebe Gerichte mit Fleisch.",
      name: "meatAttachment_5"),
  BasicQuestion(
      id: 5,
      question:
          "Fleisch zu essen, ist respektlos gegenüber Lebewesen und der Umwelt.",
      name: "meatAttachment_6"),
  BasicQuestion(
      id: 6,
      question:
          "Fleisch zu essen, ist ein unbestreitbares Recht eines jeden Menschen.",
      name: "meatAttachment_7"),
  BasicQuestion(
      id: 7,
      question: "Ein gutes Steak ist geschmacklich unvergleichlich.",
      name: "meatAttachment_8"),
  BasicQuestion(
      id: 8,
      question: "Ich würde mich mit einer fleischlosen Ernährung wohlfühlen.",
      name: "meatAttachment_9"),
  BasicQuestion(
      id: 9,
      question: "Ich bin ein Fleischliebhaber.",
      name: "meatAttachment_10"),
  BasicQuestion(
      id: 10,
      question: "Wenn ich kein Fleisch essen könnte, würde ich durchdrehen.",
      name: "meatAttachment_11"),
  BasicQuestion(
      id: 11,
      question: "Wenn ich den Fleischkonsum aufgeben müsste, wäre ich traurig.",
      name: "meatAttachment_12"),
  BasicQuestion(
      id: 12,
      question: "Fleisch erinnert mich an Krankheiten.",
      name: "meatAttachment_13"),
  BasicQuestion(
      id: 13,
      question:
          "Fleischessen erinnert mich an das Leiden und Sterben von Tieren.",
      name: "meatAttachment_14"),
  BasicQuestion(
      id: 14,
      question: "Fleischessen ist ein natürlicher und unanfechtbarer Brauch.",
      name: "meatAttachment_15"),
  BasicQuestion(
      id: 15,
      question:
          "Ich kann mir nicht vorstellen, auf regelmäßigen Fleischkonsum zu verzichten.",
      name: "meatAttachment_16"),
];

List<BasicQuestion> foodConsumptionOrientationQuestions = [
  BasicQuestion(id: 0, question: "Ich esse das, was ich esse, ...\nweil ich Appetit darauf habe ", name: "orientApp_1"),
  BasicQuestion(id: 1, question: "Ich esse das, was ich esse, ...\nweil ich es gewohnt bin, das zu essen", name: "orientHabit_1"),
  BasicQuestion(id: 2, question: "Ich esse das, was ich esse, ...\nweil ich mich damit ausgewogen ernähre", name: "orientHealth_1"),
  BasicQuestion(id: 3, question: "Ich esse das, was ich esse, ...\nweil es schnell zuzubereiten ist", name: "orientConv_1"),
  BasicQuestion(id: 4, question: "Ich esse das, was ich esse, ...\num es mir gut gehen zu lassen", name: "orientPl_1"),
  BasicQuestion(id: 5, question: "Ich esse das, was ich esse, ...\nweil es zu bestimmten Situationen dazugehört", name: "orientTrad_1"),
  BasicQuestion(id: 6, question: "Ich esse das, was ich esse, ...\nweil es naturbelassen ist (z.B. nicht gentechnisch verändert)", name: "orientNat_1"),
  BasicQuestion(id: 7, question: "Ich esse das, was ich esse, ...\nweil es gesellig ist", name: "orientSoc_1"),
  BasicQuestion(id: 8, question: "Ich esse das, was ich esse, ...\nweil es preiswert ist", name: "orientPr_1"),
  BasicQuestion(id: 9, question: "Ich esse das, was ich esse, ...\nweil es ansprechend präsentiert wird (z.B. schön verpackt)", name: "orientLook_1"),
  BasicQuestion(id: 10, question: "Ich esse das, was ich esse, ...\nweil es wenig Kalorien enthält", name: "orientWeight_1"),
  BasicQuestion(id: 11, question: "Ich esse das, was ich esse, ...\nweil ich traurig bin", name: "orientAff_1"),
  BasicQuestion(id: 12, question: "Ich esse das, was ich esse, ...\nweil es unhöflich wäre, nicht zu essen", name: "orientNorm_1"),
  BasicQuestion(id: 13, question: "Ich esse das, was ich esse, ...\nweil es ‘in’ ist", name: "orientSoc_1"),
  BasicQuestion(id: 14, question: "Ich esse das, was ich esse, ...\nweil es mir gut schmeckt", name: "orientApp_1"),
  BasicQuestion(id: 15, question: "Ich esse das, was ich esse, ...\nweil ich es üblicherweise esse", name: "orientHabit_1"),
  BasicQuestion(id: 16, question: "Ich esse das, was ich esse, ...\nweil es gesund ist", name: "orientHealth_1"),
  BasicQuestion(id: 17, question: "Ich esse das, was ich esse, ...\nweil es wenig Aufwand bedeutet", name: "orientConv_1"),
  BasicQuestion(id: 18, question: "Ich esse das, was ich esse, ...\nweil ich mir etwas gönnen möchte", name: "orientPl_1"),
  BasicQuestion(id: 19, question: "Ich esse das, was ich esse, ...\naufgrund von Traditionen (z.B. Familientradition, Feste)", name: "orientTrad_1"),
  BasicQuestion(id: 20, question: "Ich esse das, was ich esse, ...\nweil es unbelastet ist (z.B. keine Pestizide, Schadstoffe, Antibiotika)", name: "orientNat_1"),
  BasicQuestion(id: 21, question: "Ich esse das, was ich esse, ...\nweil dabei Zeit mit anderen Menschen verbringen kann", name: "orientSoc_1"),
  BasicQuestion(id: 22, question: "Ich esse das, was ich esse, ...\nweil ich nicht mehr Geld ausgeben möchte", name: "orientPr_1"),
  BasicQuestion(id: 23, question: "Ich esse das, was ich esse, ...\nweil es mich spontan anspricht (z.B. in Augenhöhe platziert, farbliche Gestaltung)", name: "orientLook_1"),
  BasicQuestion(id: 24, question: "Ich esse das, was ich esse, ...\nweil ich mein Gewicht halten möchte", name: "orientWeight_1"),
  BasicQuestion(id: 25, question: "Ich esse das, was ich esse, ...\nweil ich frustriert bin", name: "orientAff_1"),
  BasicQuestion(id: 26, question: "Ich esse das, was ich esse, ...\num jemanden, der mir eine Freude machen will, nicht zu enttäuschen", name: "orientNorm_1"),
  BasicQuestion(id: 27, question: "Ich esse das, was ich esse, ...\nweil ich damit vor anderen gut dastehe", name: "orientSoc_1"),
  BasicQuestion(id: 28, question: "Ich esse das, was ich esse, ...\nweil ich es gerne mag", name: "orientApp_1"),
  BasicQuestion(id: 29, question: "Ich esse das, was ich esse, ...\nweil ich es kenne", name: "orientHabit_1"),
  BasicQuestion(id: 30, question: "Ich esse das, was ich esse, ...\nweil es mich fit hält (z.B. vital, leistungsfähig)", name: "orientHealth_1"),
  BasicQuestion(id: 31, question: "Ich esse das, was ich esse, ...\nweil es einfach zuzubereiten ist", name: "orientConv_1"),
  BasicQuestion(id: 32, question: "Ich esse das, was ich esse, ...\num mich damit für etwas zu belohnen", name: "orientPl_1"),
  BasicQuestion(id: 33, question: "Ich esse das, was ich esse, ...\nweil ich damit aufgewachsen bin", name: "orientTrad_1"),
  BasicQuestion(id: 34, question: "Ich esse das, was ich esse, ...\nweil es aus biologischer Landwirtschaft stammt", name: "orientNat_1"),
  BasicQuestion(id: 35, question: "Ich esse das, was ich esse, ...\nweil es ein Zusammensein gemütlicher macht", name: "orientSoc_1"),
  BasicQuestion(id: 36, question: "Ich esse das, was ich esse, ...\nweil es im Sonderangebot ist", name: "orientPr_1"),
  BasicQuestion(id: 37, question: "Ich esse das, was ich esse, ...\nweil ich es in der Werbung oder im Fernsehen gesehen habe", name: "orientLook_1"),
  BasicQuestion(id: 38, question: "Ich esse das, was ich esse, ...\nweil es wenig Fett enthält", name: "orientWeight_1"),
  BasicQuestion(id: 39, question: "Ich esse das, was ich esse, ...\nweil ich mich einsam fühle", name: "orientAff_1"),
  BasicQuestion(id: 40, question: "Ich esse das, was ich esse, ...\nweil es von mir erwartet wird", name: "orientNorm_1"),
  BasicQuestion(id: 41, question: "Ich esse das, was ich esse, ...\nweil andere es gut finden", name: "orientSoc_1"),
];

List<BasicQuestion> selfEfficacyQuestions = [
  BasicQuestion(id: 0, question: "Mir fehlen die Kochkünste, um fleischfreie Gerichte zuzubereiten.", name: "selfEff_1"),
  BasicQuestion(id: 1, question: "Ich weiß nicht, was ich anstelle von Fleisch essen soll.", name: "selfEff_2"),
  BasicQuestion(id: 2, question: "Ich habe nicht genügend Willenskraft, um kein Fleisch zu essen.", name: "selfEff_3"),
  BasicQuestion(id: 3, question: "Einer empfohlenen Ernährung zu folgen, fällt mir schwer. ", name: "selfEff_4"),
];

List<BasicQuestion> willingnessQuestions = [
  BasicQuestion(id: 0, question: "Ich bin bereit, meinen Fleischkonsum zu reduzieren.", name: 'willing_1'),
  BasicQuestion(id: 1, question: "Ich bin bereit, meinen Konsum tierischer Produkte zu reduzieren.", name: 'willing_2'),
  BasicQuestion(id: 2, question: "Ich bin bereit, mich rein pflanzlich (vegan) zu ernähren.", name: 'willing_3')
];

List<BasicQuestion> totalListQuestions = questionnaires.expand((element) => element.questions!).toList();

class LikertScale {
  final double? id;
  final String? answerOption;

  LikertScale({this.id, this.answerOption});
}

List<LikertScale> answerOptionsGender = [
  LikertScale(id: 0, answerOption: "Weiblich"),
  LikertScale(id: 1, answerOption: "Männlich"),
  LikertScale(id: 2, answerOption: "Divers"),
];
List<LikertScale> answerOptionsEducation = [
  LikertScale(id: 0, answerOption: "Kein Schulabschluss"),
  LikertScale(id: 1, answerOption: "Hauptschulabschluss"),
  LikertScale(id: 2, answerOption: "Realschulabschluss"),
  LikertScale(id: 3, answerOption: "(Fach-)Abitur"),
  LikertScale(id: 4, answerOption: "Bachelor"),
  LikertScale(id: 5, answerOption: "Master"),
  LikertScale(id: 6, answerOption: "Höherer Bildungsabschluss")
];

List<LikertScale> answerOptionsDietType= [
  LikertScale(id: 0, answerOption: "Mischköstlich mit hohem Fleischkonsum (> 100g pro Tag)"),
  LikertScale(id: 1, answerOption: "Mischköstlich mit moderatem Fleischkonsum (50-99g pro Tag)"),
  LikertScale(id: 2, answerOption: "Mischköstlich mit geringem Fleischkonsum (<50g pro Tag)"),
  LikertScale(id: 3, answerOption: "Vegetarisch"),
];

List<LikertScale> answerOptionsFivePoints = [
  LikertScale(id: 0, answerOption: "Stimme überhaupt nicht zu"),
  LikertScale(id: 1, answerOption: "Stimme eher nicht zu"),
  LikertScale(id: 2, answerOption: "Neutral"),
  LikertScale(id: 3, answerOption: "Stimme eher zu"),
  LikertScale(id: 4, answerOption: "Stimme voll und ganz zu")
];

List<LikertScale> answerOptionsTea = [
  LikertScale(id: 0, answerOption: "Gar keinen"),
  LikertScale(id: 1, answerOption: "1/2 Tasse (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Tasse (150 ml)"),
  LikertScale(id: 3, answerOption: "2 Tassen"),
  LikertScale(id: 4, answerOption: "3 Tassen"),
  LikertScale(id: 5, answerOption: "4 Tassen"),
  LikertScale(id: 6, answerOption: "5 Tassen"),
  LikertScale(id: 7, answerOption: "6 Tassen"),
  LikertScale(id: 8, answerOption: "7 Tassen"),
  LikertScale(id: 9, answerOption: "8 Tassen"),
  LikertScale(id: 10, answerOption: "9 Tassen"),
  LikertScale(id: 11, answerOption: "10 Tassen"),
  LikertScale(id: 12, answerOption: "11 Tassen"),
  LikertScale(id: 13, answerOption: "12 Tassen"),
  LikertScale(id: 14, answerOption: "13 Tassen"),
  LikertScale(id: 15, answerOption: "14 Tassen"),
  LikertScale(id: 16, answerOption: "15 Tassen"),
  LikertScale(id: 17, answerOption: "16 Tassen"),
  LikertScale(id: 18, answerOption: "17 Tassen"),
  LikertScale(id: 19, answerOption: "18 Tassen"),
  LikertScale(id: 20, answerOption: "19 Tassen"),
  LikertScale(id: 21, answerOption: "20 Tassen (oder mehr)"),
];

List<LikertScale> answerOptionsAlcDrinks = [
  LikertScale(id: 0, answerOption: "Möchte ich nicht beantworten"),
  LikertScale(id: 1, answerOption: "Gar keine"),
  LikertScale(id: 2, answerOption: "1/2 Getränk (oder weniger)"),
  LikertScale(id: 3, answerOption: "1 Getränk"),
  LikertScale(id: 4, answerOption: "2 Getränke"),
  LikertScale(id: 5, answerOption: "3 Getränke"),
  LikertScale(id: 6, answerOption: "4 Getränke"),
  LikertScale(id: 7, answerOption: "5 Getränke"),
  LikertScale(id: 8, answerOption: "6 Getränke"),
  LikertScale(id: 9, answerOption: "7 Getränke"),
  LikertScale(id: 10, answerOption: "8 Getränke"),
  LikertScale(id: 11, answerOption: "9 Getränke"),
  LikertScale(id: 12, answerOption: "10 Getränke"),
  LikertScale(id: 13, answerOption: "11 Getränke"),
  LikertScale(id: 14, answerOption: "12 Getränke"),
  LikertScale(id: 15, answerOption: "13 Getränke"),
  LikertScale(id: 16, answerOption: "14 Getränke"),
  LikertScale(id: 17, answerOption: "15 Getränke"),
  LikertScale(id: 18, answerOption: "16 Getränke"),
  LikertScale(id: 19, answerOption: "17 Getränke"),
  LikertScale(id: 20, answerOption: "18 Getränke"),
  LikertScale(id: 21, answerOption: "19 Getränke"),
  LikertScale(id: 22, answerOption: "20 Getränke (oder mehr)"),
];

List<LikertScale> answerOptionsDrinks = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Getränk (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Getränk"),
  LikertScale(id: 3, answerOption: "2 Getränke"),
  LikertScale(id: 4, answerOption: "3 Getränke"),
  LikertScale(id: 5, answerOption: "4 Getränke"),
  LikertScale(id: 6, answerOption: "5 Getränke"),
  LikertScale(id: 7, answerOption: "6 Getränke"),
  LikertScale(id: 8, answerOption: "7 Getränke"),
  LikertScale(id: 9, answerOption: "8 Getränke"),
  LikertScale(id: 10, answerOption: "9 Getränke"),
  LikertScale(id: 11, answerOption: "10 Getränke"),
  LikertScale(id: 12, answerOption: "11 Getränke"),
  LikertScale(id: 13, answerOption: "12 Getränke"),
  LikertScale(id: 14, answerOption: "13 Getränke"),
  LikertScale(id: 15, answerOption: "14 Getränke"),
  LikertScale(id: 16, answerOption: "15 Getränke"),
  LikertScale(id: 17, answerOption: "16 Getränke"),
  LikertScale(id: 18, answerOption: "17 Getränke"),
  LikertScale(id: 19, answerOption: "18 Getränke"),
  LikertScale(id: 20, answerOption: "19 Getränke"),
  LikertScale(id: 21, answerOption: "20 Getränke (oder mehr)"),
];

List<LikertScale> answerOptionsGlasses = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Glas (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Glas (200 ml)"),
  LikertScale(id: 3, answerOption: "2 Gläser"),
  LikertScale(id: 4, answerOption: "3 Gläser"),
  LikertScale(id: 5, answerOption: "4 Gläser"),
  LikertScale(id: 6, answerOption: "5 Gläser"),
  LikertScale(id: 7, answerOption: "6 Gläser"),
  LikertScale(id: 8, answerOption: "7 Gläser"),
  LikertScale(id: 9, answerOption: "8 Gläser"),
  LikertScale(id: 10, answerOption: "9 Gläser"),
  LikertScale(id: 11, answerOption: "10 Gläser"),
  LikertScale(id: 12, answerOption: "11 Gläser"),
  LikertScale(id: 13, answerOption: "12 Gläser"),
  LikertScale(id: 14, answerOption: "13 Gläser"),
  LikertScale(id: 15, answerOption: "14 Gläser"),
  LikertScale(id: 16, answerOption: "15 Gläser"),
  LikertScale(id: 17, answerOption: "16 Gläser"),
  LikertScale(id: 18, answerOption: "17 Gläser"),
  LikertScale(id: 19, answerOption: "18 Gläser"),
  LikertScale(id: 20, answerOption: "19 Gläser"),
  LikertScale(id: 21, answerOption: "20 Gläser (oder mehr)"),
];

List<LikertScale> answerOptionsPortions = [
  LikertScale(id: 0, answerOption: "Gar kein/e"),
  LikertScale(id: 1, answerOption: "1/2 Portion (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Portion"),
  LikertScale(id: 3, answerOption: "2 Portionen"),
  LikertScale(id: 4, answerOption: "3 Portionen"),
  LikertScale(id: 5, answerOption: "4 Portionen"),
  LikertScale(id: 6, answerOption: "5 Portionen"),
  LikertScale(id: 7, answerOption: "6 Portionen"),
  LikertScale(id: 8, answerOption: "7 Portionen"),
  LikertScale(id: 9, answerOption: "8 Portionen"),
  LikertScale(id: 10, answerOption: "9 Portionen"),
  LikertScale(id: 11, answerOption: "10 Portionen"),
  LikertScale(id: 12, answerOption: "11 Portionen"),
  LikertScale(id: 13, answerOption: "12 Portionen"),
  LikertScale(id: 14, answerOption: "13 Portionen"),
  LikertScale(id: 15, answerOption: "14 Portionen"),
  LikertScale(id: 16, answerOption: "15 Portionen"),
  LikertScale(id: 17, answerOption: "16 Portionen"),
  LikertScale(id: 18, answerOption: "17 Portionen"),
  LikertScale(id: 19, answerOption: "18 Portionen"),
  LikertScale(id: 20, answerOption: "19 Portionen"),
  LikertScale(id: 21, answerOption: "20 Portionen (oder mehr)"),
];

List<LikertScale> answerOptionsCream = [
  LikertScale(id: 0, answerOption: "Gar kein"),
  LikertScale(id: 1, answerOption: "1/2 Portion (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Portion (30 g /3 Esslöffel)"),
  LikertScale(id: 3, answerOption: "2 Portionen"),
  LikertScale(id: 4, answerOption: "3 Portionen"),
  LikertScale(id: 5, answerOption: "4 Portionen"),
  LikertScale(id: 6, answerOption: "5 Portionen"),
  LikertScale(id: 7, answerOption: "6 Portionen"),
  LikertScale(id: 8, answerOption: "7 Portionen"),
  LikertScale(id: 9, answerOption: "8 Portionen"),
  LikertScale(id: 10, answerOption: "9 Portionen"),
  LikertScale(id: 11, answerOption: "10 Portionen"),
  LikertScale(id: 12, answerOption: "11 Portionen"),
  LikertScale(id: 13, answerOption: "12 Portionen"),
  LikertScale(id: 14, answerOption: "13 Portionen"),
  LikertScale(id: 15, answerOption: "14 Portionen"),
  LikertScale(id: 16, answerOption: "15 Portionen"),
  LikertScale(id: 17, answerOption: "16 Portionen"),
  LikertScale(id: 18, answerOption: "17 Portionen"),
  LikertScale(id: 19, answerOption: "18 Portionen"),
  LikertScale(id: 20, answerOption: "19 Portionen"),
  LikertScale(id: 21, answerOption: "20 Portionen (oder mehr)"),
];

List<LikertScale> answerOptionsPortionsTwo = [
  LikertScale(id: 0, answerOption: "Gar kein"),
  LikertScale(id: 1, answerOption: "1/4 Portion (oder weniger)"),
  LikertScale(id: 2, answerOption: "1/2 Portion (oder weniger)"),
  LikertScale(id: 3, answerOption: "1 Portion"),
  LikertScale(id: 4, answerOption: "2 Portionen"),
  LikertScale(id: 5, answerOption: "3 Portionen"),
  LikertScale(id: 6, answerOption: "4 Portionen"),
  LikertScale(id: 7, answerOption: "5 Portionen"),
  LikertScale(id: 8, answerOption: "6 Portionen"),
  LikertScale(id: 9, answerOption: "7 Portionen"),
  LikertScale(id: 10, answerOption: "8 Portionen"),
  LikertScale(id: 11, answerOption: "9 Portionen"),
  LikertScale(id: 12, answerOption: "10 Portionen"),
  LikertScale(id: 13, answerOption: "11 Portionen"),
  LikertScale(id: 14, answerOption: "12 Portionen"),
  LikertScale(id: 15, answerOption: "13 Portionen"),
  LikertScale(id: 16, answerOption: "14 Portionen"),
  LikertScale(id: 17, answerOption: "15 Portionen"),
  LikertScale(id: 18, answerOption: "16 Portionen"),
  LikertScale(id: 19, answerOption: "17 Portionen"),
  LikertScale(id: 20, answerOption: "18 Portionen"),
  LikertScale(id: 21, answerOption: "19 Portionen"),
  LikertScale(id: 22, answerOption: "20 Portionen (oder mehr)"),
];

List<LikertScale> answerOptionsBread = [
  LikertScale(id: 0, answerOption: "Gar kein/e"),
  LikertScale(
      id: 1, answerOption: "1/2 Scheibe oder 1/2 Brötchen (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Scheibe oder 1 Brötchen"),
  LikertScale(id: 3, answerOption: "2 Scheiben oder 2 Brötchen"),
  LikertScale(id: 4, answerOption: "3 Scheiben oder 3 Brötchen"),
  LikertScale(id: 5, answerOption: "4 Scheiben oder 4 Brötchen"),
  LikertScale(id: 6, answerOption: "5 Scheiben oder 5 Brötchen"),
  LikertScale(id: 7, answerOption: "6 Scheiben oder 6 Brötchen"),
  LikertScale(id: 8, answerOption: "7 Scheiben oder 7 Brötchen"),
  LikertScale(id: 9, answerOption: "8 Scheiben oder 8 Brötchen"),
  LikertScale(id: 10, answerOption: "9 Scheiben oder 9 Brötchen"),
  LikertScale(id: 11, answerOption: "10 Scheiben oder 10 Brötchen"),
  LikertScale(id: 12, answerOption: "11 Scheiben oder 11 Brötchen"),
  LikertScale(id: 13, answerOption: "12 Scheiben oder 12 Brötchen"),
  LikertScale(id: 14, answerOption: "13 Scheiben oder 13 Brötchen"),
  LikertScale(id: 15, answerOption: "14 Scheiben oder 14 Brötchen"),
  LikertScale(id: 16, answerOption: "15 Scheiben oder 15 Brötchen"),
  LikertScale(id: 17, answerOption: "16 Scheiben oder 16 Brötchen"),
  LikertScale(id: 18, answerOption: "17 Scheiben oder 17 Brötchen"),
  LikertScale(id: 19, answerOption: "18 Scheiben oder 18 Brötchen"),
  LikertScale(id: 20, answerOption: "19 Scheiben oder 19 Brötchen"),
  LikertScale(id: 21, answerOption: "20 Scheiben oder 20 Brötchen (oder mehr)"),
];

List<LikertScale> answerOptionsTeaspoon = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Teelöffel (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Teelöffel (gestrichen)"),
  LikertScale(id: 3, answerOption: "2 Teelöffel"),
  LikertScale(id: 4, answerOption: "3 Teelöffel"),
  LikertScale(id: 5, answerOption: "4 Teelöffel"),
  LikertScale(id: 6, answerOption: "5 Teelöffel"),
  LikertScale(id: 7, answerOption: "6 Teelöffel"),
  LikertScale(id: 8, answerOption: "7 Teelöffel"),
  LikertScale(id: 9, answerOption: "8 Teelöffel"),
  LikertScale(id: 10, answerOption: "9 Teelöffel"),
  LikertScale(id: 11, answerOption: "10 Teelöffel"),
  LikertScale(id: 12, answerOption: "11 Teelöffel"),
  LikertScale(id: 13, answerOption: "12 Teelöffel"),
  LikertScale(id: 14, answerOption: "13 Teelöffel"),
  LikertScale(id: 15, answerOption: "14 Teelöffel"),
  LikertScale(id: 16, answerOption: "15 Teelöffel"),
  LikertScale(id: 17, answerOption: "16 Teelöffel"),
  LikertScale(id: 18, answerOption: "17 Teelöffel"),
  LikertScale(id: 19, answerOption: "18 Teelöffel"),
  LikertScale(id: 20, answerOption: "19 Teelöffel"),
  LikertScale(id: 21, answerOption: "20 Teelöffel (oder mehr)"),
];

List<LikertScale> answerOptionsTablespoon = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Esslöffel (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Esslöffel (gehäuft)"),
  LikertScale(id: 3, answerOption: "2 Esslöffel"),
  LikertScale(id: 4, answerOption: "3 Esslöffel"),
  LikertScale(id: 5, answerOption: "4 Esslöffel"),
  LikertScale(id: 6, answerOption: "5 Esslöffel"),
  LikertScale(id: 7, answerOption: "6 Esslöffel"),
  LikertScale(id: 8, answerOption: "7 Esslöffel"),
  LikertScale(id: 9, answerOption: "8 Esslöffel"),
  LikertScale(id: 10, answerOption: "9 Esslöffel"),
  LikertScale(id: 11, answerOption: "10 Esslöffel"),
  LikertScale(id: 12, answerOption: "11 Esslöffel"),
  LikertScale(id: 13, answerOption: "12 Esslöffel"),
  LikertScale(id: 14, answerOption: "13 Esslöffel"),
  LikertScale(id: 15, answerOption: "14 Esslöffel"),
  LikertScale(id: 16, answerOption: "15 Esslöffel"),
  LikertScale(id: 17, answerOption: "16 Esslöffel"),
  LikertScale(id: 18, answerOption: "17 Esslöffel"),
  LikertScale(id: 19, answerOption: "18 Esslöffel"),
  LikertScale(id: 20, answerOption: "19 Esslöffel"),
  LikertScale(id: 21, answerOption: "20 Esslöffel (oder mehr)"),
];

List<LikertScale> answerOptionsTeaspoonTwo = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Teelöffel (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Teelöffel (gehäuft)"),
  LikertScale(id: 3, answerOption: "2 Teelöffel"),
  LikertScale(id: 4, answerOption: "3 Teelöffel"),
  LikertScale(id: 5, answerOption: "4 Teelöffel"),
  LikertScale(id: 6, answerOption: "5 Teelöffel"),
  LikertScale(id: 7, answerOption: "6 Teelöffel"),
  LikertScale(id: 8, answerOption: "7 Teelöffel"),
  LikertScale(id: 9, answerOption: "8 Teelöffel"),
  LikertScale(id: 10, answerOption: "9 Teelöffel"),
  LikertScale(id: 11, answerOption: "10 Teelöffel"),
  LikertScale(id: 12, answerOption: "11 Teelöffel"),
  LikertScale(id: 13, answerOption: "12 Teelöffel"),
  LikertScale(id: 14, answerOption: "13 Teelöffel"),
  LikertScale(id: 15, answerOption: "14 Teelöffel"),
  LikertScale(id: 16, answerOption: "15 Teelöffel"),
  LikertScale(id: 17, answerOption: "16 Teelöffel"),
  LikertScale(id: 18, answerOption: "17 Teelöffel"),
  LikertScale(id: 19, answerOption: "18 Teelöffel"),
  LikertScale(id: 20, answerOption: "19 Teelöffel"),
  LikertScale(id: 21, answerOption: "20 Teelöffel (oder mehr)"),
];

List<LikertScale> answerOptionsEggs = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Ei (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Ei"),
  LikertScale(id: 3, answerOption: "2 Eier"),
  LikertScale(id: 4, answerOption: "3 Eier"),
  LikertScale(id: 5, answerOption: "4 Eier"),
  LikertScale(id: 6, answerOption: "5 Eier"),
  LikertScale(id: 7, answerOption: "6 Eier"),
  LikertScale(id: 8, answerOption: "7 Eier"),
  LikertScale(id: 9, answerOption: "8 Eier"),
  LikertScale(id: 10, answerOption: "9 Eier"),
  LikertScale(id: 11, answerOption: "10 Eier"),
  LikertScale(id: 12, answerOption: "11 Eier"),
  LikertScale(id: 13, answerOption: "12 Eier"),
  LikertScale(id: 14, answerOption: "13 Eier"),
  LikertScale(id: 15, answerOption: "14 Eier"),
  LikertScale(id: 16, answerOption: "15 Eier"),
  LikertScale(id: 17, answerOption: "16 Eier"),
  LikertScale(id: 18, answerOption: "17 Eier"),
  LikertScale(id: 19, answerOption: "18 Eier"),
  LikertScale(id: 20, answerOption: "19 Eier"),
  LikertScale(id: 21, answerOption: "20 Eier (oder mehr)"),
];

List<LikertScale> answerOptionsJar = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Becher (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Becher (200 Gramm)"),
  LikertScale(id: 3, answerOption: "2 Becher"),
  LikertScale(id: 4, answerOption: "3 Becher"),
  LikertScale(id: 5, answerOption: "4 Becher"),
  LikertScale(id: 6, answerOption: "5 Becher"),
  LikertScale(id: 7, answerOption: "6 Becher"),
  LikertScale(id: 8, answerOption: "7 Becher"),
  LikertScale(id: 9, answerOption: "8 Becher"),
  LikertScale(id: 10, answerOption: "9 Becher"),
  LikertScale(id: 11, answerOption: "10 Becher"),
  LikertScale(id: 12, answerOption: "11 Becher"),
  LikertScale(id: 13, answerOption: "12 Becher"),
  LikertScale(id: 14, answerOption: "13 Becher"),
  LikertScale(id: 15, answerOption: "14 Becher"),
  LikertScale(id: 16, answerOption: "15 Becher"),
  LikertScale(id: 17, answerOption: "16 Becher"),
  LikertScale(id: 18, answerOption: "17 Becher"),
  LikertScale(id: 19, answerOption: "18 Becher"),
  LikertScale(id: 20, answerOption: "19 Becher"),
  LikertScale(id: 21, answerOption: "20 Becher (oder mehr)"),
];

List<LikertScale> answerOptionsPotatoes = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(
      id: 1, answerOption: "1/2 Portion oder 1 Kartoffel (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Portion oder 2 Kartoffeln"),
  LikertScale(id: 3, answerOption: "1 1/2 Portionenen oder 3 Kartoffeln"),
  LikertScale(id: 4, answerOption: "2 Portionen oder 4 Kartoffeln"),
  LikertScale(id: 5, answerOption: "3 Portionen oder 6 Kartoffeln"),
  LikertScale(id: 6, answerOption: "4 Portionen oder 8 Kartoffeln"),
  LikertScale(id: 7, answerOption: "5 Portionen oder 10 Kartoffeln"),
  LikertScale(id: 8, answerOption: "6 Portionen oder 12 Kartoffeln"),
  LikertScale(id: 9, answerOption: "7 Portionen oder 14 Kartoffeln"),
  LikertScale(id: 10, answerOption: "8 Portionen oder 16 Kartoffeln"),
  LikertScale(id: 11, answerOption: "9 Portionen oder 18 Kartoffeln"),
  LikertScale(
      id: 12, answerOption: "10 Portionen oder 20 Kartoffeln (oder mehr)"),
];

List<LikertScale> answerOptionsSlices = [
  LikertScale(id: 0, answerOption: "Gar kein/e"),
  LikertScale(id: 1, answerOption: "1/2 Scheibe (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Scheibe"),
  LikertScale(id: 3, answerOption: "2 Scheiben"),
  LikertScale(id: 4, answerOption: "3 Scheiben"),
  LikertScale(id: 5, answerOption: "4 Scheiben"),
  LikertScale(id: 6, answerOption: "5 Scheiben"),
  LikertScale(id: 7, answerOption: "6 Scheiben"),
  LikertScale(id: 8, answerOption: "7 Scheiben"),
  LikertScale(id: 9, answerOption: "8 Scheiben"),
  LikertScale(id: 10, answerOption: "9 Scheiben"),
  LikertScale(id: 11, answerOption: "10 Scheiben"),
  LikertScale(id: 12, answerOption: "11 Scheiben"),
  LikertScale(id: 13, answerOption: "12 Scheiben"),
  LikertScale(id: 14, answerOption: "13 Scheiben"),
  LikertScale(id: 15, answerOption: "14 Scheiben"),
  LikertScale(id: 16, answerOption: "15 Scheiben"),
  LikertScale(id: 17, answerOption: "16 Scheiben"),
  LikertScale(id: 18, answerOption: "17 Scheiben"),
  LikertScale(id: 19, answerOption: "18 Scheiben"),
  LikertScale(id: 20, answerOption: "19 Scheiben"),
  LikertScale(id: 21, answerOption: "20 Scheiben (oder mehr)"),
];

List<LikertScale> answerOptionsPieces = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Stück (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Stück"),
  LikertScale(id: 3, answerOption: "2 Stück"),
  LikertScale(id: 4, answerOption: "3 Stück"),
  LikertScale(id: 5, answerOption: "4 Stück"),
  LikertScale(id: 6, answerOption: "5 Stück"),
  LikertScale(id: 7, answerOption: "6 Stück"),
  LikertScale(id: 8, answerOption: "7 Stück"),
  LikertScale(id: 9, answerOption: "8 Stück"),
  LikertScale(id: 10, answerOption: "9 Stück"),
  LikertScale(id: 11, answerOption: "10 Stück"),
  LikertScale(id: 12, answerOption: "11 Stück"),
  LikertScale(id: 13, answerOption: "12 Stück"),
  LikertScale(id: 14, answerOption: "13 Stück"),
  LikertScale(id: 15, answerOption: "14 Stück"),
  LikertScale(id: 16, answerOption: "15 Stück"),
  LikertScale(id: 17, answerOption: "16 Stück"),
  LikertScale(id: 18, answerOption: "17 Stück"),
  LikertScale(id: 19, answerOption: "18 Stück"),
  LikertScale(id: 20, answerOption: "19 Stück"),
  LikertScale(id: 21, answerOption: "20 Stück (oder mehr)"),
];

List<LikertScale> answerOptionsBowls = [
  LikertScale(id: 0, answerOption: "Gar keine"),
  LikertScale(id: 1, answerOption: "1/2 Schale (oder weniger)"),
  LikertScale(id: 2, answerOption: "1 Schale"),
  LikertScale(id: 3, answerOption: "2 Schalen"),
  LikertScale(id: 4, answerOption: "3 Schalen"),
  LikertScale(id: 5, answerOption: "4 Schalen"),
  LikertScale(id: 6, answerOption: "5 Schalen"),
  LikertScale(id: 7, answerOption: "6 Schalen"),
  LikertScale(id: 8, answerOption: "7 Schalen"),
  LikertScale(id: 9, answerOption: "8 Schalen"),
  LikertScale(id: 10, answerOption: "9 Schalen"),
  LikertScale(id: 11, answerOption: "10 Schalen"),
  LikertScale(id: 12, answerOption: "11 Schalen"),
  LikertScale(id: 13, answerOption: "12 Schalen"),
  LikertScale(id: 14, answerOption: "13 Schalen"),
  LikertScale(id: 15, answerOption: "14 Schalen"),
  LikertScale(id: 16, answerOption: "15 Schalen"),
  LikertScale(id: 17, answerOption: "16 Schalen"),
  LikertScale(id: 18, answerOption: "17 Schalen"),
  LikertScale(id: 19, answerOption: "18 Schalen"),
  LikertScale(id: 20, answerOption: "19 Schalen"),
  LikertScale(id: 21, answerOption: "20 Schalen (oder mehr)"),
];
