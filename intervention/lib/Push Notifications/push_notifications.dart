
class PushNotification {
  PushNotification({this.title, this.description, this.payload});
  final String? title, description, payload;
}

String title = "ECOVIA";
List<String> morningDescriptions = ['Wie wäre es heute mit einer rein pflanzlichen Mahlzeit? Im unserem Rezepte-Tab findest du Inspiration!', 'Lerne mehr über umweltfreundliche Ernährung im "Umwelt"-Reiter!', 'Lerne mit uns wie du tierische Lebensmittel ersetzen kannst!', 'Überprüfe den CO₂-Fußabdruck deiner Ernährung!'];
List<String> eveningDescriptions = ['Vergiss nicht dein Ernährungstagebuch auszufüllen!', 'Heute schon dein Ernährungsprotokoll ausgefüllt?',  'Vergiss nicht dein Ernährungstagebuch auszufüllen!', 'Hast du schon dein heutigen Ernährungsfragebogen beantwortet?', 'Beantworte den Ernährungsfragebogen, um Feedback über deine Ernährung zu erhalten!'];