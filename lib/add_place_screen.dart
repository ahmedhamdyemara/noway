import 'dart:io';
//import 'dart:js_util';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/orders.dart';
import 'package:flutter_complete_guide/orders_screen.dart';
import 'package:flutter_complete_guide/places_list_screen.dart';
import 'package:flutter_complete_guide/products_overview_screen.dart';
import 'package:provider/provider.dart';

import 'image_input.dart';
import 'location_input.dart';
import 'great_places.dart';
import 'place.dart';
import 'Makan.dart';
import 'orders_screen.dart';
import 'place_detail_screen.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;
  PlaceLocation _pickedLocation;
  String ahmed;

  void selectedahmed(String userId) {
    ahmed = userId;
  }

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = PlaceLocation(latitude: lat, longitude: lng);
  }

  void _savePlace() {
    if (_pickedLocation == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage, _pickedLocation, ahmed);

    Navigator.of(context).pop();

    Navigator.popAndPushNamed(
      context,
      OrdersScreen.routeName,
    );

    //  Navigator.pushNamed(context, Makan.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.directions_boat_filled_sharp),
            label: Text('confirm location'),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
