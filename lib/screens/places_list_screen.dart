import 'package:explorer_app/providers/great_places.dart';
import 'package:explorer_app/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future: Provider.of<GreatePlaces>(context).fetchAndSetData(),
        builder: (ctx,snapshot)=>snapshot.connectionState==ConnectionState.waiting?
        Center(child: CircularProgressIndicator(),) : Consumer<GreatePlaces>(
          builder: (ctx,greatPlace,child)=>greatPlace.items.length<=0?Center(
            child: Text('no places yet added'),
          ):ListView.builder(
            itemCount: greatPlace.items.length,
            itemBuilder: (ctx,index)=>ListTile(
              leading: CircleAvatar(backgroundImage: FileImage(greatPlace.items[index].image,)),
              title: Text(greatPlace.items[index].title),
            ),
          ),
        ),
      ),
    );
  }
}
