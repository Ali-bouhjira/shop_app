import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

import '../../../constants.dart';
import '../bodyD.dart';
import 'color_dot.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({Key? key, required this.p}) : super(key: key);
  final Product p;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('color :'),
              Row(
                children: [
                  ColorDot(color: Color(0xFF3D82AE), isselected: true,),
                  ColorDot(color: Color(0xFFF8C078), isselected: false, ),
                  ColorDot(color: Color(0xFFA29B9B), isselected: false,),
                ],
              ),
            ],
          ),
        ),
        Expanded(

          child: RichText(text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan( text: 'Size :\n'),
                TextSpan(text: "${p.size} cm",style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold
                ))
              ]
          )),
        )
      ],

    );
  }
}
