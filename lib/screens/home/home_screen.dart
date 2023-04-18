import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/login_screen/login.dart';
import 'package:shop_app/screens/login_screen/providers/auth_provider.dart';
import 'package:shop_app/screens/login_screen/vm/login_controller.dart';
import 'package:shop_app/screens/panier/panier.dart';
import 'dart:math' as math;

import '../../models/product.dart';
import '../profile/profile.dart';
import 'componant/body.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  HomeScreen(this.u, {Key? key}) : super(key: key);
  final String? u;

  ConsumerState<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  Future<String> futurLien() async {
    if (ref.read(googleProvider).currentUser != null) {
      return ref.read(googleProvider).currentUser?.photoUrl as String;
    }
    QuerySnapshot snp =
        await FirebaseFirestore.instance.collection('user').get();
    String str = "";
    snp.docs.forEach((doc) {
      if (doc["uid"].toString() == ref.read(autStatProvider).value?.uid) {
        str = doc['pdp'] as String;
      }
    });

    return str;
  }

  @override
  Widget build(BuildContext context) {
    void addpanier(panier, mail) {
      FirebaseFirestore db = FirebaseFirestore.instance;

      db.collection("panier").get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            if (docSnapshot.data()['email'] == mail.toString()) {
              for (final nom in docSnapshot.data()['nomObjets']) {
                panier.add(nom.toString());
              }
            }
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
    }

    List panier = [];

    addpanier(panier, widget.u);

    //print(panier.first);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            ref.read(logincontrollerprovider.notifier).signout();
            ref.read(googleProvider).signOut();
          },
          icon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ),
        centerTitle: true,
        title: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            backgroundColor: MaterialStateProperty.all(
                Colors.white), // Set the background color of the button
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => profileScreen()));
          },
          child: FutureBuilder(
              future: futurLien(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data as String));
                }
                return SizedBox.shrink();
              }),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(logincontrollerprovider.notifier)
                    .getemail()
                    .then((value) => print(value));
              },
              icon: SvgPicture.asset("assets/icons/search.svg",
                  color: kTextColor)),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PanierInformation(u: widget.u.toString())));
            },
            icon: SvgPicture.asset("assets/icons/cart.svg", color: kTextColor),
          ),
          SizedBox(
            width: kDefaultPaddin / 2,
          )
          //test2
        ],
      ),
      body: Body(panier: panier, mail: widget.u.toString()),
    );
  }
}
