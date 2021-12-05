import 'package:zione_app/model/request.dart' as request;
import 'package:zione_app/config/auth.dart' as auth_config;

Map validadeResponse(Map response) {
  // receives a response and check if was successful or not
  // return a map with the response status and result
  Map result;
  var keys = [];
  var vals = [];
  response.forEach((key, value) {keys.add(key); vals.add(value);});

  final errorMessage = {'Status': 'Error', 'Result': 'Failed to authenticate: $vals'};

  vals.contains("Success") ? result = response : result = errorMessage;

  return result;
}

Future<bool> setToken(String user, String pass) async {
  // receives a username and a password and try to login
  // returns true if the token was set
  bool result;

  final response = await request.sendLoginRequest(user, pass);
  final token = validadeResponse(response);

  if (token['Status'] == "Success") {
    auth_config.token = "Bearer $token['Result']";
    result = true;
  } else {
    result = false;
  }
  
  return result;
}
