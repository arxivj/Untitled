import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/core/enums/auth_user_fields.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class UserService {
  Future<UserEntity> getUserByAccessToken(Token accessToken) async {
    final token = accessToken.token;
    final response = await http.get(
      Uri.parse('http://192.168.0.36:8080/api/auth/user'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);
      return UserEntity(
        email: data[AuthUserFields.email.key],
        platform: data[AuthUserFields.platform.key],
      );
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}