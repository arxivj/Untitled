import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/core/exceptions/exceptions.dart';
import 'package:untitled/features/auth/data/models/email_password_user_dto.dart';
import 'package:untitled/features/auth/data/models/oauth_user_dto.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/data/service/email_password_login_service.dart';
import 'package:untitled/features/auth/data/service/logout_service.dart';
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
  final LogoutService logoutService;

  AuthRepositoryImpl({
    required this.oAuthLoginService,
    required this.emailPasswordLoginService,
    required this.tokenService,
    required this.tokenStorage,
    required this.logoutService,
  });

  @override
  Future<UserEntity> login(AuthPlatform platform) async {
    final response = await _loginBasedOnPlatform(platform);
    print("오잉? $response");
    return _createUserEntity(platform, response);
  }

  Future<Map<String, dynamic>> _loginBasedOnPlatform(AuthPlatform platform) {
    switch (platform) {
      case AuthPlatform.google:
      case AuthPlatform.apple:
        return oAuthLoginService.loginWithOAuth(platform);
      case AuthPlatform.emailPassword:
        return emailPasswordLoginService.loginWithEmailPassword();
      default:
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
      print(response);
      return EmailPasswordUserEntity(
        email: response[AuthUserField.email.jsonKey],
        platform: response[AuthUserField.platform.jsonKey],
      );
    }
    throw UnknownPlatformException;
  }

  @override
  Future<List<Token>> requestToken(UserEntity user) async {
    final userDTO = _convertToDTO(user);
    final response = await tokenService.requestTokenFromServer(userDTO);
    return tokenService.parseTokens(response);
  }

  UserDTO _convertToDTO(UserEntity user) {
    if (user is OAuthUserEntity) {
      return OAuthUserDTO.fromEntity(user);
    } else if (user is EmailPasswordUserEntity) {
      return EmailPasswordUserDTO.fromEntity(user);
    }
    throw UnsupportedError('Unsupported user entity type');
  }


  @override
  Future<void> saveTokens(List<Token> tokens) async {
    tokenStorage.saveTokens(tokens);
  }

  @override
  Future<void> logout(UserEntity user) async {
    final tokens = await tokenStorage.loadTokens();
    final accessToken = tokens.firstWhere((token) => token.type == AuthTokenType.accessToken).token;
    await logoutService.logout(user, accessToken);
    await tokenStorage.clearTokens();
  }
}
