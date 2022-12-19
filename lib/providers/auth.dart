import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _tokenExpiry;
  late String userId;

  Future<void> signIn(String email, String password) async {
    final url = Uri.parse("http://${dotenv.env['apiUrl']}/auth/signin");
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
