import 'package:zione_app/core/constants.dart';
import 'package:zione_app/repositories/response_repository.dart';
import 'package:zione_app/repositories/entry_repository.dart';
import 'package:zione_app/modules/agenda/agenda_entry_model.dart';

class Ticket extends AgendaEntry {
  int _id = -1;
  String clientName = "not initialized variable";
  String clientPhone = "not initialized variable";
  String clientAddress = "not initialized variable";
  String serviceType = "not initialized variable";
  String description = "not initialized variable";
  bool isFinished = false;

  final Endpoint _endpoint = Endpoint.tickets;
  final EntryRepository _requests = EntryRepository();
  // final Ticket _entry = _thisInstance();

  Ticket(
      {required this.clientName,
      required this.clientPhone,
      required this.clientAddress,
      required this.serviceType,
      required this.description});

  // Ticket.fromResponse(Response response) {
  //   final Map json = jsonDecode(response.message);

  //   _id = json['id'] as int;
  //   clientName = json['clientName'] as String;
  //   clientPhone = json['clientPhone'] as String;
  //   clientAddress = json['clientAddress'] as String;
  //   serviceType = json['serviceType'] as String;
  //   description = json['description'] as String;
  //   isFinished = json['isFinished'] as bool;
  // }

  Ticket.fromMap(Map map) {
    _id = map['id'] as int;
    clientName = map['clientName'] as String;
    clientPhone = map['clientPhone'] as String;
    clientAddress = map['clientAddress'] as String;
    serviceType = map['serviceType'] as String;
    description = map['description'] as String;
    isFinished = map['isFinished'] as bool;
  }

  int get getId {
    return _id;
  }

  @override
  Map toMap() {
    Map ticketToMap = {};

    if (_id > 0) ticketToMap['id'] = _id;
    ticketToMap['clientName'] = clientName;
    ticketToMap['clientPhone'] = clientPhone;
    ticketToMap['clientAddress'] = clientAddress;
    ticketToMap['serviceType'] = serviceType;
    ticketToMap['description'] = description;
    ticketToMap['isFinished'] = isFinished;

    return ticketToMap;
  }

  @override
  Future<Response> post() async {
    final result = await _requests.postContent(_endpoint, this);

    return result;
  }

  @override
  Future<Response> update() async {
    final result = await _requests.updateContent(_endpoint, this);

    return result;
  }

  @override
  Future<Response> delete() async {
    final result = await _requests.deleteContent(_endpoint, this);

    return result;
  }

  @override
  Future<Response> close() async {
    final result = await _requests.closeContent(_endpoint, this);

    return result;
  }
}

