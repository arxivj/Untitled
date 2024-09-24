import 'package:untitled/core/enums/auth_token_type.dart';

class TokenEntity {
  final String token;
  final AuthTokenType type;

  TokenEntity({
    required this.token,
    required this.type,
  });

  @override
  String toString() => 'Token(token: $token, type: ${type.name})';
}
