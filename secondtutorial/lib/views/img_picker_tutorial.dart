import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/user.dart';

class ImgPickerTutorial extends StatefulWidget {
  const ImgPickerTutorial({Key? key}) : super(key: key);

  @override
  State<ImgPickerTutorial> createState() => _ImgPickerTutorialState();
}

class _ImgPickerTutorialState extends State<ImgPickerTutorial> {
  final ImagePicker _picker = ImagePicker();
  XFile? _newImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('img picker tutorial')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipOval(
              child: _newImage == null
                  ? Container(width: 200, height: 200, color: Colors.black26)
                  : Image.file(
                      File(_newImage!.path),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          TextButton(
            onPressed: () async {
              final XFile? _selectedImage = await _picker.pickImage(
                  source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
              if (_selectedImage != null) {
                setState(() {
                  _newImage = _selectedImage;
                });
              }
            },
            child: const Text('pick me!'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () async {
                UserManager().setUser = User(id: 'Isaac', nickname: 'Isaac');
              },
              child: const Text('set user'))
        ],
      ),
    );
  }
}
