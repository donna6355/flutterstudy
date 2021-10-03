import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImgPicker extends StatefulWidget {
  final Function imgUpload;
  ImgPicker(this.imgUpload);

  @override
  _ImgPickerState createState() => _ImgPickerState();
}

class _ImgPickerState extends State<ImgPicker> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImg;

  Future<void> pickImg() async {
    final XFile? img = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    setState(() {
      _pickedImg = File(img!.path);
    });
    widget.imgUpload(_pickedImg);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: _pickedImg == null ? null : FileImage(_pickedImg!),
        ),
        TextButton.icon(
          onPressed: pickImg,
          icon: Icon(Icons.image),
          label: Text('Add image'),
        ),
      ],
    );
  }
}
