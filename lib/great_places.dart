import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'place.dart';
import 'db_helper.dart';
import 'location_helper.dart';
import 'auth.dart';
import 'Makan.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  String userId;
  PlaceLocation papa;
  GreatPlaces(this.userId, this._items, this.papa);

  List<Place> get items {
    return [..._items];
  }

  PlaceLocation get sasa {
    return papa;
  }

  Place findById(useridd) {
    return _items.lastWhere((place) => place.useridd == userId);
  }

  int findbyindex(index) {
    return _items.indexWhere((element) => false);
  }

  Future<void> addPlace(
    String pickedTitle,
    File pickedImage,
    PlaceLocation pickedLocation,
    String userId,
  ) async {
    final address = await LocationHelper.getPlaceAddress(
        pickedLocation.latitude, pickedLocation.longitude);
    final updatedLocation = PlaceLocation(
      latitude: pickedLocation.latitude,
      longitude: pickedLocation.longitude,
      address: address,
    );
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: updatedLocation,
      useridd: userId,
    );
    papa = newPlace.location;
    // _items.remove(0);
    _items.add(newPlace);

    // _items.length = 1;

    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address,
      'useridd': newPlace.useridd,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
            useridd: item['useridd'],
          ),
        )
        .toList();
    //   _items.reversed.toList();
    _items.length = 1;

    notifyListeners();
  }
}
