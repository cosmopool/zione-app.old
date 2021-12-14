// import 'package:zione_app/model/request.dart' as req;

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
  // late String clientAddressStreet;
  // late String clientAddressNumber;
  // late String clientAddressCity;
  // late String clientAddressRegion;
  late String serviceType;
  late String description;
  late String date;
  late String time;
  late String duration;
  late int appointmentId;
  late int ticketId;
  late bool appointmentIsFinished;

  AgendaEntry(Map<String, dynamic> response) {
    // id = response['id'] as int;
    clientName = response['clientName'] as String;
    clientPhone = response['clientPhone'] as String;
    clientAddress = response['clientAddress'] as String;
    // clientAddressStreet = response['clientAddressStreet'] as String;
    // clientAddressNumber = response['clientAddressNumber'] as String;
    // clientAddressCity = response['clientAddressCity'] as String;
    // clientAddressRegion = response['clientAddressRegion'] as String;
    serviceType = response['serviceType'] as String;
    description = response['description'] as String;
    date = response['date'] as String;
    time = response['time'] as String;
    duration = response['duration'] as String;
    ticketId = response['ticketId'] as int;
    appointmentIsFinished = response['isFinished'] as bool;

    time = time.substring(0, 5);
    duration = duration.substring(0, 5);
  }
}
