import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/features/auth/data/models/email_password_user_dto.dart';
import 'package:untitled/features/auth/data/models/oauth_user_dto.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';

class UserService {
  Future<UserDTO> getUserByAccessToken(String accessToken) async {
    final token = accessToken;
    final response = await http.get(
      Uri.parse('http://192.168.0.36:8080/api/auth/user'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);

      if (data.containsKey(AuthUserField.oAuthId.jsonKey) &&
          data.containsKey(AuthUserField.oAuthToken.jsonKey)) {
        return OAuthUserDTO.fromJson(data);
      } else {
        return EmailPasswordUserDTO.fromJson(data);
      }
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}