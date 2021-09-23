import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import './input_img.dart';
import 'dart:io';

class AddPlace extends StatefulWidget {
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleCont = TextEditingController();
  File? picSelected;
  void selectedPic(File pickedFile) {
    picSelected = pickedFile;
    // no need to use setState as we dont need to rebuild this widget. just need this file to update global state together!
  }

  void _savePlace() {
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleCont.text, picSelected!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add A New Place'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: _titleCont,
                      ),
                      SizedBox(height: 10),
                      InputImg(selectedPic),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
                onPressed: _savePlace,
                icon: Icon(Icons.add),
                label: Text('Add Place')),
          ],
        ));
  }
}
