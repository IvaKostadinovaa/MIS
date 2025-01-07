import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/database_service.dart';
import '../models/event.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _initialPosition = LatLng(41.9981, 21.4254); 
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    final events = await DatabaseService().getEventsByDate('');
    setState(() {
      _markers = events
          .where((event) => event.latitude != null && event.longitude != null)
          .map((event) {
        return Marker(
          markerId: MarkerId(event.id.toString()),
          position: LatLng(event.latitude!, event.longitude!),
          infoWindow: InfoWindow(
            title: event.title,
            snippet: event.description,
          ),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Locations'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12.0,
        ),
        markers: Set.from(_markers),
      ),
    );
  }
}
