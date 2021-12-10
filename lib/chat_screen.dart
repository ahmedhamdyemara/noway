import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_complete_guide/messages.dart';
import 'package:flutter_complete_guide/new_message.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'auth_screen.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chatcreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
    fbm.subscribeToTopic('chats');
  }

  @override
  Widget build(BuildContext context) {
    final okko = Provider.of<Auth>(context, listen: false).userId;

    return Scaffold(
      appBar: AppBar(
        title: Text(' news '),
        actions: [
          okko == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
              ? DropdownButton(
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
                )
              : Icon(Icons.chat_bubble)
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages(),
            ),
            Provider.of<Auth>(context, listen: false).userId ==
                    'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                ? NewMessage()
                : Container()
          ],
        ),
      ),
    );
  }
}
