import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/features/auth/data/models/email_password_user_dto.dart';
import 'package:untitled/features/auth/data/models/oauth_user_dto.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';

class UserService {
  Future<UserDTO> getUserByAccessToken(Token accessToken) async {
    final token = accessToken.token;
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
        return OAuthUserDTO(
          email: data[AuthUserField.email.jsonKey],
          platform: data[AuthUserField.platform.jsonKey],
          oauthId: data[AuthUserField.oAuthId.jsonKey],
          oauthToken: data[AuthUserField.oAuthToken.jsonKey],
        );
      } else {
        return EmailPasswordUserDTO(
          email: data[AuthUserField.email.jsonKey],
          platform: data[AuthUserField.platform.jsonKey],
        );
      }
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}