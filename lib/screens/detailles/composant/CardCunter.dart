import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../bodyD.dart';
import 'outlined_boutton.dart';
class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numeroofitem=1;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        BuildOutlineButton(Icons.remove,(){
          if(numeroofitem>1)
            setState(() {
              numeroofitem--;
            });
        }),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin/2),
          child: Text(numeroofitem.toString().padLeft(2,"0"),
            style: Theme.of(context).textTheme.headline6,),
        ),
        BuildOutlineButton(Icons.add,(){

          setState(() {
            numeroofitem++;
          });
        }),


      ],
    );
  }
}
