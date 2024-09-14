import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

    // E/P Login으로 한다면, final response = await loginWithEmailPassword();
    // return EmailPasswordUserEntity( ... ); 같은 형태가 되겠지
    // 어차피 UserEntity를 상속하는 Entity들이라 RequestToken을 통해 토큰 응답도 정상적으로 받을 수 있고
    // 다만, platform 필드를 통해 서버에서 어떤 방식으로 요청하는지 구분해서 인증처리 해야됨
  }

  Future<Map<String, dynamic>> loginWithOAuth(PlatformEnum platform) async {

    // 간단하게 구글 로그인 구현 (로그인 실패, 네트워크 문제, 사용자 취소 등 예외 처리 필요)
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'openid',
      ],
      serverClientId: dotenv.env['SERVER_CLIENT_ID'],
    );

    GoogleSignInAccount? account = await googleSignIn.signIn();

    if (account != null) {
      GoogleSignInAuthentication auth = await account.authentication;
      return {
        'oauthId': account.id,
        'email': account.email,
        'oauthToken': auth.idToken,
      };
    }

    return {
      'oauthId': null,
      'email': null,
      'oauthToken': null,
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
