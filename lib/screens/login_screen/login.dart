import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/screens/inscription/inscription.dart';
import 'package:shop_app/screens/login_screen/providers/auth_provider.dart';
import 'package:shop_app/screens/login_screen/vm/login_controller.dart';
import 'package:shop_app/screens/login_screen/vm/login_state.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  var u;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(logincontrollerprovider, (previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            state.error,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: CupertinoColors.systemPink,
          showCloseIcon: true,
        ));
      }
    });
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Flexible(
            flex: 1,
            child: Image.network(
              "https://images.squarespace-cdn.com/content/v1/601bb91eb4b86828b4d6cf0f/1612729292590-C3I6CP9C272T4D2KDMOP/Copy+of+Welcome+Long.png",
              fit: BoxFit.cover,
            )),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.redAccent,
                    CupertinoColors.systemPink,
                  ],
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: "Mot-De-Passe",
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: size.width * 0.4,
                    height: 50, // Specify the desired width here
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: CupertinoColors.systemPink,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        u = ref.read(logincontrollerprovider.notifier).login(
                            namecontroller.text, passwordcontroller.text);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Wrap(
                                children: [
                                  Text("se connecter "),
                                  Icon(Icons.login),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50, // Specify the desired width here
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InscScreen()));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Wrap(
                                children: [
                                  Text("s'inscrire "),
                                  Icon(Icons.how_to_reg),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50, // Specify the desired width here
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.redAccent,
                        shadowColor: Colors.red,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        String? username;
                        String? pdp;
                        String? mail;

                        ref.read(googleProvider).signIn().then((value) => {
                              username = value?.displayName,
                              pdp = value?.photoUrl,
                              mail= value?.email,
                              ref
                                  .read(logincontrollerprovider.notifier)
                                  .login(mail!, pdp!)
                                  .then((value) => {
                                        if (value == null)
                                          {
                                            ref
                                                .read(logincontrollerprovider
                                                    .notifier)
                                                .creataccount(mail!, pdp!).whenComplete(() {
                                              FirebaseFirestore.instance.collection('user').add({
                                                'uid':ref.read(autStatProvider).value?.uid,
                                                'nom': username,
                                                'pdp':pdp,
                                              });
                                            }),

                                          }
                                      })
                            });
                      }



                      ,
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Wrap(
                                children: [
                                  Text("se connecter avec google "),
                                  Image.network(
                                    'http://pngimg.com/uploads/google/google_PNG19635.png',
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
