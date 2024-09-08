import 'package:untitled/core/enums/platform_enum.dart';
import 'package:untitled/features/auth/data/models/auth_user_dto.dart';
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/auth_user_entity.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthUserEntity> login(PlatformEnum platform) async {
    final response = await loginWithOAuth(platform);

    return AuthUserEntity(
      id: response[AuthUserFields.id.name],
      email: response[AuthUserFields.email.name],
      token: response[AuthUserFields.token.name],
      platform: platform.key,
    );
  }

  Future<Map<String, dynamic>> loginWithOAuth(PlatformEnum platform) async {
    /*
    GoogleSignInAccount._(this._googleSignIn, GoogleSignInUserData data)
      : displayName = data.displayName,
        email = data.email,
        id = data.id,
        photoUrl = data.photoUrl,
        serverAuthCode = data.serverAuthCode,
        _idToken = data.idToken;
    */

    return {
      'id': 'google-id',
      'email': 'john@gmail.com',
      'token': 'google-auth-token',
    };
  }

  @override
  Future<List<Token>> requestToken(AuthUserEntity user) async {
    final response = await serverRequestToken(user);
    final tokenDTO = TokenDTO.fromJson(response);
    return tokenDTO.toDomain();
  }

  Future<Map<String, dynamic>> serverRequestToken(AuthUserEntity user) async {
    const response = {
      "access_token": "abcd1234",
      "refresh_token": "xyz9876"
    };
    return response;
  }
}
