// const myJson = {
//   'client_name': 'Nicodemos Biancato',
//   'client_phone': '4199955566',
//   'client_address': 'instalar as cameras na casa da frente',
//   'service_type': 'instalacao',
//   'description': '- Falar com Fatima - Instalar as cameras na casa da frente',
//   'date': '2021-01-12',
//   'time': '08:00:00',
//   'duration': '00:30:00',
//   'id': 1,
//   'ticket_id': 2,
//   'is_finished': false
// };

List<AgendaEntry> parseListJsonToAgendaEntry(List response) {
  List<AgendaEntry> temp = [];

  if (temp == []) {
    throw ArgumentError("Null value in AgendaEntry list parser!");
  } else {
    response.map((e) {
      temp.add(AgendaEntry(e));
    });

    return temp;
  }
}

class AgendaEntry {
  late String clientName;
  late String clientPhone;
  late String clientAddress;
  late String serviceType;
  late String description;
  late String date;
  late String time;
  late String duration;
  late int appointmentId;
  late int ticketId;
  late bool appointmentIsFinished;

  AgendaEntry(Map<String, dynamic> response) {
    clientName = response['client_name'] as String;
    clientPhone = response['client_phone'] as String;
    clientAddress = response['client_address'] as String;
    serviceType = response['service_type'] as String;
    description = response['description'] as String;
    date = response['date'] as String;
    time = response['time'] as String;
    duration = response['duration'] as String;
    appointmentId = response['id'] as int;
    ticketId = response['ticket_id'] as int;
    appointmentIsFinished = response['is_finished'] as bool;
  }
}
