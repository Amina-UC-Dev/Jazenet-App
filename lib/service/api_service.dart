import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_urls.dart';

class ApiService {
  Future postApi({
    required BuildContext context,
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> header,
  }) async {
    try {
      final request = await http.post(Uri.parse(url),
          body: json.encode(body), headers: header);
      var response = json.decode(request.body);
      return response;
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please connect your network!"),
          elevation: 0,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          elevation: 0,
        ),
      );
      return;
    }
  }
}
