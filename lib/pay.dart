import 'package:flutter_complete_guide/messages.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_guide/chat_screens.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'orders.dart';
import 'fucks.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'message_bubble.dart';
import 'auth.dart';

//import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart';

class Pay extends StatefulWidget {
  static const routeName = '/pay';
  //  double egmaly;
  @override
  State<Pay> createState() => PayState();
}

class PayState extends State<Pay> {
  bool _usecash = false;

  @override
  Widget build(BuildContext context) {
    final egmaly =
        Provider.of<Orders>(context, listen: false).orders.last.amount;

    return Scaffold(
        appBar: AppBar(
          title: Text('payment'),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          Center(
              child: ElevatedButton(
                  child: Text('paypal'),
                  onPressed: () async {
                    var request = BraintreeDropInRequest(
                        tokenizationKey: 'sandbox_d5s9y4pt_dv45vwxtpwvkh7g9',
                        collectDeviceData: true,
                        paypalRequest: BraintreePayPalRequest(
                            amount: '$egmaly', displayName: 'dahlia house'),
                        cardEnabled: true);
                    BraintreeDropInResult result =
                        await BraintreeDropIn.start(request);
                    if (result != null) {
                      print(result.paymentMethodNonce.description);
                      print(result.paymentMethodNonce.nonce);
                    }
                  })),
          SizedBox(height: 20),
          Container(
            height: 23,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('use Cash'),
                Switch(
                  value: _usecash,
                  onChanged: (val) {
                    setState(() {
                      _usecash = val;
                    });
                  },
                ),
              ],
            ),
          ),
          _usecash
              ? Container(
                  height: 30,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                          'congrats,, stay in contact with us till u got ur order',
                          colors: [
                            Colors.amber,
                            Colors.blue,
                            Colors.pinkAccent,
                            Colors.purpleAccent
                          ],
                          textStyle: TextStyle(
                            fontSize: 13,
                          ),
                          speed: Duration(milliseconds: 100)),
                    ],
                    totalRepeatCount: 999999999999999999,
                  ),
                )
              : Divider(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('keep in touch till u got ur order'),
            onTap: () {
              Navigator.of(context).pushNamed(Fucks.routeName);
            },
          ),
        ]));
  }
}
