import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_complete_guide/great_places.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '/orders.dart' show Orders;
import '/order_item.dart';
import '/app_drawer.dart';
import 'package:flutter_complete_guide/auth_screen.dart';
import 'package:flutter_complete_guide/chat_screen.dart';
import 'fuck.dart';
import 'Makan.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    print('building orders');
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<Orders>(
                        builder: (ctx, orderData, child) => Container(
                            height: 350,
                            child: ListView.builder(
                              itemCount: orderData.orders.length,
                              itemBuilder: (ctx, i) =>
                                  OrderItem(orderData.orders[i]),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                            ))),
                    Container(
                        child: SingleChildScrollView(
                            child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        Text('start purchasing!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple.shade300.withOpacity(0.5),
                            )),
                        IconButton(
                          icon: Icon(Icons.payments_sharp),
                          iconSize: 60,
                          color: Colors.purple.shade400,
                          onPressed:
                              (Provider.of<Orders>(context, listen: false)
                                          .orders
                                          .length <=
                                      0)
                                  ? () => SnackBar(
                                        content: Text(
                                          'Add product to ur cart and order first!',
                                        ),
                                        duration: Duration(seconds: 2),
                                      )
                                  : () => Navigator.of(context)
                                      .pushNamed(Makan.routeName),
                        ),
                      ],
                    ))),
                    (Provider.of<GreatPlaces>(context, listen: false)
                                .items
                                .length >
                            0)
                        ? Container(
                            alignment: Alignment.center,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment : CrossAxisAlignment.center
                                children: [
                                  Text(
                                    '^',
                                    style: TextStyle(
                                        color: Colors.red.shade700,
                                        fontSize: 35),
                                  ),
                                  AnimatedTextKit(
                                    animatedTexts: [
                                      ColorizeAnimatedText(
                                          'press again your location is ready ',
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
                                  SizedBox(height: 5),
                                ]))
                        : SizedBox(height: 10),
                    Center(
                        child: (Provider.of<Orders>(context, listen: false)
                                    .orders
                                    .length <=
                                0)
                            ? Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'add product to the cart and order it to be able to purchse',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red),
                                  textAlign: TextAlign.center,
                                ))
                            : Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '<ت>',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue.shade200),
                                  textAlign: TextAlign.center,
                                )))
                  ]);
            }
          }
        },
      ),
    );
  }
}
