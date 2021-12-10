import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';

import 'package:flutter_complete_guide/chat_screens.dart';
import 'heads.dart';
import 'orders_screen.dart';

class NewMessages extends StatefulWidget {
  static const routeName = '/newmessages';

  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = new TextEditingController();
  var _enteredMessage = '';
  final _controllerr = new TextEditingController();
  var _receiverurl = '';
  void _sendMessage(oppa) async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    final userData =
        await Firestore.instance.collection('users').document(user.uid).get();

    oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
        ? Firestore.instance.collection('chats').add({
            'createdAt': Timestamp.now(),
            'receiver': _receiverurl,
            'text': _enteredMessage,
            'userId': user.uid,
            'userImage': userData['image_url'],
            'username': userData['username'],
          })
        : Firestore.instance.collection('chats').add({
            'createdAt': Timestamp.now(),
            'receiver': oppa,
            'text': _enteredMessage,
            'userId': user.uid,
            'userImage': userData['image_url'],
            'username': userData['username'],
          });

    _controller.clear();

    //   FirebaseAuth.instance.currentUser();
//    Navigator.of(context).pop();

    Navigator.popAndPushNamed(
      context,
      OrdersScreen.routeName,
    );
    //  Navigator.of(context).pop();

    Navigator.popAndPushNamed(
      context,
      ChatScreens.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final oppa = Provider.of<Auth>(context, listen: false).userId;

    return Container(
        height: 250,
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.all(8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                  ? Expanded(
                      child: TextField(
                        controller: _controllerr,
                        textCapitalization: TextCapitalization.sentences,
                        autocorrect: true,
                        enableSuggestions: true,
                        decoration:
                            InputDecoration(labelText: 'enter receiver url'),
                        onChanged: (value) {
                          setState(() {
                            _receiverurl = value;
                          });
                        },
                      ),
                    )
                  : Divider(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: true,
                      enableSuggestions: true,
                      decoration:
                          InputDecoration(labelText: 'Send a message...'),
                      onChanged: (value) {
                        setState(() {
                          _enteredMessage = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: Icon(
                      Icons.send,
                    ),
                    onPressed: _enteredMessage.trim().isEmpty
                        ? null
                        : () => _sendMessage(oppa),
                  )
                ],
              ),
            ]));
  }
}
