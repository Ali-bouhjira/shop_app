import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/screens/login_screen/auth_repository.dart';

final autRepositoryProvider = Provider((ref) {
  return AuthRepository((FirebaseAuth.instance));
});

final autStatProvider = StreamProvider<User?>((ref) {
  return ref.read(autRepositoryProvider).authStateChange;
});

final googleProvider = Provider((ref) {
  return GoogleSignIn();
});

final utilisaterProvider = Provider((ref) {
  return Utilisateur(pdp: '', nom: '');
});
