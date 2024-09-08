enum TokenType {
  access(key: 'accessToken'),
  refresh(key: 'refreshToken');

  final String key;

  const TokenType({required this.key});
}

class Token {
  final String token;
  final TokenType type;

  Token({
    required this.token,
    required this.type,
  });

  @override
  String toString() => token;
}
