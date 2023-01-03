import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer';
import 'package:jwt_decode/jwt_decode.dart';
import '../model/http_exception.dart';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _tokenExpiry;
  late String userId;
  final storage = FlutterSecureStorage();

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

  Future<void> signIn(String email, String password) async {
    final url = Uri.parse("http://${dotenv.env['apiUrl']}/auth/signin");
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: json.encode({
          "email": email,
          "password": password,
        }),
      );
      if (response.statusCode == 200) {
        decodedJson = json.decode(response.body);
        _token = decodedJson['token'];
        await storage.write(key: "token", value: _token);
        notifyListeners();
      } else if (response.statusCode == 401) {
        throw HttpException("No user found with that email!");
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    final url = Uri.parse("http://${dotenv.env['apiUrl']}/auth/signup");
    await http.put(
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
  }
}
