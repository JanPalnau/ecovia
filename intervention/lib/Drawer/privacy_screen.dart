import 'package:ecovia/Screens/build_app_bars.dart';
import 'package:ecovia/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../size_config.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);
  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
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
                const Center(
                  child: Text('Datenschutzhinweise zur ECOVIA App',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text(
                    'Da bei der Nutzung der App personenbezogene Daten erhoben und verarbeitet werden, möchten wir Ihnen, gem. der Verordnung (EU) 2016/679 (Datenschutz-Grundverordnung, DSGVO) mitteilen, wie mit Ihren Daten umgegangen wird.'),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text('1. Wer ist verantwortlich?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                const Text(
                    'Die verantwortliche Person für die Datenerhebung und Verarbeitung bei der Nutzung der ECOVIA App ist'),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                const Text('Jan-Felix Palnau'),
                const Text('Am Kaiserkai 1'),
                const Text('20457 Hamburg'),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text(
                    'Die ECOVIA App stellt eine kostenfreie Informationsplattform für die Adaption einer umweltfreundlichen Ernährung dar, die zu Forschungszwecken personenbezogene Daten, wie Ernährungsverhalten und persönliche Einstellungen, mittels Fragebögen erfasst. Damit bietet sie NutzerInnen direktes Feedback zur Kohlenstoffäquivalenz ihrer Ernährung.'),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text(
                    '2. Welche personenbezogenen Daten werden zu welchem konkreten Zweck verarbeitet?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                const Text(
                    'Nachfolgend stellen wir Ihnen Zweck und Rechtsgrundlage für die Verarbeitung Ihrer personenbezogenen Daten dar. Soweit im Rahmen der ECOVIA App personenbezogene Daten erhoben, gespeichert oder genutzt werden, erfolgt dies unter Einhaltung der jeweils geltenden Vorschriften zum Schutz personenbezogener Daten. Insbesondere nutzen wir personenbezogene Daten nur für die gesetzlich erlaubten wissenschaftlichen Forschungszwecke und statistische Zwecke in anonymisierter Form.'),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text('Zu den personenbezogenen Daten zählen:'),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                const Text('•	E-Mail-Adresse '),
                const Text('•	Passwort'),
                const Text('•	Name des Browsers (nur bei Nutzenden der Web-App)'),
                const Text(
                    '•	Antworten aus Fragebögen zu Einstellungen zur eigenen Personen'),
                const Text(
                    '•	Antworten aus Fragebögen zu Einstellungen zum Ernährungsverhalten und daraus geschätzen Kohlenstoffemissionen pro Tag'),
                const Text('•	Nutzungsverhalten:'),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('o	Favorisierte Rezepte'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child:
                      Text('o	Von Nutzenden erstellte Ernährungsziele '),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('o	Ansicht von Inhalten der App'),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text(
                    '3. Für welche Zwecke und auf welcher Rechtsgrundlage werden die Daten verarbeitet?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                const Text(
                    'Wir verarbeiten Ihre Daten im Einklang mit den Bestimmungen der Datenschutz-Grundverordnung (DS-GVO) und dem Bundesdatenschutzgesetz 2018 in der jeweils geltenden Fassung:'),
                const Text(
                    '•	nur im Rahmen Ihrer Einwilligung (Art 6 Abs. 1lit.a DSGVO)'),
                const Text(
                    '•	Datenverarbeitung zu wissenschaftlichen oder historischen Forschungszwecken und zu statistischen Zwecken (BDSG § 27 BDSG)'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('4. Wer erhält meine Daten?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Ihre Daten werden vom Datenschutzverantwortlichen lediglich zu Forschungszwecken anonymisiert verarbeitet. Mit Google Inc. als Dienstverarbeiter werden Ihre Daten in nicht-personenidentifizierbarer Form in Firebase gespeichert. Bei Vorliegen einer gesetzlichen Verpflichtung sowie im Rahmen der Rechtsverfolgung können Behörden und Gerichte sowie externe Auditoren Empfänger Ihrer Daten sein.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('5. Wie lange werden meine Daten gespeichert?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Wir verarbeiten Ihre Daten bis zur Beendigung des Forschungsprojekts, voraussichtlich im Mai 2023, oder der Beendigung Ihrer Teilnahme am Forschungsprojekt. Vom Zeitpunkt der durch den Datenverantwortlichen ausgeführten Löschung werden die Daten noch weitere 180 Tage automatisch in der Firebase-Datenbank gespeichert und danach gelöscht. '),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text(
                    '6. Werden personenbezogene Daten an ein Drittland übermittelt?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Im Rahmen der Nutzung von Firebase und Google Analytics zur standortbasierten Empfehlung von Restaurants werden nicht-personenidentifizierbare Daten an Google Inc. übertragen. '),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text(
                    'Mehr Informationen zum Datenschutz in Firebase finden Sie hier:'),
                    SizedBox(height: SizeConfig.screenHeight * 0.01,),
                TextButton(
                    onPressed: () async {
                      if (await canLaunchUrl(firebaseUrl)) {
                        await launchUrl(firebaseUrl);
                      } else {
                        throw 'Maps konnte nicht geöffnet werden.';
                      }
                    },
                    child: const Text(
                        'https://firebase.google.com/support/privacy#data_protection')),
                        SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('7. Welche Datenschutzrechte habe ich?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Sie haben jederzeit ein Recht auf Auskunft, Berichtigung, Löschung oder Einschränkung der Verarbeitung Ihrer gespeicherten Daten, ein Widerspruchsrecht gegen die Verarbeitung sowie ein Recht auf Datenübertragbarkeit und auf Beschwerde gemäß den Voraussetzungen des Datenschutzrechts'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Recht auf Auskunft:'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Sie können von uns eine Auskunft verlangen, ob und in welchem Ausmaß wir Ihre Daten verarbeiten.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Recht auf Berichtigung:'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Verarbeiten wir Ihre Daten, die unvollständig oder unrichtig sind, so können Sie jederzeit deren Berichtigung bzw. deren Vervollständigung von uns verlangen.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Recht auf Löschung:'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Sie können von uns die Löschung Ihrer Daten verlangen, sofern wir diese unrechtmäßig verarbeiten oder die Verarbeitung unverhältnismäßig in Ihre berechtigten Schutzinteressen eingreift. Bitte beachten Sie, dass es Gründe geben kann, die einer sofortigen Löschung entgegenstehen, z.B. im Fall von gesetzlich geregelten Aufbewahrungspflichten. Unabhängig von der Wahrnehmung Ihres Rechts auf Löschung, werden wir Ihre Daten umgehend und vollständig löschen, soweit keine diesbezügliche rechtsgeschäftliche oder gesetzliche Aufbewahrungspflicht entgegensteht.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Recht auf Einschränkung der Verarbeitung:'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Sie können von uns die Einschränkung der Verarbeitung Ihrer Daten verlangen, wenn'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text(
                    '•	Sie die Richtigkeit der Daten bestreiten, und zwar für eine Dauer, die es uns ermöglicht, die Richtigkeit der Daten zu überprüfen.'),
                const Text(
                    '•	die Verarbeitung der Daten unrechtmäßig ist, Sie aber eine Löschung ablehnen und stattdessen eine Einschränkung der Datennutzung verlangen,'),
                const Text(
                    '•	Sie Widerspruch gegen die Verarbeitung der Daten eingelegt haben.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Recht auf Datenübertragbarkeit:'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Sie können von uns verlangen, dass wir Ihnen Ihre Daten, die Sie uns bereitgestellt haben, in einem strukturierten, gängigen und maschinenlesbaren Format zur Verfügung stellen und dass Sie diese Daten einem anderen Verantwortlichen ohne Behinderung durch uns übermitteln können, sofern'),
                    SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    '•	wir diese Daten aufgrund einer von Ihnen erteilten und widerrufbaren Zustimmung oder zur Erfüllung eines Vertrages zwischen uns verarbeiten, und'),
                const Text(
                    '•	diese Verarbeitung mithilfe automatisierter Verfahren erfolgt.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Bei technischer Machbarkeit können Sie von uns eine direkte Übermittlung Ihrer Daten an einen anderen Verantwortlichen verlangen.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Widerspruchsrecht:'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Verarbeiten wir Ihre Daten aus berechtigtem Interesse, so können Sie gegen diese Datenverarbeitung jederzeit Widerspruch einlegen; dies würde auch für ein auf diese Bestimmungen gestütztes Profiling gelten. Wir verarbeiten dann Ihre Daten nicht mehr. '),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Beschwerderecht:'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Sind Sie der Meinung, dass wir bei der Verarbeitung Ihrer Daten gegen deutsches oder europäisches Datenschutzrecht verstoßen, so bitten wir Sie, mit uns Kontakt aufzunehmen, um Fragen aufklären zu können. Sie haben selbstverständlich auch das Recht, sich an die für Sie zuständige Aufsichtsbehörde, das jeweilige Landesamt für Datenschutzaufsicht, zu wenden.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Sofern Sie eines der genannten Rechte uns gegenüber geltend machen wollen, so wenden Sie sich bitte an unseren Datenschutzbeauftragten. Im Zweifel können wir zusätzliche Informationen zur Bestätigung Ihrer Identität anfordern.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text(
                    '8. Bin ich zur Bereitstellung von Daten verpflichtet?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Mit der Anmeldung und Nutzung der ECOVIA App stimmen Sie der jeweils abgefragten Erhebung Ihrer Daten für unsere Forschungszwecke zu. Wenn Sie am Eingangsfragebogen nach Einwilligung teilgenommen haben, können Sie die App allerdings auch ohne weitere Angaben zu Ihrem Ernährungsverhalten nutzen. In der ECOVIA App wird vor jeder Fragebogenerhebung Ihr Einverständnis eingeholt. '),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text(
                    '9. Wie lange werden meine Daten gespeichert?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Ab dem Zeitpunkt der letzten Teilnahme werden Ihre Daten 90 Tage lang bis zur endgültigen Löschung gespeichert.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text(
                    '10. Kann ich die Teilnahme vorzeitig beenden?', style:
                          TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Die Teilnahme am Forschungsprojekt ECOVIA ist freiwillig und kann jederzeit beendet werden. Wenn Sie die Löschung Ihrer Daten wünschen, können Sie diese in den Optionen über "Account löschen" selbst vornehmen.'),
                    SizedBox(height: SizeConfig.screenHeight * 0.02,),
                const Text('Änderungen dieser Datenschutzerklärung'),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                const Text(
                    'Wir behalten uns das Recht vor, unsere Datenschutzerklärungen zu ändern falls dies aufgrund neuer Technologien notwendig sein sollte. Bitte stellen Sie sicher, dass Ihnen die aktuellste Version vorliegt. Werden an dieser Datenschutzerklärung grundlegende Änderungen vorgenommen, geben wir diese in der ECOVIA App bekannt.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
