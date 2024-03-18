class Item {
  String header;
  String description;
  Item({required this.header, required this.description});
}

final List<Item> dairyItems = [
  Item(header: 'Butter', description: 'Butter fürs Brot oder zum Anbraten lässt sich durch Margarine ersetzen. Da nicht alle Margarine-Produkte vegan sind, ist es ratsam die Zutatenliste zu checken. \n Aus einem gesundheitlichen Blickwinkel sollte man darauf achten, Margarinen ohne gehärtetes Fett zu verwenden, Stichwort Transfettsäuren (mehr dazu u.a. unter DGE und Test.de) \n Mein persönlicher Favorit, weil ungehärtet und geschmacklich so gut, dass es für mich ein adäquater Ersatz auch auf Brot ist, ist die vegane Margarine von Alsan. Die findest du online und in gut sortierten Supermärkten. Man kann damit auch super Sachen anbraten, die ein bisschen Butteraroma annehmen wollen z.B. Pfannkuchen oder Kaspressknödel. Sie eignet sich außerdem für vegane Tomaten- oder Kräuterbutter.'),
  Item(header: 'Milch', description: 'xd'),
  Item(header: 'Sahne', description: 'xd'),
  Item(header: 'Joghurt', description: 'xd'),
  Item(header: 'Quark', description: 'xd'),
  Item(header: 'Käse', description: 'xd'),
  Item(header: 'weitere Milchprodukte', description: 'xd'),
];

final List<Item> eggItems = [
  Item(header: 'Ei', description: 'xd'),
  Item(header: 'Majo', description: 'xd'),
];

final List<Item> honeyItems = [
  Item(header: 'Honig', description: 'xd'),
];

final List<Item> meatItems = [
  Item(header: 'Hackfleisch', description: 'xd'),
  Item(header: 'Schnitzel/Filet', description: 'xd'),
  Item(header: 'Wurst', description: 'xd'),
  Item(header: 'Speck', description: 'xd'),
  Item(header: 'Gelatine', description: 'xd'),
  Item(header: 'Fisch', description: 'xd'),
  Item(header: 'Soßen', description: 'xd'),
];

final List<List<Item>> itemList = [meatItems, dairyItems, eggItems, honeyItems];
