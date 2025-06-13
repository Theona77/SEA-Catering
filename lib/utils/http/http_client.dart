import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class THttpHelper{
  static const String _baseUrl = 'https://us-central1-agribridge4.cloudfunctions.net';

  static Future<Map<String, dynamic>> get(String endpoint) async{
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async{
    final response = await http.post(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async{
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }


  static Map<String, dynamic> _handleResponse(http.Response response) {
    print('STATUS: ${response.statusCode}');
    print('BODY: ${response.body}');

    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        return {"status": "success", "data": null};
      }

      try {
        final jsonData = jsonDecode(response.body);
        return jsonData;
      } catch (e) {
        // Instead of throwing error on non-JSON, just wrap the plain text
        return {
          "status": "success",
          "message": response.body
        };
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}