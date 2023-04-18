import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/product.dart';

import 'CardCunter.dart';

class CounterWithFavbtn extends StatelessWidget {
   CounterWithFavbtn({Key? key, required this.p,required this.mail}) : super(key: key);
  Product p;
  var mail;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        //CartCounter(p),


        Container(
          padding: EdgeInsets.all(8),
          height: 32, width: 32,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        ),

      ],
    );
  }
}
