import 'package:flutter/cupertino.dart';
import 'package:untitled/features/auth/apple_auth.dart';
import 'package:untitled/features/auth/authentication.dart';
import 'package:untitled/features/auth/google_auth.dart';

enum AuthProviderType { google, apple }

class AuthMethodSelector {
  late Authentication _auth;

  final Map<AuthProviderType, Authentication> _authMap = {
    AuthProviderType.google: GoogleAuth(),
    AuthProviderType.apple: AppleAuth(),
  };

  void selectAuthProvider(AuthProviderType provider) {
    _auth = _authMap[provider]!;
  }

  Authentication get auth => _auth;
}
