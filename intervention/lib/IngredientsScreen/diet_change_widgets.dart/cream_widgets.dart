import 'package:ecovia/IngredientsScreen/diet_change_widgets.dart/text_span_widget.dart';
import 'package:flutter/material.dart';


class CreamWidgetOne extends StatelessWidget {
  const CreamWidgetOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextSpanWidget(text: 'Beim Kochen lässt sich herkömmliche Sahne ähnlich wie Milch sehr gut durch die pflanzlichen Alternativen ersetzen. Es gibt u.a. Sojasahne, Hafersahne oder Reissahne. Teilweise haben die Produkte einen leichten Eigengeschmack, der in einer kräftig gewürzten Soße aber nicht wahrnehmbar ist.'),
        const TextSpanWidget(text: 'Alternativ kannst du auch auf Nussmus zurückgreifen, um Soßen Cremigkeit und Gehalt zu verleihen. Die neutraleren Nussmuse wie Cashew- und Mandelmus eignen sich dafür besonders gut, Erdnussmus oder -Butter speziell für asiatische Gerichte. Mische diese einfach mit etwas Wasser bis die gewünschte Konsistenz erreicht ist. Oder du machst aus eingeweichten Cashews oder Mandeln mit einem Hochleistungsmixer selbst eine Creme, die sich als pflanzliche Sahne verwenden lässt.'),
        const TextSpanWidget(text: 'Diese Sahnealternativen zum Kochen lassen sich allerdings in der Regel nicht aufschlagen. Wenn man also Alternativen zur Schlagsahne sucht, dann unbedingt ein Produkt verwenden, dass als „aufschlagbar“ gekennzeichnet ist. Das sind u.a. die Produkte von Schlagfix, die in einigen Supermärkten und online zu finden sind. Alternativ kann man auch aus Kokosmilch eine aufgeschlagene Creme herstellen. Fertige Sprühsahne gibt es aber auch rein pflanzlich zu kaufen - ebenfalls von Schlagfix.'),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16),
                    children: [
                      TextSpan(
                          text:
                              '')
                    ]))),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSpanWidget(text: 'Auch wenn Schmand und Crème Fraîche in den meisten Gerichten auch durch eine pflanzliche Sahne ersetzt werden kann, ist die Creme Vega eine nennenswerte Alternative, die sich sowohl für Soßen als auch als Topping für Suppen sehr gut eignet.'),
          ],
        ),
      ],
    );
  }
}