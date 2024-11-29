import 'dart:convert';
import 'dart:io';

import 'package:pizza_api_nazwa/models/pizza.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'gw1gr.wiremockapi.cloud'; // Hanya nama domain
  final String path = 'pizzalist'; // Path API

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path); // URL yang benar
    final http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List<Pizza> pizzas =
          (jsonResponse as List).map<Pizza>((json) => Pizza.fromJson(json)).toList();
      return pizzas;
    } else {
      return [];
    }
  }
}
