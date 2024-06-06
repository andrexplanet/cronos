import 'package:cronos/services/auth/login_or_register.dart';
import 'package:cronos/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //logeado
          if (snapshot.hasData) {
            return HomePage();
          }

          //no logeado
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}