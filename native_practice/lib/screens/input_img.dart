import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'dart:io';

class InputImg extends StatefulWidget {
  final Function updateImg;
  InputImg(this.updateImg);
  // pass this method from parent widget. if you want to use this method in the state widget, call widget.updateImg(argument);

  @override
  _InputImgState createState() => _InputImgState();
}

class _InputImgState extends State<InputImg> {
  File? _storedImg; //To make nullable add ? behind type!
  // var _storedImg;

  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final image = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImg = File(image!.path);
    });

    final appDir = await syspaths
        .getApplicationDocumentsDirectory(); //get the app directory
    final fileName =
        path.basename(image!.path); //get the temp name of the picture
    final savedImg = await _storedImg?.copy(
        '${appDir.path}/$fileName'); //copy this img and save it in the directory with the name
    // Capture a photo
    // final photo = await _picker.pickImage(source: ImageSource.camera);

    widget.updateImg(savedImg);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImg != null
              ? Image.file(_storedImg!,
                  fit: BoxFit.cover, width: double.infinity)
              : Text('NO IMAGE'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text('Take Photo!'),
          ),
        )
      ],
    );
  }
}
