import 'dart:async';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:share/share.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import 'great_places.dart';
import './place_detail_screen.dart';
import 'auth.dart';

class PlacesListScreen extends StatefulWidget {
  static const routeName = 'PlaceListScreen';

  @override
  State<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    // final dalia = Provider.of<Auth>(context).userId;
    return Scaffold(
      appBar: AppBar(
        title: Text('change location! '),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.popAndPushNamed(context, AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Provider.of<GreatPlaces>(context, listen: false).items.isEmpty
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  IconButton(
                    icon: Icon(Icons.directions),
                    iconSize: 60,
                    onPressed: () {
                      Navigator.popAndPushNamed(
                          context, AddPlaceScreen.routeName);
                    },
                  ),
                  Text('add location to continue purchasing')
                ]))
          : PlaceDetailScreen(),
    );
  }
}
