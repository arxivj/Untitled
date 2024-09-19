import 'package:untitled/core/enums/auth_user_fields.dart';
import 'package:untitled/core/enums/platform_enum.dart';
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
  Future<UserEntity> login(PlatformEnum platform) async {
    final response = await _loginBasedOnPlatform(platform);
    return _createUserEntity(platform, response);
  }

  Future<Map<String, dynamic>> _loginBasedOnPlatform(PlatformEnum platform) {
    if (platform == PlatformEnum.apple || platform == PlatformEnum.google) {
      return oAuthLoginService.loginWithOAuth(platform);
    } else if (platform == PlatformEnum.emailPassword) {
      return emailPasswordLoginService.loginWithEmailPassword();
    }
    throw UnknownPlatformException;
  }

  UserEntity _createUserEntity(
    PlatformEnum platform,
    Map<String, dynamic> response,
  ) {
    if (platform == PlatformEnum.apple || platform == PlatformEnum.google) {
      return OAuthUserEntity(
        oauthId: response[AuthUserFields.oAuthId.key],
        email: response[AuthUserFields.email.key],
        oauthToken: response[AuthUserFields.oAuthToken.key],
        platform: platform.id,
      );
    } else if (platform == PlatformEnum.emailPassword) {
      return EmailPasswordUserEntity(
        email: response[AuthUserFields.email.key],
        password: response[AuthUserFields.password.key],
        platform: platform.id,
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
  Future<void> logout(UserEntity user) async{
    print('${user.platform}, ${user.email}');
  }
}
