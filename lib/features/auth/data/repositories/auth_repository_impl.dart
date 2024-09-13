import 'package:untitled/core/enums/auth_user_fields.dart';
import 'package:untitled/core/enums/platform_enum.dart';
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/oauth_user_entity.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity> login(PlatformEnum platform) async {
    final response = await loginWithOAuth(platform);

    // TODO: 여기에 oauth, emailpassword 로그인 분리해서 각자 리턴해줘야함
    // 이건 oauth 리턴
    return OAuthUserEntity(
      oauthId: response[AuthUserFields.oAuthId.key],
      email: response[AuthUserFields.email.key],
      oauthToken: response[AuthUserFields.oAuthToken.key],
      platform: platform.id,
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
      'oauthId': 'google-id',
      'email': 'john@gmail.com',
      'oauthToken': 'google-auth-token',
    };
  }

  @override
  Future<List<Token>> requestToken(UserEntity user) async {
    final response = await serverRequestToken(user);
    final tokenDTO = TokenDTO.fromJson(response);
    final List<Token> tokens = tokenDTO.toDomain();
    return tokens;
  }

  Future<Map<String, dynamic>> serverRequestToken(UserEntity user) async {
    // TODO: UserEntity를 상속받은 자식타입 객체들을 fromEntity를 통해 DTO로 변환 후 서버에 전달해야 됨
    // 서버에서는 platform 필드로 구분해서 인증 후 DB에 저장하고 토큰 발급하고 하면 됨
    const response = {
      "access_token": "abcd1234",
      "refresh_token": "xyz9876",
    };
    return response;
  }
}
