import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_screen.dart';
import 'great_places.dart';
import 'places_list_screen.dart';
import 'add_place_screen.dart';
import 'place_detail_screen.dart';
import 'auth.dart';
import 'splash_screen.dart';

class Makan extends StatelessWidget {
  static const routeName = '/Makan';

  @override
  Widget build(BuildContext context) {
    final ekram = Provider.of<GreatPlaces>(context, listen: false).userId;
    final hamdy = Provider.of<GreatPlaces>(context, listen: false).items;
    final hamada = Provider.of<GreatPlaces>(context, listen: false).papa;

    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return SplashScreen();
              }
              if (userSnapshot.hasData) {
                return ChangeNotifierProvider.value(
                  value: GreatPlaces(ekram, hamdy, hamada),
                  child: PlacesListScreen(),
                );
              }

              return AuthScreen();
            }));
  }
}
