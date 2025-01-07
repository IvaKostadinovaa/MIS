import 'dart:async';

import 'notification_service.dart';

void scheduleDailyReminder() {
  Timer.periodic(Duration(days: 1), (Timer t) async {
    await showNotification('Joke of the Day', 'Click to view the joke!');
  });
}
