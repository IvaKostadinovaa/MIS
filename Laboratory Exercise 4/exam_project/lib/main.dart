import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'screens/map_screen.dart';
import 'services/notification_service.dart'; 
import 'screens/main_screen.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),  
    );
  }
}

Future<void> checkProximityAndNotify(
    double eventLatitude, double eventLongitude) async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  double distanceInMeters = Geolocator.distanceBetween(
    position.latitude,
    position.longitude,
    eventLatitude,
    eventLongitude,
  );

  if (distanceInMeters <= 100) { 
    NotificationService.showNotification(
      0,
      'Event Reminder',
      'You are near the event location: $eventLatitude, $eventLongitude',
    );
  }
}
