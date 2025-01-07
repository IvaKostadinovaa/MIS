import 'package:flutter/material.dart';
import 'event_card.dart'; // Import the EventCard widget

class EventList extends StatelessWidget {
  final List<Map<String, dynamic>> events;

  EventList({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        var event = events[index];
        return EventCard(
          title: event['title'],
          description: event['description'],
          dateTime: DateTime.parse(event['dateTime']),
        );
      },
    );
  }
}
