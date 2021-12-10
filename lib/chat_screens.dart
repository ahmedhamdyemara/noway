import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_complete_guide/heads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';
import 'package:flutter_complete_guide/messagess.dart';
import 'package:flutter_complete_guide/new_messages.dart';
import 'orders_screen.dart';
//import 'messagess.dart';
//import 'new_messages.dart';

class ChatScreens extends StatefulWidget {
  static const routeName = '/chatcreens';

  @override
  _ChatScreensState createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  @override
  void initState() {
    super.initState();
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg) {
      print(msg);
      return;
    }, onLaunch: (msg) {
      print(msg);
      return;
    }, onResume: (msg) {
      print(msg);
      return;
    });
    fbm.subscribeToTopic('chat');
  }

  @override
  Widget build(BuildContext context) {
    // final oppa = Provider.of<Auth>(context, listen: false).userId;

    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.popAndPushNamed(context, OrdersScreen.routeName),
              icon: Icon(Icons.home)),
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
              }
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messagess(),
            ),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}
