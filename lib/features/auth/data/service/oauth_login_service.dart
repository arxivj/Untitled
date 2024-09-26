import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/features/auth/data/models/oauth_user_dto.dart';

class OAuthLoginService {
  Future<OAuthUserDTO> loginWithOAuth(AuthPlatform platform) async {
    // 간단하게 구글 로그인 구현 (로그인 실패, 네트워크 문제, 사용자 취소 등 예외 처리 필요)
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'openid',
      ],
      serverClientId: dotenv.env['SERVER_CLIENT_ID'],
    );

    final GoogleSignInAccount? account = await googleSignIn.signIn();

    if (account == null) {
      throw Exception('Google 로그인에 실패하였습니다.');
    }

    final GoogleSignInAuthentication auth = await account.authentication;

    final String? googleIdToken = auth.idToken;

    return OAuthUserDTO(
      email: account.email,
      platform: platform,
      oauthId: account.id,
      oauthToken: googleIdToken,
    );
  }
}
