import 'package:ecovia/Screens/build_app_bars.dart';
import 'package:ecovia/constants.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);
  @override
  State<DisclaimerScreen> createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  Uri firebaseUrl = Uri(scheme: 'https', host: 'firebase.google.com', path: '/support/privacy#data_protection');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithBackButton(() => Navigator.pop(context)),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(gradient: backgroundGradient()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03, vertical: SizeConfig.screenHeight * 0.03),
            child: ListView(
              children: [
                Center(
                  child: Text('Disclaimer/Haftungsausschluss',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                Text(
                    'Alle Angaben der ECOVIA App wurden sorgfältig geprüft. Wir übernehmen jedoch keine Garantie (weder ausdrücklich noch stillschweigend) für die Richtigkeit und Vollständigkeit sowie letzte Aktualität der Informationen. Aufgrund der Selektion von Inhalten und des wissenschaftlichen Fortschritts kann nicht ausgeschlossen werden, dass einzelne Inhalte veraltet oder unvollständig sind. Außerdem übernehmen wir keine Haftung für jegliche Art von Schäden, die sich aus dem Gebrauch der hier veröffentlichten Informationen ergeben könnten.'),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text(
                    'Die in der ECOVIA App dargestellten Inhalte dienen lediglich zur Weiterbildung und stellen weder eine Ernährungsberatung, medizinische oder psychotherapeutische Behandlung dar noch können sie diese ersetzen. Jegliche Inhalte der ECOVIA App sind lediglich als Anregung zu umweltbewusstem Ernährungsverhalten zu verstehen. Die Anwendung der angebenen Informationen erfolgt immer freiwillig, eigenverantwortlich und auf eigene Gefahr hin. Sämtliche in ärztlicher Behandlung befindliche Personen sind dazu angehalten, eine Ernährungsumstellung nur in Rücksprache mit dem behandelnden Arzt durchzuführen.'),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text('Der Betreiber der ECOVIA App haftet ausdrücklich nicht für etwaige Schäden und Folgeschäden, die durch die Anwendung der hier angegebenen Informationen entstehen können.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
