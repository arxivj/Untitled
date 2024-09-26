import 'package:untitled/core/enums/auth_token_type.dart';

class TokenEntity {
  final String value;
  final AuthTokenType type;

  TokenEntity({
    required this.value,
    required this.type,
  });

  @override
  String toString() => 'Token(token: $value, type: ${type.name})';
}
