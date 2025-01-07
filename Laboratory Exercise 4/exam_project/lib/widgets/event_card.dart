import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime dateTime;

  EventCard({required this.title, required this.description, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(DateFormat('dd MMM yyyy, HH:mm').format(dateTime)),
      ),
    );
  }
}
