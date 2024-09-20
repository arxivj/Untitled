import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/core/exceptions/exceptions.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class LogoutService {
  Future<void> logout(UserEntity user, String accessToken) async {
    final response = await http.delete(
      Uri.parse('http://192.168.0.36:8080/api/auth/logout'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      print('Logout successful');
      print('Status code: ${response.statusCode}');
    } else {
      print('Logout failed with status code: ${response.statusCode}');
      throw LogoutFailedException();
    }
  }
}