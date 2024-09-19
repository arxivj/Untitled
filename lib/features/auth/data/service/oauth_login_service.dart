import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/core/enums/platform_enum.dart';

class OAuthLoginService {
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
}