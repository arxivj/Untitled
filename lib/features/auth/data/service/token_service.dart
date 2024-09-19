import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class TokenService {
  Future<Map<String, dynamic>> requestTokenFromServer(UserEntity user) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.36:8080/api/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return {
        'access_token': responseData['accessToken'],
        'refresh_token': responseData['refreshToken'],
      };
    } else {
      throw Exception('Failed to authenticate with server');
    }
  }

  List<Token> parseTokens(Map<String, dynamic> responseData) {
    final tokenDTO = TokenDTO.fromJson(responseData);
    return tokenDTO.toDomain();
  }
}
