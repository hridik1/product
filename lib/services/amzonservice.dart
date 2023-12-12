import 'dart:convert';
import 'dart:io';
import 'package:product/screen/amzonhpme.dart';
import 'package:http/http.dart' as http;

Future<amzon> getproductRepo() async {
  try {
    final resp = await http.post(
      Uri.parse(Urls.UserProduct),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = amzon.fromJson(decoded);
      return response;
    } else {
      throw Exception('Failed to load response');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
