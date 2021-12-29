import 'package:zione_app/config/auth.dart' as auth_config;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zione_app/config/constants.dart' as conf;
import 'package:zione_app/model/agenda_entry.dart';

import 'package:zione_app/model/appointment.dart';
import 'package:zione_app/model/ticket.dart';

abstract class EntryRepository {
  final _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': auth_config.token
  };

  // Future<Map> fetch();
  // Future<Map> post(entry);
  // Future<Map> close();
  // Future<Map> delete();

  //String _validEndpoint(String endpoint) {
  //  //TODO: check if endpoint is a valid url, if not, fix it. if cant fix, return error
  //  return endpoint;
  //}

  // Future<Map> _fetchContentFromCache() async {}
  // Future<Map> _postContentToCache() async {}
  // Future<Map> _closeContentFromCache() async {}
  // Future<Map> _deleteContentFromCache() async {}

  Future<Map> _fetchContentFromServer(String endpoint) async {
    // fetch content from rest api
    Map result;

    final url = Uri.http("${conf.host}:${conf.port}", "/$endpoint");
    final response = await http.get(url, headers: _headers);

    result = jsonDecode(response.body);

    return result;
  }

  Future<Map> _postContentToServer(String endpoint, Map content) async {
    // post content to rest api
    Map result;

    final url = Uri.http("${conf.host}:${conf.port}", "/$endpoint");
    final response =
        await http.post(url, headers: _headers, body: jsonEncode(content));
    result = jsonDecode(response.body);

    return result;
  }

  Future<Map> _closeContentFromServer(String endpoint, Map content) async {
    // close content from rest api
    Map result;

    final id = content['id'];
    final validEndpoint = "$endpoint/$id/actions/close";
    final url = Uri.http("${conf.host}:${conf.port}", "/$validEndpoint");
    final response =
        await http.post(url, headers: _headers, body: jsonEncode(content));

    result = jsonDecode(response.body);

    // print(result);
    return result;
  }

  Future<Map> _deleteContentFromServer(String endpoint, Map content) async {
    // delete content from rest api
    Map result;

    final id = content['id'];
    final validEndpoint = "$endpoint/$id";
    final url = Uri.http("${conf.host}:${conf.port}", "/$validEndpoint");
    final response =
        await http.delete(url, headers: _headers, body: jsonEncode(content));

    result = jsonDecode(response.body);

    return result;
  }
}

class AppointmentRepository extends EntryRepository {
  final _endpoint = "appointments";

  Future<Map> fetch() async {
    final result = await _fetchContentFromServer(_endpoint);
    return result;
  }

  // Future<Map> post(Appointment appointment) async {}
  // Future<Map> close(Appointment appointment) async {}
  // Future<Map> delete(Appointment appointment) async {}

}

class TicketRepository extends EntryRepository {
  final _endpoint = "tickets";

  Future<Map> fetch() async {
    // if online, fetch from server
    final result = await _fetchContentFromServer(_endpoint);
    // if offline, fetch from cache
    return result;
  }

  Future<Map> post(Ticket ticket) async {
    // TODO: if it is not possible to fetch from server, use cache
    final result = await _postContentToServer(_endpoint, ticket.toMap());
    return result;
  }
  // Future<Map> close(Ticket ticket) async {}
  // Future<Map> delete(Ticket ticket) async {}

}

class AgendaRepository extends EntryRepository {
  final _endpoint = "agenda";

  Future<Map> fetch() async {
    // if online, fetch from server
    final result = await _fetchContentFromServer(_endpoint);
    // if offline, fetch from cache
    return result;
  }

  Future<Map> post(AgendaEntry agendaEntry) async {
    // TODO: if it is not possible to fetch from server, use cache
    final result = await _postContentToServer(_endpoint, agendaEntry.toMap());
    return result;
  }
}
