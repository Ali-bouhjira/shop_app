import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({Key? key, required this.product, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Image.asset(product.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
          child: Text(product.title,style:TextStyle(color: kTextLightColor) ,),
        ),
        Text("\$${product.price}",style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }
}
