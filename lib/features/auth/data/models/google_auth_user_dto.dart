class GoogleAuthUserDTO {
  final String id;
  final String email;
  final String token;

  GoogleAuthUserDTO({required this.id, required this.email, required this.token});

  factory GoogleAuthUserDTO.fromJson(Map<String, dynamic> json) {
    return GoogleAuthUserDTO(
      id: json['id'],
      email: json['email'],
      token: json['accessToken'],
    );
  }
}
