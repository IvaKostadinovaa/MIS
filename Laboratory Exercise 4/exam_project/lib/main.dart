// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:geolocator/geolocator.dart';
// import 'screens/map_screen.dart';
// import 'services/notification_service.dart'; // Додадено за NotificationService
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await NotificationService.init(); // Инициализација на NotificationService
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Student Calendar App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MapScreen()),
//             );
//           },
//           child: Text('View Map'),
//         ),
//       ),
//     );
//   }
// }
//
// Future<void> checkProximityAndNotify(
//     double eventLatitude, double eventLongitude) async {
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
//
//   double distanceInMeters = Geolocator.distanceBetween(
//     position.latitude,
//     position.longitude,
//     eventLatitude,
//     eventLongitude,
//   );
//
//   if (distanceInMeters <= 100) { // Ако е блиску до 100 метри
//     NotificationService.showNotification(
//       0,
//       'Event Reminder',
//       'You are near the event location: $eventLatitude, $eventLongitude',
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'screens/map_screen.dart';
import 'services/notification_service.dart'; // Додадено за NotificationService
import 'screens/main_screen.dart';  // Додадено за MainScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init(); // Инициализација на NotificationService
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
      home: MainScreen(),  // Променето од HomeScreen во MainScreen
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

  if (distanceInMeters <= 100) { // Ако е блиску до 100 метри
    NotificationService.showNotification(
      0,
      'Event Reminder',
      'You are near the event location: $eventLatitude, $eventLongitude',
    );
  }
}
