import 'package:untitled/core/enums/token_enum.dart';

class Token {
  final String token;
  final TokenEnum type;

  Token({
    required this.token,
    required this.type,
  });

  @override
  String toString() => 'Token(token: $token, type: ${type.name})';
  // String toString() => token;
}
