import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/auth_screen.dart';
import 'package:flutter_complete_guide/orders.dart';
import 'package:flutter_complete_guide/pay.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '/orders_screen.dart';
import '/user_products_screen.dart';
import '/auth.dart';
import 'badge.dart';
import 'great_places.dart';
import 'fuck.dart';
import 'fucks.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final oppa = Provider.of<Auth>(context, listen: false).userId;

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
              Provider.of<GreatPlaces>(context, listen: false).items.clear();
              Provider.of<Orders>(context, listen: false).orders.clear();
            },
          ),
          Divider(),
          Provider.of<Auth>(context, listen: false).userId ==
                  'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
              ? ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Manage Products'),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(UserProductsScreen.routeName);
                  },
                )
              : Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');

              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
          Divider(),

          StreamBuilder(
              stream: Firestore.instance
                  .collection('chat')
                  .orderBy(
                    'createdAt',
                    descending: true,
                  )
                  .snapshots(),
              builder: (ctx, chattSnapshot) {
                if (chattSnapshot.connectionState == ConnectionState.waiting) {
                  return chattSnapshot.hasData
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListTile(
                          leading: Icon(Icons.feed_rounded),
                          title: Text('news feed'),
                          onTap: () {
                            Navigator.of(context).pushNamed(Fuck.routeName);
                          },
                        );
                }
                final chattDocs = chattSnapshot.data.documents;

                return ListTile(
                  leading: Badge(
                    value: chattDocs.length.toString(),
                    child: IconButton(
                      icon: Icon(
                        Icons.feed_outlined,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Fuck.routeName);
                      },
                    ),
                  ),
                  title: Text('news'),
                  onTap: () {
                    Navigator.of(context).pushNamed(Fuck.routeName);
                  },
                );
              }),

          Divider(),
          oppa != 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
              ? StreamBuilder(
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
                          : ListTile(
                              leading: Icon(Icons.messenger_rounded),
                              title: Text('contact owner'),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Fucks.routeName);
                              },
                            );
                    }
                    final chatDocs = chatSnapshot.data.documents;

                    return ListTile(
                      leading: Badge(
                        value: chatDocs.length.toString(),
                        child: IconButton(
                          icon: Icon(
                            Icons.messenger_rounded,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(Fucks.routeName);
                          },
                        ),
                      ),
                      title: Text('contact owner'),
                      onTap: () {
                        Navigator.of(context).pushNamed(Fucks.routeName);
                      },
                    );
                  })
              : StreamBuilder(
                  stream: Firestore.instance
                      .collection('chats')
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
                          : ListTile(
                              leading: Icon(Icons.messenger_rounded),
                              title: Text('contact owner'),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Fucks.routeName);
                              },
                            );
                    }
                    final chatDocs = chatSnapshot.data.documents;
                    chatDocs.length != chatDocs.length
                        ? FirebaseMessaging().onTokenRefresh
                        : null;
                    return ListTile(
                      leading: Badge(
                        value: chatDocs.length.toString(),
                        child: IconButton(
                          icon: Icon(
                            Icons.messenger_rounded,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(Fucks.routeName);
                          },
                        ),
                      ),
                      title: Text('contact owner'),
                      onTap: () {
                        Navigator.of(context).pushNamed(Fucks.routeName);
                      },
                    );
                  }),

          //     Divider(),
          //   Provider.of<Auth>(context, listen: false).userId ==
          //         'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
          //   ? ListTile(
          //     leading: Icon(Icons.exit_to_app_rounded),
          //   title: Text('Logout chat admin'),
          //       onTap: () {
          //       Navigator.of(context).pop();
          //     Navigator.of(context).pushNamed(AuthScreen.routeName);

          //   FirebaseAuth.instance.signOut();

          // Navigator.of(context)
          //     .pushReplacementNamed(UserProductsScreen.routeName);
          // Provider.of<Auth>(context, listen: false).logout();
          //        },
          //       )
          //       :
          Divider(),
          ListTile(
            leading: Icon(Icons.messenger_outline_sharp),
            title: Text(
              'contact me at +20 1001019938  whatsapp',
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
