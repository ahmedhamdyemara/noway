import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';

import 'package:flutter_complete_guide/messages.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_guide/chat_screens.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sqflite/sqflite.dart';
import 'message_bubble.dart';
import 'auth.dart';
import 'message_bubbles.dart';
//import 'package:html/dom.dart';
import 'package:http/http.dart';

class ChatsPage extends StatefulWidget {
  static const routeName = '/heads';

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override

  // _saveDeviceToken() async {
  // String uid = FirebaseAuth.instance.currentUser().toString();
  //   final fbm = FirebaseMessaging();

//    String fcmTocken = await fbm.getToken();
  //  if (fcmTocken != null) {
  //  var tockenRef = Firestore.instance
  //    .collection('users')
  //  .document(uid)
  //.collection('tockens')
  //       .document(fcmTocken);

  // await tockenRef.setData({
  //    'tocken': fcmTocken,
  //  'createdAt': FieldValue.serverTimestamp(),
  //'platform': Platform.operatingSystem,
  //     });
  //  }
  // }

  Widget build(BuildContext context) {
    final oppa = Provider.of<Auth>(context, listen: false).userId;
    final fbm = FirebaseMessaging();

    void _cat() async {
      final user = await FirebaseAuth.instance.currentUser();
      final userData =
          await Firestore.instance.collection('users').document(user.uid).get();
      final lplp = userData.documentID;
      oppa != 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
          ? Firestore.instance.collection('chats').add({
              'createdAt': Timestamp.now(),
              'receiver': '',
              'text': Timestamp.now().toString() + 'receive' + oppa,
              'userId': user.uid,
              'userImage': userData['image_url'],
              'username': userData['username'],
            })
          : Firestore.instance.collection('chat').add({
              'notification': 'notify',
              'username': userData['username'],
              'text': 'if u contacted owner pls check ur messages ',
            });

      Navigator.popAndPushNamed(context, ChatScreens.routeName);
      oppa != 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
          ? Firestore.instance.collection('chatss').add({
              'notifyadmin': 'onenotification',
              'username': userData['username'],
              'text': 'new_message',
            })
          : fbm.subscribeToTopic('chatss');
    }

    void _sendMessage() {
      Navigator.popAndPushNamed(context, ChatScreens.routeName);
    }

    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
              appBar: AppBar(
                title: Text('messages'),
                actions: [
                  DropdownButton(
                    underline: Container(),
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).primaryIconTheme.color,
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.exit_to_app),
                              SizedBox(width: 8),
                              Text('Logout'),
                            ],
                          ),
                        ),
                        value: 'logout',
                      ),
                    ],
                    onChanged: (itemIdentifier) {
                      if (itemIdentifier == 'logout') {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
              body: StreamBuilder(
                  stream: Firestore.instance.collection('users').snapshots(),
                  builder: (ctx, stremSnapshot) {
                    if (stremSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final documentss = stremSnapshot.data.documents;

                    //        final documentsss = documentss.last['image_url'];
                    //         final plpl = documentsss.last;
                    return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            child: IconButton(
                                icon: Icon(Icons.mail), onPressed: _cat),
                          ),
                          oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                              ? Container(
                                  height: 350,
                                  child: ListView.builder(
                                      //  scrollDirection: Axis.horizontal,
                                      itemCount: documentss.length,
                                      itemBuilder: (ctx, index) => Container(
                                          padding: EdgeInsets.all(8),
                                          child: Column(children: [
                                            GestureDetector(
                                                onTap: () {
                                                  _sendMessage();
                                                },
                                                child: CircleAvatar(
                                                    radius: 24,
                                                    backgroundImage:
                                                        NetworkImage(documentss[
                                                                index]
                                                            ['image_url']))),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(documentss[index]['username']),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            //     SelectableText(
                                            //       documentss[index]['text'])
                                          ]))))
                              : Divider()
                        ]);
                  }));
        });
  }
}
