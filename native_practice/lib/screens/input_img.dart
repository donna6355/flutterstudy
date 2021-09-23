import 'package:flutter/material.dart';
import 'dart:io';

class InputImg extends StatefulWidget {
  @override
  _InputImgState createState() => _InputImgState();
}

class _InputImgState extends State<InputImg> {
  File? _storedImg; //To make nullable add ? behind type!
  // var _storedImg also works
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
            onPressed: () {},
            icon: Icon(Icons.camera),
            label: Text('Take Photo!'),
          ),
        )
      ],
    );
  }
}
