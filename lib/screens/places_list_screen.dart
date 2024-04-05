import 'package:flutter/material.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Places'),
      actions: [
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.add)
        )
      ],),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
