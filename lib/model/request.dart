import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zione_app/config/constants.dart' as conf;

  const headers = {
    'Content-type' : 'application/json', 
    'Accept': 'application/json',
  };

String validadeEndpoint(String endpoint) {
  //TODO: check if endpoint is a valid url, if not, fix. if cant fix, return error
  return endpoint;
}

Future<Map> getContent(String endpoint, Map content) async {
  Map result;

  final url = Uri.http(conf.host+":"+conf.port, "/$validadeEndpoint(endpoint)");
  final response = await http.get(url, headers:headers, );

  result = jsonDecode(response.body);

  return result;
}

Future<Map> postContent(String endpoint, Map content) async {
  Map result;

  final url = Uri.http(conf.host+":"+conf.port, "/$validadeEndpoint(endpoint)");
  final response = await http.post(url, headers:headers, body:jsonEncode(content));

  result = jsonDecode(response.body);

  return result;
}

Future <Map> sendLoginRequest(String user, String pass) async {
  // sends a request to the server with user credentials to receive a jwt token
  // returns a response

  final credentials = {'username': user, 'password': pass};
  Map<String,String> headers = {
    'Content-type' : 'application/json', 
    'Accept': 'application/json',
  };
  // TODO: change to https
  final url = Uri.http(conf.host+":"+conf.port, "/login");

  final response = await http.post(url, headers:headers, body:jsonEncode(credentials));
  Map result = jsonDecode(response.body);


  return result;
}

// String getToken()
