import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/exceptions/exceptions.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/data/service/email_password_login_service.dart';
import 'package:untitled/features/auth/data/service/logout_service.dart';
import 'package:untitled/features/auth/data/service/oauth_login_service.dart';
import 'package:untitled/features/auth/data/service/token_service.dart';
import 'package:untitled/features/auth/data/service/user_service.dart';
import 'package:untitled/features/auth/data/storage/token_storage.dart';
import 'package:untitled/features/auth/domain/entities/token_entity.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';
import 'package:untitled/features/auth/domain/mappers/token_mapper.dart';
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
  final TokenMapper tokenMapper;

  AuthRepositoryImpl({
    required this.oAuthLoginService,
    required this.emailPasswordLoginService,
    required this.tokenService,
    required this.tokenStorage,
    required this.userService,
    required this.logoutService,
    required this.userMapper,
    required this.tokenMapper,
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
  Future<List<TokenEntity>> requestToken(UserEntity user) async {
    final userDTO = userMapper.toDTO(user);
    final tokenDTO = await tokenService.requestTokenFromServer(userDTO);
    return tokenMapper.toEntity(tokenDTO);
  }

  @override
  Future<void> saveTokens(List<TokenEntity> tokens) async {
    final tokenDTO = tokenMapper.toDTO(tokens);
    tokenStorage.saveTokens(tokenDTO);
  }

  @override
  Future<UserEntity> getUserInfo() async {
    final tokenDTO = await tokenStorage.loadTokens();
    final userDTO = await userService.getUserByAccessToken(tokenDTO.accessToken);
    return userMapper.toEntity(userDTO);
  }

  @override
  Future<void> logout() async {
    final tokenDTO = await tokenStorage.loadTokens();
    await logoutService.logout(tokenDTO.accessToken);
    await tokenStorage.clearTokens();
  }
}
