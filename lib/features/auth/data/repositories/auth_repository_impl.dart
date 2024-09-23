import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/core/exceptions/exceptions.dart';
import 'package:untitled/features/auth/data/service/logout_service.dart';
import 'package:untitled/features/auth/data/service/oauth_login_service.dart';
import 'package:untitled/features/auth/data/service/token_service.dart';
import 'package:untitled/features/auth/data/service/user_service.dart';
import 'package:untitled/features/auth/data/storage/token_storage.dart';
import 'package:untitled/features/auth/domain/entities/oauth_user_entity.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';
import 'package:untitled/features/auth/domain/mappers/user_mapper.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final OAuthLoginService oAuthLoginService;
  final TokenService tokenService;
  final TokenStorage tokenStorage;
  final UserService userService;
  final LogoutService logoutService;
  final UserMapper userMapper;

  AuthRepositoryImpl({
    required this.oAuthLoginService,
    required this.tokenService,
    required this.tokenStorage,
    required this.userService,
    required this.logoutService,
    required this.userMapper
  });

  @override
  Future<UserEntity> login(AuthPlatform platform) async {
    final response = await _loginBasedOnPlatform(platform);
    return _createUserEntity(response);
  }

  Future<Map<String, dynamic>> _loginBasedOnPlatform(AuthPlatform platform) {
    switch (platform) {
      case AuthPlatform.google:
        return oAuthLoginService.loginWithOAuth(platform);
      case AuthPlatform.apple:
        return oAuthLoginService.loginWithOAuth(platform);
      default:
        return Future.error(UnknownPlatformException());
    }
  }

  UserEntity _createUserEntity(
    Map<String, dynamic> response,
  ) {
    return OAuthUserEntity(
      email: response[AuthUserField.email.jsonKey],
      platform: response[AuthUserField.platform.jsonKey],
      oauthId: response[AuthUserField.oAuthId.jsonKey],
      oauthToken: response[AuthUserField.oAuthToken.jsonKey],
    );
  }

  @override
  Future<List<Token>> requestToken(UserEntity user) async {
    final userDTO = userMapper.toDTO(user);
    final response = await tokenService.requestTokenFromServer(userDTO);
    return tokenService.parseTokens(response);
  }

  @override
  Future<void> saveTokens(List<Token> tokens) async {
    tokenStorage.saveTokens(tokens);
  }

  @override
  Future<UserEntity> getUserInfo() async {
    final tokens = await tokenStorage.loadTokens();
    final accessToken =
        tokens.firstWhere((token) => token.type == AuthTokenType.accessToken);
    final userDTO = await userService.getUserByAccessToken(accessToken);
    return userMapper.toEntity(userDTO);
  }

  @override
  Future<void> logout() async {
    final tokens = await tokenStorage.loadTokens();
    final accessToken = tokens
        .firstWhere((token) => token.type == AuthTokenType.accessToken)
        .token;
    await logoutService.logout(accessToken);
    await tokenStorage.clearTokens();
  }
}
