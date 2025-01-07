// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import '/widgets/event_card.dart';
// import '/widgets/event_list.dart';
// import '/widgets/date_picker.dart';
// import '/widgets/map_marker.dart';
//
// //
//
//
// class CalendarScreen extends StatefulWidget {
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }
//
// class _CalendarScreenState extends State<CalendarScreen> {
//   DateTime _selectedDay = DateTime.now();
//   DateTime _focusedDay = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Exam Schedule Calendar'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             focusedDay: _focusedDay,
//             firstDay: DateTime(2000),
//             lastDay: DateTime(2100),
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//             calendarStyle: CalendarStyle(
//               todayDecoration: BoxDecoration(
//                 color: Colors.blue,
//                 shape: BoxShape.circle,
//               ),
//               selectedDecoration: BoxDecoration(
//                 color: Colors.orange,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Selected date: ${_selectedDay.toLocal()}'.split(' ')[0],
//             style: TextStyle(fontSize: 18),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '/widgets/event_list.dart'; // Import EventList widget

class CalendarScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {'title': 'Exam 1', 'description': 'Mathematics Exam', 'dateTime': '2025-01-15T09:00:00Z'},
    {'title': 'Lecture 2', 'description': 'Software Engineering Lecture', 'dateTime': '2025-01-16T11:00:00Z'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Calendar')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EventList(events: events),  // Use the EventList widget here
      ),
    );
  }
}
