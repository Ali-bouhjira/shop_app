import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/detailles/detailles_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text("Women",style: Theme.of(context).textTheme.
          headline5?.copyWith(fontWeight:FontWeight.bold ),),
        ),
        Categories(),

       Expanded(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
             child: GridView.builder(
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: 0.75,
             mainAxisSpacing: kDefaultPaddin,
             crossAxisSpacing: kDefaultPaddin),
             itemBuilder: (context,index) =>ItemCard(product: products[index],press:()=>{

               Navigator.push(context, MaterialPageRoute(
                   builder: (context) =>DetaillesSreen(product: products[index],)))
             },),
         itemCount: products.length,
       ),
           )
       ),


      ],
    );
  }
  
  
}






