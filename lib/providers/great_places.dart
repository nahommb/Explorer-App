import 'package:explorer_app/models/place.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class GreatePlaces with ChangeNotifier{

  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
  void addPlace(String title,File pickedImage){
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        loacation: null,
        image: pickedImage
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
