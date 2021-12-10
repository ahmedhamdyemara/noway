import 'dart:async';

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_complete_guide/location_input.dart';
import 'package:location/location.dart';
import 'pay.dart';
import 'package:share/share.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'great_places.dart';
import 'map_screen.dart';
import 'auth.dart';
import 'CocoScreen.dart';

class PlaceDetailScreen extends StatefulWidget {
  static const routeName = '/place-detail';

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final mama = Provider.of<GreatPlaces>(context, listen: false).papa;
    final oppa = Provider.of<Auth>(context, listen: false).userId;
    final fbm = FirebaseMessaging();

    //    dynamic yarab = Navigator.of(context).push(MaterialPageRoute(
    //    fullscreenDialog: true,
    //    builder: (ctx) => MapScreen(
    //         initialLocation: mama,
    //         isSelecting: false,
    //        )));

    void _cat() async {
      final user = await FirebaseAuth.instance.currentUser();
      final userData =
          await Firestore.instance.collection('users').document(user.uid).get();
      Firestore.instance.collection('chats').add({
        'createdAt': Timestamp.now(),
        'receiver': '',
        'text': Timestamp.now().toString() +
            'receive' +
            oppa +
            'map' +
            'https://www.google.com/maps/search/?api=1&query=${mama.latitude},${mama.longitude}',
        'userId': user.uid,
        'userImage': userData['image_url'],
        'username': userData['username'],
      });
      oppa != 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
          ? Firestore.instance.collection('chatss').add({
              'notifyadmin': 'onenotification',
              'username': userData['username'],
              'text': 'new_map',
            })
          : fbm.subscribeToTopic('chatss');

      Navigator.of(context).pushNamed(Pay.routeName);
    }

    final dalia = Provider.of<GreatPlaces>(context, listen: false).items;
    Future<void> _goToTheLake() async {
      await Share.share(
          'https://www.google.com/maps/search/?api=1&query=${mama.latitude},${mama.longitude}');
    }
    // final userId = ModalRoute.of(context).settings.arguments;

    //final selectedPlace =
    //  Provider.of<GreatPlaces>(context, listen: false).findById(useridd);

    return Scaffold(
        body: FutureBuilder(
            future: Provider.of<GreatPlaces>(context, listen: false)
                .fetchAndSetPlaces(),
            builder: (ctx, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: Center(
                      child:
                          const Text('Got no places yet, start adding some!'),
                    ),
                    builder: (ctx, greatPlaces, ch) =>
                        greatPlaces.items.length <= 0
                            ? ch
                            :
                            //  Center(
                            //       child: dalia == greatPlaces.userId
                            //      ?
                            Column(
                                children: <Widget>[
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    child:
                                        //  yarab

                                        MapScreen(
                                      initialLocation: greatPlaces.papa,
                                      isSelecting: false,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    greatPlaces.papa.address,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 40,
                                  ),
                                  Stack(children: [
                                    Center(
                                      child: InkWell(
                                          child: Icon(
                                            Icons.maps_home_work_rounded,
                                            size: 60,
                                          ),
                                          onTap: () {
                                            snapshot.connectionState ==
                                                    ConnectionState.waiting
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      fullscreenDialog: true,
                                                      builder: (ctx) =>
                                                          MapScreen(
                                                        initialLocation:
                                                            greatPlaces.papa,
                                                        isSelecting: false,
                                                      ),
                                                    ),
                                                  );
                                          }),
                                    ),
                                    Center(
                                        child: Text(
                                      'view on full map',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.purple.shade400
                                              .withOpacity(0.5)),
                                    )),
                                  ]),

                                  //            FlatButton(
                                  //            child: Text('View on Map'),
                                  //          textColor: Theme.of(context).primaryColor,
                                  //        onPressed: () {
                                  //        Navigator.of(context).push(
                                  //        MaterialPageRoute(
                                  //        fullscreenDialog: true,
                                  //      builder: (ctx) => MapScreen(
                                  //      initialLocation:
                                  //        greatPlaces.items.last.location,
                                  //  isSelecting: false,
                                  //        ),
                                  //    ),
                                  //      );
                                  //       },
                                  //     ),

//IconButton(
                                  //                                    onPressed: (){
                                  //                                      snapshot.connectionState ==
                                  //                                            ConnectionState.waiting
                                  //                                      ? Center(
                                  //                                        child:
                                  //                                          CircularProgressIndicator(),
                                  //                                  )
                                  //                              : _goToTheLake();}
                                  //                    icon: Icon(Icons.directions_boat),
                                  //     alignment: Alignment.bottomRight,

                                  SizedBox(
                                    height: 40,
                                  ),

                                  Stack(children: [
                                    Center(
                                      child: InkWell(
                                          child: Icon(
                                            Icons.share,
                                            size: 60,
                                            semanticLabel:
                                                'wait a second or add new location',
                                          ),
                                          onTap: () {
                                            snapshot.connectionState ==
                                                    ConnectionState.waiting
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : _goToTheLake();
                                          }),
                                    ),
                                    Center(
                                        child: Text(
                                      'share location',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.purple.shade400
                                              .withOpacity(0.5)),
                                    )),
                                  ]),
                                  SizedBox(
                                    height: 40,
                                  ),

                                  //        Stack(children: [
                                  //        Center(
                                  //          child: InkWell(
                                  //            child: Icon(
                                  //            Icons.payments_sharp,
                                  //          size: 40,
                                  //                   ),
                                  //                 onTap: () {
                                  //                 Navigator.of(context)
                                  //                   .pushNamed(CocoScreen.routeName);
                                  //              })),
                                  //                         Center(
                                  //                           child: Text(
                                  //                       'purchase now !',
                                  //                     style: TextStyle(
                                  //                       fontSize: 26,
                                  //                     color: Colors.purple.shade400
                                  //                       .withOpacity(0.5)),
                                  //           )),
                                  //       ]),
                                  RaisedButton.icon(
                                    icon: Icon(Icons.payments_sharp),
                                    label: Text('pick purchare method'),
                                    onPressed: _cat,
                                    elevation: 0,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    color: Theme.of(context).backgroundColor,
                                  ),

                                  //         FlatButton(
                                  //           child: Text('purchase now'),
                                  //         textColor: Theme.of(context).primaryColor,
                                  //       onPressed: () {
                                  //       Navigator.of(context)
                                  //         .pushNamed(CocoScreen.routeName);
                                  //                                })
                                ],
                              )
                    //   : Text('add new place'),
                    )));
  }
}
