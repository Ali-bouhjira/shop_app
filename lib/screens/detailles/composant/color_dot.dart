import 'package:flutter/material.dart';

import '../../../constants.dart';

class ColorDot extends StatelessWidget {
  ColorDot({Key? key, required this.color, required this.isselected}) : super(key: key);
  final Color color;
  bool isselected= false;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: kDefaultPaddin/4,right: kDefaultPaddin/4),
      padding: EdgeInsets.all(2.5),
      height: 24, width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isselected? color: Colors.transparent ),

      ),
      child:
      DecoratedBox( decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle
      ),),
    );
  }
}