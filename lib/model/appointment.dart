class Appointment{
  final int id;
  final String date;
  final String time;
  final String duration;
  final int appointmentId;
  final int ticketId;
  final bool appointmentIsFinished;

  Appointment({
    this.id = 0,
    this.date = "",
    this.time = "",
    this.duration = "",
    this.appointmentId = 0,
    this.ticketId = 0,
    this.appointmentIsFinished = false});
}
