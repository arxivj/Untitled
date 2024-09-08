import 'package:untitled/features/auth/data/models/auth_user_dto.dart';
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/auth_user_entity.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

// 데이터 소스와 상호작용 하여 Entity를 만들어 도메인 레이어로 전달하는게 주 목적
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthUserEntity> login(String platform) async {
    final response = await loginWithOAuth(platform);

    final authUserDTO = AuthUserDTO.fromJson(response);

    return AuthUserEntity(
      id: authUserDTO.id,
      email: authUserDTO.email,
      token: authUserDTO.token,
    );
  }

  Future<Map<String, dynamic>> loginWithOAuth(String platform) async {
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
      'id': '12345',
      'name': 'John Doe',
      'email': 'john@example.com',
      'token': 'abcd1234',
    };
  }

  @override
  Future requestToken(AuthUserEntity user) async {

    const response = {
      "access_token": "abcd1234",
      "refresh_token": "xyz9876"
    };

    final tokenDTO = TokenDTO.fromJson(response);

    return tokenDTO.toDomain();
  }
}
