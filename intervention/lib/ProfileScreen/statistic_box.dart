import 'package:flutter/material.dart';
import 'package:ecovia/constants.dart';
import 'package:ecovia/size_config.dart';

class StatBox extends StatefulWidget {
  const StatBox(
      {Key? key,
      this.statCategorie,
      this.statTypeOne,
      this.statTypeTwo,
      this.statTypeThree,
      this.userStatOne,
      this.userStatTwo,
      this.userStatThree,
      this.statSummary,
      this.userStatSummary})
      : super(key: key);

  final String? statCategorie,
      statTypeOne,
      statTypeTwo,
      statTypeThree,
      userStatOne,
      userStatTwo,
      userStatThree,
      statSummary,
      userStatSummary;

  @override
  State<StatBox> createState() => _StatBoxState();
}

class _StatBoxState extends State<StatBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(15),
            height: SizeConfig.defaultSize! * 25,
            width: SizeConfig.defaultSize! * 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: kDarkGreen, width: 2.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.statCategorie!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      height: 3,
                      thickness: 2,
                      color: kDarkGreen,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.statTypeOne!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
                  child: Text(
                    widget.userStatOne!,
                    style: const TextStyle(
                        fontSize: 16,),
                  ),
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.statTypeTwo!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.userStatTwo!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.statTypeThree!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.userStatThree!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                  ],
                ),
                const Divider(height: 3, thickness: 3,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(color: kDarkGreen, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            widget.statSummary!,
                            softWrap: true,
                            style: const TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.userStatSummary!,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
