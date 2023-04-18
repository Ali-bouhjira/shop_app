import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/login_screen/providers/auth_provider.dart';

import '../../../constants.dart';
import '../bodyD.dart';
import 'outlined_boutton.dart';
 /* class CartCounter extends  HookConsumerWidget {
     CartCounter( this.p, {Key? key}) : super(key: key);
     Product p;

    @override
    Widget build(BuildContext context, WidgetRef ref) {
      int numeroofitem = 1;
      @override
      Widget build(BuildContext context) {
        return Row(
          children: [
            BuildOutlineButton(Icons.remove, () {}),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
              child: Text(numeroofitem.toString().padLeft(2, "0"),
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,),
            ),
            BuildOutlineButton(Icons.add, () {}),

            BuildOutlineButton(Icons.shopping_cart_checkout, () async {
              QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                  .collection("panier")
                  .where('email', isEqualTo: ref
                  .read(autStatProvider)
                  .value)
                  .get();
              for (var docSnapshot in querySnapshot.docs) {
                docSnapshot;
              }
            }
            )


          ],
        );
      }
    }
  }
*/