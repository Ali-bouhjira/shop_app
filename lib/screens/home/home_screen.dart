import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/componant/body.dart';
import 'package:shop_app/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:SvgPicture.asset("assets/icons/back.svg",) ,
          onPressed: () {  },),
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/search.svg",color: kTextColor)),
          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/cart.svg",color: kTextColor),),
          SizedBox(width: kDefaultPaddin/2,)
          //test
        ],
      ),

      body: Body(),
    );
  }
}
