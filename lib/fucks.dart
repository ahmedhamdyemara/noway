import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';
import 'package:flutter_complete_guide/auth_screen.dart';
import 'package:flutter_complete_guide/chat_screen.dart';
import 'package:flutter_complete_guide/splash_screen.dart';
import 'heads.dart';

class Fucks extends StatelessWidget {
  static const routeName = '/Fucks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            //       final opp = userSnapshot.data.ge;
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }
            //      final oppas = Provider.of<Auth>(context, listen: false).userId;
            if (userSnapshot.hasData) {
              return ChatsPage();
            }
            return AuthScreen();
          }),
    );
  }
}
