class Event {
  final int? id;
  final String title;
  final String description;
  final String date;
  final double? latitude;
  final double? longitude;

  Event({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  static Event fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
