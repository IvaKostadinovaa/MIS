import 'package:flutter/material.dart';
import '/widgets/event_list.dart'; 

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
        child: EventList(events: events), 
      ),
    );
  }
}
