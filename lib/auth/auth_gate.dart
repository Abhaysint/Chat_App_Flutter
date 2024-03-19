import 'package:chat_app/auth/login_or_regester.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream:  FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshort){
            //user is logged in
            if(snapshort.hasData){
              return  HomePage();
            }
            //user is  mot logged in
            else{
              return const LoginOrRegister();
            }
          },
        ),
    );
  }
}
