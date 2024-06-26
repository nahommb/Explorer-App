import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {


  File? _storedImage;

  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (imageFile != null) {
      setState(() {
        _storedImage = File(imageFile.path);
      });
      File savedImage = File(imageFile.path);
    final appDir = await syspaths.getApplicationSupportDirectory();
    final fileName = basename(imageFile.path);
    savedImage = await savedImage.copy('${appDir.path}/$fileName');
    print('nahommmmm$savedImage');
    widget.onSelectImage(savedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey),
          ),
          child: _storedImage!=null ? Image.file(_storedImage!,fit: BoxFit.cover,width: double.infinity,):Text('No Image Taken',textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10,),
        Expanded(child: TextButton.icon(
          onPressed: (){
            _takePicture();
          },
          icon: Icon(Icons.camera),
          label: Text('Take Picture'),))
      ],
    );
  }
}
