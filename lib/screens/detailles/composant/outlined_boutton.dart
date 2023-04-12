import 'package:flutter/material.dart';

SizedBox BuildOutlineButton(IconData icon,Function press){
  return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(

      style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
      EdgeInsets.zero, // Définir la marge intérieure souhaitée
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8.0), // Définir le rayon de bordure souhaité
  ),
  ),
  ),
  onPressed: () {press();},
  child: Icon(icon),

  ));
}