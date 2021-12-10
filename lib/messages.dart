import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_complete_guide/message_bubble.dart';

class Messages extends StatefulWidget {
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
    //  return FutureBuilder(
    //  future: FirebaseAuth.instance.currentUser(),
    //    builder: (ctx, futureSnapshot) {
    //    if (futureSnapshot.connectionState == ConnectionState.waiting) {
    //        return Center(
    //        child: CircularProgressIndicator(),
    //      );
    //     }
    return StreamBuilder(
        stream: Firestore.instance
            .collection('chat')
            .where('image_url')
            .orderBy(
              'createdAt',
              descending: true,
            )
            .snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = chatSnapshot.data.documents;
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (ctx, index) => MessageBubble(
              chatDocs[index]['text'],
              chatDocs[index]['username'],
              chatDocs[index]['userImage'],
              //       chatDocs[index]['userId']
              //    == futureSnapshot.data.uid,
              //             key: ValueKey(chatDocs[index].documentID),
            ),
          );
        });
//      },
    //  );
  }
}
