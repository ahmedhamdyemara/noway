import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/CocoScreen.dart';
import 'package:flutter_complete_guide/chat_screens.dart';
import 'package:flutter_complete_guide/place.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'pay.dart';
import 'package:flutter_complete_guide/auth_screen.dart';
//import 'package:flutter_complete_guide/chat_screen.dart';

import 'heads.dart';
import 'messagess.dart';
import 'new_messages.dart';
import '/splash_screenn.dart';
import '/cart_screen.dart';
import '/products_overview_screen.dart';
import '/product_detail_screen.dart';
import '/products.dart';
import '/cart.dart';
import '/orders.dart';
import '/auth.dart';
import '/orders_screen.dart';
import '/user_products_screen.dart';
import '/edit_product_screen.dart';
import 'chat_screen.dart';
import 'chat_screens.dart';
import '/auth_screeeen.dart';
import 'fuck.dart';
import 'great_places.dart';
import 'places_list_screen.dart';
import 'add_place_screen.dart';
import 'place_detail_screen.dart';
import 'Makan.dart';
import 'place.dart';
import 'CocoScreen.dart';
import 'fucks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, GreatPlaces>(
            update: (ctx, auth, previousgreatplaces) => GreatPlaces(
                  auth.userId,
                  previousgreatplaces == null ? [] : previousgreatplaces.items,
                  previousgreatplaces == null
                      ? PlaceLocation(latitude: 0, longitude: 0)
                      : previousgreatplaces.papa,
                ))
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Daliah House',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            backgroundColor: Colors.indigo,
            accentColorBrightness: Brightness.dark,
            dialogBackgroundColor: Colors.grey,
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.teal,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreenn()
                          : AuthScreenn(),
                ),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            Fuck.routeName: (ctx) => Fuck(),
            AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
            PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
            Makan.routeName: (ctx) => Makan(),
            PlacesListScreen.routeName: (ctx) => PlacesListScreen(),
            CocoScreen.routeName: (ctx) => CocoScreen(),
            ChatsPage.routeName: (ctx) => ChatsPage(),
            ChatScreens.routeName: (ctx) => ChatScreens(),
            Fucks.routeName: (ctx) => Fucks(),
            ChatScreen.routeName: (ctx) => ChatScreen(),
            Pay.routeName: (ctx) => Pay()
          },
        ),
      ),
    );
  }
}
