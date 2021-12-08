class Entry{
  final String clientName;
  final String clientPhone;
  final String serviceType;
  final String description;
  final int ticketId;
  final bool ticketIsFinished;

  Entry({
    this.clientName = "",
    this.clientPhone = "",
    this.serviceType = "",
    this.description = "",
    this.ticketId = 0,
    this.ticketIsFinished = false});
}
