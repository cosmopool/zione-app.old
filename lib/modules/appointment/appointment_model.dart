import 'package:zione_app/features/entry/entry_model.dart';

class Appointment extends Entry {
  late final int id;
  final String date;
  final String time;
  final String duration;
  final int appointmentId;
  final int ticketId;
  final bool appointmentIsFinished;

  Appointment(
      {this.date = "",
      this.time = "",
      this.duration = "",
      this.appointmentId = 0,
      this.ticketId = 0,
      this.appointmentIsFinished = false});

  @override
  Map toMap() {
    Map entry = {};

    entry['date'] = date;
    entry['time'] = time;
    entry['duration'] = duration;
    entry['appointmentId'] = appointmentId;
    entry['ticketId'] = ticketId;
    entry['appointmentIsFinished'] = appointmentIsFinished;

    return entry;
  }
}
