import 'package:explorer_app/widget/image_input.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {

 static String routName = 'add_place_screen';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {


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
                    decoration: InputDecoration(
                      labelText: "title"
                    ),
                  ),
                  SizedBox(height: 10,),
                  ImageInput()
                ],
              ),
            ),
          )),
          Text('user inputs'),
          ElevatedButton.icon(
            onPressed: (){},
            icon: Icon(Icons.add),
            label: Text('Add Place'),
          )
          
        ],
      ),
    );


  }
}
