import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class AuthDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<UserModel> fetchDummyUser() async {
    final response = await http.get(Uri.parse('$baseUrl/users/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Error al conectar con la API');
    }
  }
}