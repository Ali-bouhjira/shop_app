import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/screens/login_screen/providers/auth_provider.dart';

class profileScreen extends StatefulHookConsumerWidget {
  profileScreen({Key? key}) : super(key: key);

  ConsumerState<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends ConsumerState<profileScreen> {
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
    print(FirebaseFirestore.instance.collection('user').get());

    return str;
  }

  Future<String> nom() async {
    print(ref.read(googleProvider).currentUser?.displayName);

    QuerySnapshot snp =
        await FirebaseFirestore.instance.collection('user').get();
    String str = "";
    if (ref.read(googleProvider).currentUser?.displayName != null)
      return ref.read(googleProvider).currentUser?.displayName as String;
    else
      snp.docs.forEach((doc) {
        if (doc["uid"].toString() == ref.read(autStatProvider).value?.uid) {
          str = doc['nom'] as String;
        }
      });

    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            ref.read(utilisaterProvider).nom,
            style: TextStyle(fontSize: 25),
          ),
          FutureBuilder(
              future: futurLien(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(snapshot.data as String)),
                          ),
                          Center(
                              child: FutureBuilder(
                            future: nom(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data as String);
                              } else
                                return Container();
                            },
                          ))
                        ]),
                  );
                }
                return SizedBox.shrink();
              }),
        ],
      ),
    );
  }
}
