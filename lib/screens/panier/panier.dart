import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PanierInformation extends StatefulWidget {
  PanierInformation({required this.u});
  final String u;

  @override
  _PanierInformationState createState() => _PanierInformationState();
}

class _PanierInformationState extends State<PanierInformation> {
  Future<List<dynamic>> _getPanierData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("panier")
        .where('email', isEqualTo: widget.u)
        .get();

    List<dynamic> panierData = [];
    for (var docSnapshot in querySnapshot.docs) {
      panierData.addAll(docSnapshot.get('nomObjets'));
    }

    return panierData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Ajouter un Scaffold pour envelopper votre arbre de widgets
      appBar: AppBar(
        title: Text('Titre de l\'appbar'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _getPanierData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else {
            List<dynamic> panierData = snapshot.data!;
            return ListView.builder(
              itemCount: panierData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(panierData[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
