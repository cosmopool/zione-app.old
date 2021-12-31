import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zione_app/core/constants.dart' as conf;
import 'package:zione_app/core/auth.dart' as auth_config;

import 'package:zione_app/features/entry/entry_model.dart';

import 'package:zione_app/core/constants.dart';

class EntryRepository {
  final Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': auth_config.token
  };

  Future<Map> fetch(Endpoint endpoint) async {
    // if online, fetch from server
    final result = await _fetchContentFromServer(endpoint);
    // TODO: if it is not possible to fetch from server, use cache
    return result;
  }

  Future<Map> post(Entry entry, Endpoint endpoint) async {
    // TODO: if it is not possible to fetch from server, use cache
    final result = await _postContentToServer(endpoint, entry.toMap());
    return result;
  }

  Future<Map> delete(Entry entry, Endpoint endpoint) async {
    // TODO: if it is not possible to fetch from server, use cache
    final result = await _deleteContentFromServer(endpoint, entry.toMap());
    return result;
  }

  Future<Map> close(Entry entry, Endpoint endpoint) async {
    // TODO: if it is not possible to fetch from server, use cache
    final result = await _closeContentFromServer(endpoint, entry.toMap());
    return result;
  }

  // -----------
  // -----------
  // -----------

  // Future<Map> _fetchContentFromCache() async {}
  // Future<Map> _postContentToCache() async {}
  // Future<Map> _closeContentFromCache() async {}
  // Future<Map> _deleteContentFromCache() async {}
  String _parseEndpoint(Endpoint endpoint) {
    late String endpointStr;

    switch (endpoint) {
      case Endpoint.tickets: {endpointStr = "tickets";} break;
      case Endpoint.appointments: {endpointStr = "appointments";} break;
      case Endpoint.agenda: {endpointStr = "agenda";} break;
    }

    return endpointStr;
  }

  Future<Map> _fetchContentFromServer(Endpoint endpoint) async {
    // fetch content from rest api
    Map result;

    final _endpoint = _parseEndpoint(endpoint);
    final url = Uri.http("${conf.host}:${conf.port}", "/$_endpoint");
    final response = await http.get(url, headers: _headers);

    result = jsonDecode(response.body);

    return result;
  }

  Future<Map> _postContentToServer(Endpoint endpoint, Map content) async {
    // post content to rest api
    Map result;

    final _endpoint = _parseEndpoint(endpoint);
    final url = Uri.http("${conf.host}:${conf.port}", "/$_endpoint");
    final response =
        await http.post(url, headers: _headers, body: jsonEncode(content));
    result = jsonDecode(response.body);

    return result;
  }

  Future<Map> _closeContentFromServer(Endpoint endpoint, Map content) async {
    // close content from rest api
    Map result;

    final _endpoint = _parseEndpoint(endpoint);
    final id = content['id'];
    final validEndpoint = "$_endpoint/$id/actions/close";
    final url = Uri.http("${conf.host}:${conf.port}", "/$validEndpoint");
    final response =
        await http.post(url, headers: _headers, body: jsonEncode(content));

    result = jsonDecode(response.body);

    return result;
  }

  Future<Map> _deleteContentFromServer(Endpoint endpoint, Map content) async {
    // delete content from rest api
    Map result;

    final _endpoint = _parseEndpoint(endpoint);
    final id = content['id'];
    final validEndpoint = "$_endpoint/$id";
    final url = Uri.http("${conf.host}:${conf.port}", "/$validEndpoint");
    final response =
        await http.delete(url, headers: _headers, body: jsonEncode(content));

    result = jsonDecode(response.body);

    return result;
  }
}
