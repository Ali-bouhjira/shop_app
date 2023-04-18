import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/screens/login_screen/providers/auth_provider.dart';
import 'package:shop_app/screens/login_screen/vm/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(LoginStateInitial());

  final Ref ref;

  Future<User?> login(String email, String password) async {
    User? u;
    state = LoginStateLoading();
    try {
      u = await ref
          .read(autRepositoryProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      state = LoginStateSuccess();
      return u;
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  Future<User?> creataccount(String email, String password) async {
    state = LoginStateLoading();

    try {
      Future<User?> u;
       (await ref
          .read(autRepositoryProvider)
          .create(email: email, password: password)) ;
      u= ref.read(logincontrollerprovider.notifier).login(email, password);
      state = LoginStateSuccess();
      return u;
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  void signout() async {
    await ref.read(autRepositoryProvider).signOut();
  }

  Future<String?> getemail() async {
    String? m = await ref.read(autRepositoryProvider).email();
    return m;
  }
}

final logincontrollerprovider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
