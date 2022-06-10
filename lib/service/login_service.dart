import 'dart:convert';

import 'package:get/get.dart';
import 'package:pitjarus/login/model/login_request_model.dart';
import 'package:pitjarus/login/model/login_response.dart';
import 'package:pitjarus/login/model/stores.dart';
import 'package:http/http.dart' as http;

class LoginService extends GetConnect {
  final String loginUrl = 'http://dev.pitjarus.co/api/sariroti_md/index.php/login/loginTest';


  Future<LoginResponse?> postTest(String username, String Password) async {
    var requestBody = {
      "username":"$username",
      "password":"$Password"
    };
    http.Response response = await http.post(
      Uri.parse(loginUrl),
      body: requestBody,
    );
    print(response.body);
    if (response.statusCode != null) {
      if (response.statusCode >= 200 && response.statusCode <= 404) {
        print('masuk 1');
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else {
        print('masuk 2');
        return null;
      }
    } else {
      print('masuk 3');
      return null;
    }

  }
}