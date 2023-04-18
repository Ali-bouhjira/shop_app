import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/detailles/composant/color_and_size.dart';

import 'composant/CardCunter.dart';
import 'composant/outlined_boutton.dart';
import 'composant/product_title_image.dart';

class BodyD extends StatelessWidget {
  const BodyD({Key? key, required this.p}) : super(key: key);
  final Product p ;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  SingleChildScrollView(

      child: Column(
        children: [
          SizedBox(
              height:size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height*0.3),
                  padding: EdgeInsets.only(top:size.height*0.12,left: kDefaultPaddin,right: kDefaultPaddin),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25), topRight: Radius.circular(25))
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(p: p),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
                        child: Text(p.description,style:
                          TextStyle(height: 1.5),),
                      ),

                      Row(

                        children: [
                          //CartCounter(p),


                        ],
                      ),

                      
                    ],
                  ),
                ),
               ProductTitleImage(p:p),


              ],
            ),
          )

        ],
      ),
    );
  }
}





