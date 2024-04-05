import 'package:explorer_app/screens/add_place_screen.dart';
import 'package:flutter/material.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Places'),
      actions: [
        IconButton(
            onPressed: (){
              Navigator.pushNamed(context, AddPlaceScreen.routName);
            },
            icon: Icon(Icons.add)
        )
      ],),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
