import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}

class AgreeScaleSlider extends StatefulWidget {
  const AgreeScaleSlider({Key? key}) : super(key: key);

  @override
  State<AgreeScaleSlider> createState() => _AgreeScaleSliderState();
}

class _AgreeScaleSliderState extends State<AgreeScaleSlider> {
  int indexTop = 0;

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: const SliderThemeData(
          /// ticks in between
        thumbColor: kDarkGreen,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            buildSliderTopLabel(),
          ],
        ),
      );

  Widget buildSliderTopLabel() {
    final labels = ['Stimme überhaupt nicht zu', 'Stimme eher nicht zu', 'Weder noch', 'Stimme eher zu', 'Stimme voll und ganz zu'];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, dynamic label) {
                final isSelected = index == indexTop;
                final color = isSelected ? Colors.black : kDarkGreen;

                return buildLabel(label: label, color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
          value: indexTop.toDouble(),
          min: min,
          max: max,
          divisions: divisions,
          // label: labels[indexTop],
          onChanged: (value) => setState(() => indexTop = value.toInt()),
        ),
      ],
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      SizedBox(
        width: SizeConfig.defaultSize! * 5,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );
}
