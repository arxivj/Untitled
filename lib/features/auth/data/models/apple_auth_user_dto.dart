class AppleAuthUserDTO {
  final String userIdentifier;
  final String email;
  final String authorizationCode;

  AppleAuthUserDTO({required this.userIdentifier, required this.email, required this.authorizationCode});

  factory AppleAuthUserDTO.fromJson(Map<String, dynamic> json) {
    return AppleAuthUserDTO(
      userIdentifier: json['userIdentifier'],
      email: json['email'],
      authorizationCode: json['authorizationCode'],
    );
  }
}