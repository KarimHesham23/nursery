import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({
    required String url,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "there is a problem,this is status code ${response.statusCode} and this is body ${jsonDecode(response.body)}");
      }
    } on SocketException {
      throw Exception("No connection");
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }
}
