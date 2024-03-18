import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(fit: BoxFit.fitHeight, child: Icon(Icons.circle, color: Colors.white,));
  }
}