import 'dart:math';

import 'package:explorer_app/providers/great_places.dart';
import 'package:explorer_app/widget/image_input.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {

 static String routName = 'add_place_screen';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectedImage(File pickedImage){
    _pickedImage = pickedImage;
  }
  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage==null){
      print('messi');
      return;
  }
    Provider.of<GreatePlaces>(context,listen:false).addPlace(_titleController.text, _pickedImage!);
    Navigator.pop(context);
    print('lee');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a New Place'),),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: "title"
                    ),
                  ),
                  SizedBox(height: 10,),
                  ImageInput(_selectedImage)
                ],
              ),
            ),
          )),
          Text('user inputs'),
          ElevatedButton.icon(
            onPressed: (){
              _savePlace();
            },
            icon: Icon(Icons.add),
            label: Text('Add Place'),
          )
          
        ],
      ),
    );


  }
}
