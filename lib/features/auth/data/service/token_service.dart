import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class TokenService {
  Future<Map<String, dynamic>> requestTokenFromServer(UserEntity user) async {
    final Map<String, dynamic> credentialsMap = user.toJson();
    final response = await http.post(
      Uri.parse('http://192.168.0.36:8080/api/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(credentialsMap),
    );

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> tokenDataMap = jsonDecode(response.body);
      return tokenDataMap;
    } else {
      throw Exception('Failed to authenticate with server');
    }
  }

  // DTO와 Entity가 동일한 구조를 가질 경우 DTO를 거치는게 오버헤드 처럼 보일 수 있음 (그래서 일부로 좀 다르게 해놓긴 했음)
  // 하지만 API 스펙이 변경 되거나 복잡해지면?
  // API와 Domain 간 독립성을 유지하고, API 스펙 변경에 따른 영향을 최소화 하려면 DTO 사용이 권장됨
  List<Token> parseTokens(Map<String, dynamic> tokenDataMap) {
    final tokenDTO = TokenDTO.fromJson(tokenDataMap);
    return tokenDTO.toDomain();
  }
}
