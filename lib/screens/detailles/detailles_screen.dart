import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/detailles/bodyD.dart';

import '../../constants.dart';

class DetaillesSreen extends StatelessWidget {
  const DetaillesSreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          icon:SvgPicture.asset("assets/icons/back.svg", color: Colors.white,) ,
          onPressed: () { Navigator.pop(context); },),
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/search.svg",color: Colors.white)),
          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/cart.svg",color: Colors.white),),
          SizedBox(width: kDefaultPaddin/2,)
          //test2
        ],
      ),
      body: BodyD(p: product,),
    );
  }
}
