
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

class Ticket {
  late String clientName;
  late String clientPhone;
  late String clientAddress;
  // late String clientAddressStreet;
  // late String clientAddressNumber;
  // late String clientAddressCity;
  // late String clientAddressRegion;
  late String serviceType;
  late String description;
  int? id;
  bool isFinished = false;

  Ticket(Map<String, dynamic> response) {
    clientName = response['clientName'] as String;
    clientPhone = response['clientPhone'] as String;
    clientAddress = response['clientAddress'] as String;
    // clientAddressStreet = response['clientAddressStreet'] as String;
    // clientAddressNumber = response['clientAddressNumber'] as String;
    // clientAddressCity = response['clientAddressCity'] as String;
    // clientAddressRegion = response['clientAddressRegion'] as String;
    serviceType = response['serviceType'] as String;
    description = response['description'] as String;
    id = response['id'] as int;
    isFinished = response['isFinished'] as bool;
  }

  Map mapToEdit() {
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
    ticket['id'] = id;
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
