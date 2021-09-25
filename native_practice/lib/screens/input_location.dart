import 'package:location/location.dart';
import 'package:flutter/material.dart';
import '../helpers/location_helper.dart';
import './map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InputLocation extends StatefulWidget {
  @override
  _InputLocationState createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  String? _previewImgUrl;
  Future<void> _getCurrentLocation() async {
    Location location = new Location();
    final _locationData = await location.getLocation();
    final staticMapUrl = LocationHelper.genLocPrevImg(
        latitude: _locationData.latitude as double,
        longitude: _locationData.longitude as double);
    setState(() {
      _previewImgUrl = staticMapUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final selectedPlace = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => MapScreen(
          isSelected: true,
        ),
      ),
    );
    if (selectedPlace == null) return;
    print(selectedPlace.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImgUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImgUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
            ),
          ],
        )
      ],
    );
  }
}
