import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'dart:io';

class InputImg extends StatefulWidget {
  final Function updateImg;
  InputImg(this.updateImg);
  @override
  _InputImgState createState() => _InputImgState();
}

class _InputImgState extends State<InputImg> {
  File? _storedImg;

  Future<void> _getPic(int mode) async {
    final ImagePicker _picker = ImagePicker();
    var image;
    if (mode == 1) {
      image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 600,
      );
    } else {
      image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600,
      );
    }
    if (image == null) return;
    _storedImg = File(image.path);
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final savedImg = await _storedImg?.copy('${appDir.path}/$fileName');
    widget.updateImg(savedImg);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
            icon: Icon(Icons.photo_library_outlined),
            onPressed: () {
              _getPic(1);
            },
            label: Text('사진 가져오기'),
          ),
          TextButton.icon(
            icon: Icon(Icons.photo_camera),
            onPressed: () {
              _getPic(2);
            },
            label: Text('사진 찍기'),
          ),
        ],
      ),
    );
  }
}
