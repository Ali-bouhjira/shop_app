import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

import '../../../constants.dart';

class ProductTitleImage extends StatelessWidget {
  const ProductTitleImage({Key? key, required this.p}) : super(key: key);
  final Product p;

  @override
  Widget build(BuildContext context) {
    return  Padding(

      padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sac Arisochratique" ,style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white
          ),),
          Text(p.title,style:
          Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white,fontWeight: FontWeight.bold ),),

          SizedBox(height: kDefaultPaddin,),
          Row(
            children: [
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text:'Price\n'),
                    TextSpan(text: '\$${p.price}',
                      style:Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white,fontWeight: FontWeight.bold
                      ),),


                  ]
              )),
              SizedBox(width: kDefaultPaddin,),
              Expanded(child: Image.asset(p.image,fit: BoxFit.fitWidth,))
            ],
          )
        ],
      ),
    );
  }
}
