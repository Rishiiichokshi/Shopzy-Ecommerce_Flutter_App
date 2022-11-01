import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';


class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signUp(String email, String password) async {
    var url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDbQFY16Cq9kumr-ffWt-CRZJ2AiX-en5Q');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch(error) {
      throw error;
    }
  }



  Future<void> logIn(String email, String password) async {
    var url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDbQFY16Cq9kumr-ffWt-CRZJ2AiX-en5Q');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
