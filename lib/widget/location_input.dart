import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatelessWidget {


  String? _previewImageUrl ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1)
          ),
          height: 170,
          width: double.infinity,
          child: _previewImageUrl==null?Text('No location Added', textAlign: TextAlign.center,):
          Image.network(_previewImageUrl!,fit: BoxFit.cover,width: double.infinity,),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(onPressed: (){}, icon:Icon(Icons.location_on) , label: Text('Current Location')),
            TextButton.icon(onPressed: (){}, icon:Icon(Icons.map) , label: Text('Select on Map')),

          ],
        )
      ],
    );
  }
}
