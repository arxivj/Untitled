import 'package:untitled/core/enums/auth_token_type.dart';

class Token {
  final String token;
  final AuthTokenType type;

  Token({
    required this.token,
    required this.type,
  });

  @override
  String toString() => 'Token(token: $token, type: ${type.name})';
  // String toString() => token;
}
