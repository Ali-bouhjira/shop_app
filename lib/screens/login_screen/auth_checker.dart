import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_screen/login.dart';
import 'package:shop_app/screens/login_screen/providers/auth_provider.dart';

class Authchecker extends ConsumerWidget {
  const Authchecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _AuthState = ref.watch(autStatProvider);
    return _AuthState.when(
        data: (user) {
          if (user != null) return HomeScreen(user.email);
          return LoginScreen();
        },
        error: (e, trace) => LoginScreen(),
        loading: () => SplashScreen());
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
