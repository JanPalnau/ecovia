import 'package:ecovia_control/Screens/build_app_bars.dart';
import 'package:ecovia_control/constants.dart';
import 'package:ecovia_control/size_config.dart';
import 'package:flutter/material.dart';

class ImpressumScreen extends StatefulWidget {
  const ImpressumScreen({Key? key, required this.content}) : super(key: key);
  final List<Widget> content;
  @override
  State<ImpressumScreen> createState() => _ImpressumScreenState();
}

class _ImpressumScreenState extends State<ImpressumScreen> {
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
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.02, vertical: SizeConfig.screenHeight * 0.03),
            child: ListView(
              children: [
                const Center(child: Text('Impressum', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ),)),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Angaben gemäß § 5 TMG'),
                const Text('Jan-Felix Palnau'),
                const Text('Am Kaiserkai 1'),
                const Text('22812 Hamburg'),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Vertreten durch:'),
                const Text('Jan-Felix Palnau'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text('Kontakt:', style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('Telefon: 0157-38307275'),
                const Text('E-Mail: palnauja@hu-berlin.de'),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Haftungsausschluss:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ),),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text('Urheberrecht', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Die durch den Appbetreiber erstellten Inhalte und Werke der ECOVIA App unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet. Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen.')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
