import 'package:zione_app/features/entry/entry_model.dart';

List<Ticket> parseListJsonToTicket(List response) {
  List<Ticket> temp = [];

  if (temp == []) {
    throw ArgumentError("Null value in Ticket list parser!");
  } else {
    response.map((e) {
      temp.add(Ticket(e));
    });

    return temp;
  }
}

class Ticket extends Entry {
  int? id;
  late String clientName;
  late String clientPhone;
  late String clientAddress;
  // late String clientAddressStreet;
  // late String clientAddressNumber;
  // late String clientAddressCity;
  // late String clientAddressRegion;
  late String serviceType;
  late String description;
  bool isFinished = false;

  Ticket.fromRequest(Map<String, dynamic> response) {
    id = response['id'] as int;
    clientName = response['clientName'] as String;
    clientPhone = response['clientPhone'] as String;
    clientAddress = response['clientAddress'] as String;
    // clientAddressStreet = response['clientAddressStreet'] as String;
    // clientAddressNumber = response['clientAddressNumber'] as String;
    // clientAddressCity = response['clientAddressCity'] as String;
    // clientAddressRegion = response['clientAddressRegion'] as String;
    serviceType = response['serviceType'] as String;
    description = response['description'] as String;
    isFinished = response['isFinished'] as bool;
  }

  Ticket(Map<String, dynamic> response) {
    id = response['id'] as int;
    clientName = response['clientName'] as String;
    clientPhone = response['clientPhone'] as String;
    clientAddress = response['clientAddress'] as String;
    // clientAddressStreet = response['clientAddressStreet'] as String;
    // clientAddressNumber = response['clientAddressNumber'] as String;
    // clientAddressCity = response['clientAddressCity'] as String;
    // clientAddressRegion = response['clientAddressRegion'] as String;
    serviceType = response['serviceType'] as String;
    description = response['description'] as String;
    isFinished = response['isFinished'] as bool;
  }

  Map toMap() {
    Map ticket = {};

    ticket['id'] = id;
    ticket['clientName'] = clientName;
    ticket['clientPhone'] = clientPhone;
    ticket['clientAddress'] = clientAddress;
    // ticket['clientAddressStreet'] = clientAddressStreet;
    // ticket['clientAddressNumber'] = clientAddressNumber;
    // ticket['clientAddressCity'] = clientAddressCity;
    // ticket['clientAddressRegion'] = clientAddressRegion;
    ticket['serviceType'] = serviceType;
    ticket['description'] = description;
    ticket['isFinished'] = isFinished;

    return ticket;
  }

  Map mapToCreate() {
    Map ticket = {};

    ticket['clientName'] = clientName;
    ticket['clientPhone'] = clientPhone;
    ticket['clientAddress'] = clientAddress;
    // ticket['clientAddressStreet'] = clientAddressStreet;
    // ticket['clientAddressNumber'] = clientAddressNumber;
    // ticket['clientAddressCity'] = clientAddressCity;
    // ticket['clientAddressRegion'] = clientAddressRegion;
    ticket['serviceType'] = serviceType;
    ticket['description'] = description;

    return ticket;
  }
}
