import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/core/exceptions/exceptions.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/data/service/email_password_login_service.dart';
import 'package:untitled/features/auth/data/service/logout_service.dart';
import 'package:untitled/features/auth/data/service/oauth_login_service.dart';
import 'package:untitled/features/auth/data/service/token_service.dart';
import 'package:untitled/features/auth/data/service/user_service.dart';
import 'package:untitled/features/auth/data/storage/token_storage.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';
import 'package:untitled/features/auth/domain/mappers/user_mapper.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final OAuthLoginService oAuthLoginService;
  final EmailPasswordLoginService emailPasswordLoginService;
  final TokenService tokenService;
  final TokenStorage tokenStorage;
  final UserService userService;
  final LogoutService logoutService;
  final UserMapper userMapper;

  AuthRepositoryImpl({
    required this.oAuthLoginService,
    required this.emailPasswordLoginService,
    required this.tokenService,
    required this.tokenStorage,
    required this.userService,
    required this.logoutService,
    required this.userMapper
  });

  @override
  Future<UserEntity> login(AuthPlatform platform) async {
    final userDTO = await _loginBasedOnPlatform(platform);
    return userMapper.toEntity(userDTO);
  }

  Future<UserDTO> _loginBasedOnPlatform(AuthPlatform platform) {
    switch (platform) {
      case AuthPlatform.google:
        return oAuthLoginService.loginWithOAuth(platform);
      case AuthPlatform.apple:
        return oAuthLoginService.loginWithOAuth(platform);
      case AuthPlatform.emailPassword:
        return emailPasswordLoginService.loginWithEmailPassword();
      default:
        return Future.error(UnknownPlatformException());
    }
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
