import 'package:flutter/material.dart';
import 'package:ecovia/size_config.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.defaultSize! * 5,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.black, width: 2),),
        child: IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.navigate_before),
            iconSize: SizeConfig.defaultSize! * 3),    
    );
  }
}
