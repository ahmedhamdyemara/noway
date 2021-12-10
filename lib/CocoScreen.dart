import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'place_detail_screen.dart';

class CocoScreen extends StatelessWidget {
  static const routeName = '/CocoScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      'purshace method',
      textAlign: TextAlign.center,
    )));
  }
}
