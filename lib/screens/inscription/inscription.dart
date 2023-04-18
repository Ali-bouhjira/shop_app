import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/screens/login_screen/providers/auth_provider.dart';
import 'package:shop_app/screens/login_screen/vm/login_controller.dart';

class InscScreen extends StatefulHookConsumerWidget {
  InscScreen({Key? key}) : super(key: key);

  ConsumerState<InscScreen> createState() => _InscScreenState();
}

class _InscScreenState extends ConsumerState<InscScreen> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pdpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemPink,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Inscription',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: mailcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: "E-mail :",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: "Mot-de-passe :",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: "Nom :",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: pdpcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: "Photo de profile (URL) :",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                onPrimary: Colors.white,
                shadowColor: Colors.red,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () async {
             var  u=  await ref
                    .read(logincontrollerprovider.notifier)
                    .creataccount(mailcontroller.text, passwordcontroller.text);
                FirebaseFirestore.instance.collection('user').add({
                  'uid': u?.uid,
                  'nom': namecontroller.text,
                  'pdp': pdpcontroller.text,

                });



                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Wrap(
                        children: [
                          Text(
                            "s'inscrire ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.how_to_reg),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
