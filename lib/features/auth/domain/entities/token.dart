enum TokenType {
  access,
  refresh;
}

class Token {
  final String token;
  final TokenType type;

  Token({
    required this.token,
    required this.type,
  });

  @override
  String toString() => 'Token(token: $token, type: ${type.name})';
  // String toString() => token;
}
