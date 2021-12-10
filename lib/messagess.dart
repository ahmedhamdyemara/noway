import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'package:flutter_complete_guide/message_bubbles.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Messagess extends StatefulWidget {
  static const routeName = '/messagess';

  @override
  State<Messagess> createState() => _MessagessState();
}

class _MessagessState extends State<Messagess> {
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

  Widget build(BuildContext context) {
    final oppa = Provider.of<Auth>(context, listen: false).userId;
    // final fbm = FirebaseMessaging();

    //    final blbl = Firestore.instance
    //      .collection('chat')
    //    .where('receiver', isEqualTo: oppa)
//       .orderBy(
    //       'createdAt',
    //       descending: true,
    //  )
    //     .snapshots();

    //  fbm.subscribeToTopic(oppa);

    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder(
            stream: Firestore.instance
                .collection('chats')
                .orderBy(
                  'createdAt',
                  descending: true,
                )
                .snapshots(),
            builder: (ctx, chatSnapshottt) {
              if (chatSnapshottt.connectionState == ConnectionState.waiting) {
                return chatSnapshottt.hasData
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: Text('start your messages'),
                      );
              }

              return oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                  ? StreamBuilder(
                      stream: Firestore.instance
                          .collection('chats')
                          .orderBy(
                            'createdAt',
                            descending: true,
                          )
                          .snapshots(),
                      builder: (ctx, chatSnapshott) {
                        if (chatSnapshott.connectionState ==
                            ConnectionState.waiting) {
                          return chatSnapshott.hasData
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Center(
                                  child: Text('start your messages'),
                                );
                        }
                        final chatDocss = chatSnapshott.data.documents;

                        //              fbm.subscribeToTopic('chats');

                        return ListView.builder(
                          reverse: true,
                          itemCount: chatDocss.length,
                          itemBuilder: (ctx, index) => MessageBubbles(
                            chatDocss[index]['text'],
                            chatDocss[index]['username'],
                            chatDocss[index]['userImage'],
                            chatDocss[index]['userId'] ==
                                futureSnapshot.data.uid,
                            key: ValueKey(chatDocss[index].documentID),
                          ),
                        );
                      })
                  : StreamBuilder(
                      stream: Firestore.instance
                          .collection('chats')
                          .where('receiver', isEqualTo: oppa)
                          .orderBy(
                            'createdAt',
                            descending: true,
                          )
                          .snapshots(),
                      builder: (ctx, chatSnapshot) {
                        if (chatSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return chatSnapshot.hasData
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Center(
                                  child: Text('start your messages'),
                                );
                        }
                        final chatDocs = chatSnapshot.data.documents;

                        //                  chatDocs.last['receiver'] == oppa
                        //                    ? fbm.subscribeToTopic('chats')
                        //                  : fbm.unsubscribeFromTopic('chats');

                        return ListView.builder(
                          reverse: true,
                          itemCount: chatDocs.length,
                          itemBuilder: (ctx, index) => MessageBubbles(
                            chatDocs[index]['text'],
                            chatDocs[index]['username'],
                            chatDocs[index]['userImage'],
                            chatDocs[index]['userId'] ==
                                futureSnapshot.data.uid,
                            key: ValueKey(chatDocs[index].documentID),
                          ),
                        );
                      });
            },
          );
        });
  }
}
