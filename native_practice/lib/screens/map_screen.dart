import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelected;

  MapScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 40.6892, longitude: -74.0445),
      this.isSelected = false});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedPlace;
  void _selectPlace(LatLng position) {
    setState(() {
      _selectedPlace = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: [
          if (widget.isSelected)
            IconButton(
              onPressed: _selectedPlace == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_selectedPlace);
                    },
              icon: Icon(Icons.check),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLocation.latitude,
              widget.initialLocation.longitude),
          zoom: 16,
        ),
        onTap: widget.isSelected ? _selectPlace : null,
        markers: (_selectedPlace == null && widget.isSelected)
            ? {}
            : {
                Marker(
                    markerId: MarkerId('m1'),
                    position: _selectedPlace == null
                        ? LatLng(widget.initialLocation.latitude,
                            widget.initialLocation.longitude)
                        : _selectedPlace as LatLng),
              },
      ),
    );
  }
}
