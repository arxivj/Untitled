import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';

class TokenService {
  Future<TokenDTO> requestTokenFromServer(UserDTO user) async {
    final Map<String, dynamic> credentialsMap = user.toJson();
    final response = await http.post(
      Uri.parse('http://192.168.0.36:8080/api/auth/token'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(credentialsMap),
    );

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> tokenDataMap = jsonDecode(response.body);
      return TokenDTO.fromJson(tokenDataMap);
    } else {
      throw Exception('Failed to authenticate with server');
    }
  }
}
