import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _tokenExpiry;
  late String userId;

  late var decodedJson;

  Future<void> signIn(String email, String password) async {
    final url = Uri.parse("http://${dotenv.env['apiUrl']}/auth/signin");
    try {
      // log("1");
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
      // log("2");
      decodedJson = json.decode(response.body);
      // log("3");
      log(decodedJson.toString());
      // log("4");
    } catch (err) {
      log("error happened");
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
