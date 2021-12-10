import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_complete_guide/auth_screen.dart';
import 'package:flutter_complete_guide/chat_screen.dart';
import 'package:flutter_complete_guide/splash_screen.dart';
import 'auth.dart';

class Fuck extends StatelessWidget {
  static const routeName = '/Fuck';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }
            //      if (userSnapshot.hasData) {

            if (Provider.of<Auth>(context, listen: false).userId ==
                'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2') {
              if (userSnapshot.hasData) {
                return ChatScreen();
              }

              return AuthScreen();
            }

            return ChatScreen();
            //    }
            //        return AuthScreen();
          }),
    );
  }
}
