import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:native_practice/providers/place.dart';
import '../helpers/location_helper.dart';
import './map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InputLocation extends StatefulWidget {
  final Function onSelectPlace;
  InputLocation(this.onSelectPlace);
  @override
  _InputLocationState createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  String? _previewImgUrl;

  void _getPreview(double lat, double lng) {
    final staticMapUrl =
        LocationHelper.genLocPrevImg(latitude: lat, longitude: lng);
    setState(() {
      _previewImgUrl = staticMapUrl;
    });
  }

  Future<void> _getCurrentLocation() async {
    Location location = new Location();
    try {
      final _locationData = await location.getLocation();
      _getPreview(
          _locationData.latitude as double, _locationData.longitude as double);
      widget.onSelectPlace(_locationData.latitude, _locationData.longitude);
    } catch (err) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    Location location = new Location();
    final _locData = await location.getLocation();
    final selectedPlace = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => MapScreen(
          initialLocation:
              PlaceLocation(latitude: _locData.latitude as double, longitude: _locData.longitude as double),
          isSelected: true,
        ),
      ),
    );
    if (selectedPlace == null) return;
    _getPreview(selectedPlace.latitude, selectedPlace.longitude);
    widget.onSelectPlace(selectedPlace.latitude, selectedPlace.longitude);
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
