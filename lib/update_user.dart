import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_complete_guide/auth_form.dart';
import 'package:flutter_complete_guide/fuck.dart';
import 'chat_screen.dart';

class UpdateUser extends StatefulWidget {
  static const routeName = '/updateuser';

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _controller = new TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    final userData =
        await Firestore.instance.collection('users').document(user.uid).get();
    Firestore.instance.collection('users').document(user.uid).updateData({
      //  'text': _enteredMessage,
      //   'createdAt': Timestamp.now(),
      //   'userId': user.uid,
      //    'email' : _enteredMessage,
      'username': _enteredMessage,
      'userImage': userData['image_url']
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              //       textCapitalization: TextCapitalization.sentences,
              //     autocorrect: true,
              //       enableSuggestions: true,
              decoration: InputDecoration(labelText: 'change ur admin email'),
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
              Icons.email,
            ),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          )
        ],
      ),
    );
  }
}
