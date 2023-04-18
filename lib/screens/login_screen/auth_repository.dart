import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/user.dart';

class AuthRepository{
   AuthRepository(this._auth);
  final FirebaseAuth _auth ;


  Stream<User?> get authStateChange => _auth.idTokenChanges();
  late User user ;



  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {

     try{

       final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
       user = result.user!;

       return result.user ;

     }on FirebaseAuthException catch (e){
        throw AuthException(e.code);

     }

  }

  Future<String?> email(
  ) async {

    try{
      return _auth.currentUser?.email;

    }on FirebaseAuthException catch (e){
      throw AuthException(e.code);

    }

  }


  Future<User?> create({
    required String email,
    required String password,
  }) async {

    try{
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      return result.user ;

    }on FirebaseAuthException catch (e){
       throw AuthException(e.code.toString());

    }

  }

  Future<void>signOut() async {
    await _auth.signOut();
  }
}

class AuthException implements Exception{
  final String message;
  AuthException(this.message);
  @override
  String toString(){
    return message;
  }
}