import 'package:zione_app/config/auth.dart' as auth_config;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zione_app/config/constants.dart' as conf;

  final headers = {
    'Content-type' : 'application/json', 
    'Accept': 'application/json',
    'Authorization': auth_config.token
  };

String validadeEndpoint(String endpoint) {
  //TODO: check if endpoint is a valid url, if not, fix. if cant fix, return error
  return endpoint;
}




Future<Map> getGeocoding(String address) async {
  Map result;

  // final addressEncode = Uri.encodeFull(address);
  final url = Uri.http("http://api.positionstack.com/v1/", "forward?access_key=e35984b52f301530ccef88aa2260179e&output=json&query=$address");
  final response = await http.get(url, headers:headers, );

  result = jsonDecode(response.body);

  return result;
}




Future<Map> getContent(String endpoint) async {
  Map result;

  final validEndpoint = validadeEndpoint(endpoint);

  final url = Uri.http(conf.host+":"+conf.port, "/$validEndpoint");
  final response = await http.get(url, headers:headers);

  result = jsonDecode(response.body);

  return result;
}




Future<Map> postContent(String endpoint, Map content) async {
  Map result;

  final validEndpoint = validadeEndpoint(endpoint);

  final url = Uri.http(conf.host+":"+conf.port, "/$validEndpoint");
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
