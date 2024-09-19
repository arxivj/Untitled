import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/exceptions/exceptions.dart';
import 'package:untitled/features/auth/data/service/email_password_login_service.dart';
import 'package:untitled/features/auth/data/service/oauth_login_service.dart';
import 'package:untitled/features/auth/data/service/token_service.dart';
import 'package:untitled/features/auth/data/storage/token_storage.dart';
import 'package:untitled/features/auth/domain/entities/email_password_user_entity.dart';
import 'package:untitled/features/auth/domain/entities/oauth_user_entity.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final OAuthLoginService oAuthLoginService;
  final EmailPasswordLoginService emailPasswordLoginService;
  final TokenService tokenService;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl({
    required this.oAuthLoginService,
    required this.emailPasswordLoginService,
    required this.tokenService,
    required this.tokenStorage,
  });

  @override
  Future<UserEntity> login(AuthPlatform platform) async {
    final response = await _loginBasedOnPlatform(platform);
    return _createUserEntity(platform, response);
  }

  Future<Map<String, dynamic>> _loginBasedOnPlatform(AuthPlatform platform) {
    if (platform == AuthPlatform.apple || platform == AuthPlatform.google) {
      return oAuthLoginService.loginWithOAuth(platform);
    } else if (platform == AuthPlatform.emailPassword) {
      return emailPasswordLoginService.loginWithEmailPassword();
    } else {
      return Future.error(UnknownPlatformException());
    }
  }

  UserEntity _createUserEntity(
    AuthPlatform platform,
    Map<String, dynamic> response,
  ) {
    if (platform == AuthPlatform.apple || platform == AuthPlatform.google) {
      return OAuthUserEntity(
        email: response[AuthUserField.email.jsonKey],
        platform: response[AuthUserField.platform.jsonKey],
        oauthId: response[AuthUserField.oAuthId.jsonKey],
        oauthToken: response[AuthUserField.oAuthToken.jsonKey],
      );
    } else if (platform == AuthPlatform.emailPassword) {
      return EmailPasswordUserEntity(
        email: response[AuthUserField.email.jsonKey],
        platform: response[AuthUserField.platform.jsonKey],
        password: response[AuthUserField.password.jsonKey],
      );
    }
    throw UnknownPlatformException;
  }

  @override
  Future<List<Token>> requestToken(UserEntity user) async {
    final response = await tokenService.requestTokenFromServer(user);
    return tokenService.parseTokens(response);
  }

  @override
  Future<void> saveTokens(List<Token> tokens) async {
    tokenStorage.saveTokens(tokens);
  }

  @override
  Future<void> logout(UserEntity user) async {
    print('${user.platform}, ${user.email}');
  }
}
