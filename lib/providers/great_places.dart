import 'package:explorer_app/helpers/db_helper.dart';
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
    DBHelper.insert('user_places',
      {
        'id':newPlace.id,
        'title':newPlace.title,
        'image':newPlace.image.path
      }
    );
  }

  Future<void> fetchAndSetData() async{
   final dataList = await DBHelper.getData('user_places');
   // print('lekoajijej chhhhhhhhhhhhhhhecccccccck$dataList');
   // _items.clear();
   // for(int i =0; i<dataList.length;i++){
   //   _items.add(Place(id: dataList[i]['id'],
   //       title:dataList[i]['title'],
   //       loacation: null,
   //       image: File(dataList[i]['image'])));
   // }
    _items = dataList.map((items)=>
        Place(id: items['id'],
            title:items['title'],
            loacation: null,
            image: File(items['image']))).toList();
    notifyListeners();
  }
}
