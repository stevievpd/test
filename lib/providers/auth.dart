import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/http_exception.dart';

class Auth with ChangeNotifier {
  late String _token;
  late String userId;
  final storage = const FlutterSecureStorage();

  dynamic decodedJson;

  // Future get token async {
  //   final result = await storage.read(key: "token");
  //   isExpired = Jwt.isExpired(result.toString());
  //   if (isExpired!) {
  //     Map<String, dynamic> jwt = Jwt.parseJwt(result.toString());
  //     return jwt;
  //   }
  //   return null;
  // }

  // bool get isAuth {
  //   return token != null;
  // }

  // bool get isAuth {
  //   if (getTokenFromStorage != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // get getTokenFromStorage async {
  //   final _token = await storage.read(key: "token");
  //   print(_token);
  //   bool expired = Jwt.isExpired(_token.toString());

  //   if (_token != null && expired != true) {
  //     return _token;
  //   }
  //   print("null result");
  //   return null;
  // }

  Future<dynamic> signIn(String email, String password) async {
    final url = Uri.parse("http://${dotenv.env['apiUrl']}/auth/signin");
    final response = await http
        .post(
          url,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: json.encode({
            "email": email,
            "password": password,
          }),
        )
        .timeout(
          const Duration(seconds: 3),
        );
    if (response.body.isEmpty) {
      throw HttpException(
          "Could not log you in at this time. Please try again later!");
    }
    if (response.statusCode == 200) {
      decodedJson = json.decode(response.body);
      _token = decodedJson['token'];
      await storage.write(key: "token", value: _token);
      notifyListeners();
      return true;
    } else if (response.statusCode == 401) {
      throw HttpException("Wrong email or password!");
    }
  }

  Future<dynamic> signUp(String email, String password) async {
    final url = Uri.parse("http://${dotenv.env['apiUrl']}/auth/signup");
    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: json.encode({
        "email": email,
        "password": password,
        "storeId": "1",
      }),
    );
    if (response.statusCode == 201) {
      return true;
    }
  }
}
