import 'package:zione_app/core/constants.dart';
import 'package:zione_app/features/entry/entry_model.dart';
import 'package:zione_app/shared/mixins/http_request_mixin.dart';

class Ticket extends Entry with HttpRequestMixin {
  int id = -1;
  String clientName = "not initialized variable";
  String clientPhone = "not initialized variable";
  String clientAddress = "not initialized variable";
  String serviceType = "not initialized variable";
  String description = "not initialized variable";
  bool isFinished = false;

  final Endpoint _endpoint = Endpoint.tickets;

  Ticket(
      {required this.clientName,
      required this.clientPhone,
      required this.clientAddress,
      required this.serviceType,
      required this.description});

  Ticket.fromRequest(Map<String, dynamic> response) {
    id = response['id'] as int;
    clientName = response['clientName'] as String;
    clientPhone = response['clientPhone'] as String;
    clientAddress = response['clientAddress'] as String;
    serviceType = response['serviceType'] as String;
    description = response['description'] as String;
    isFinished = response['isFinished'] as bool;
  }

  @override
  Map toMap() {
    Map ticketToMap = {};

    ticketToMap['id'] = id;
    ticketToMap['clientName'] = clientName;
    ticketToMap['clientPhone'] = clientPhone;
    ticketToMap['clientAddress'] = clientAddress;
    ticketToMap['serviceType'] = serviceType;
    ticketToMap['description'] = description;
    ticketToMap['isFinished'] = isFinished;

    return ticketToMap;
  }

  @override
  Map mapToOpenEntry() {
    Map ticketToMap = {};

    ticketToMap['clientName'] = clientName;
    ticketToMap['clientPhone'] = clientPhone;
    ticketToMap['clientAddress'] = clientAddress;
    ticketToMap['serviceType'] = serviceType;
    ticketToMap['description'] = description;

    return ticketToMap;
  }

  @override
  Future<Map> post() async {
    // if online, post to server
    final result = await postContentToServer(_endpoint, toMap());

    // TODO: if it is not possible to fetch from server, use cache
    return result;
  }

  @override
  Future<Map> delete() async {
    // if online, delete from server
    final result = await deleteContentFromServer(_endpoint, toMap());

    // TODO: if it is not possible to fetch from server, use cache
    return result;
  }

  @override
  Future<Map> close() async {
    // if online, close from server
    final result = await closeContentFromServer(_endpoint, toMap());

    // TODO: if it is not possible to fetch from server, use cache
    return result;
  }
}

// List<Ticket> parseListJsonToTicket(List response) {
//   List<Ticket> temp = [];

//   if (temp == []) {
//     throw ArgumentError("Null value in Ticket list parser!");
//   } else {
//     response.map((e) {
//       temp.add(Ticket.fromRequest(e));
//     });

//     return temp;
//   }
// }

// final af = Ticket.fromRequest({"asdf": "asdf"}).closeContentFromServer(Endpoint.tickets, {});
