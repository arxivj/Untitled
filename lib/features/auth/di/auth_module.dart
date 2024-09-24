import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:untitled/features/auth/data/mappers/token_mapper_impl.dart';
import 'package:untitled/features/auth/data/mappers/user_mapper_impl.dart';
import 'package:untitled/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:untitled/features/auth/data/service/email_password_login_service.dart';
import 'package:untitled/features/auth/data/service/logout_service.dart';
import 'package:untitled/features/auth/data/service/oauth_login_service.dart';
import 'package:untitled/features/auth/data/service/token_service.dart';
import 'package:untitled/features/auth/data/service/user_service.dart';
import 'package:untitled/features/auth/data/storage/token_storage.dart';
import 'package:untitled/features/auth/domain/mappers/token_mapper.dart';
import 'package:untitled/features/auth/domain/mappers/user_mapper.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';
import 'package:untitled/features/auth/domain/usecases/login_usecase.dart';
import 'package:untitled/features/auth/domain/usecases/logout_usecase.dart';

/*
* TODO: 생성 순서 및 사용처에 따라 정리 필요
*/
class AuthModule {
  static List<SingleChildWidget> providers = [
    Provider<TokenService>(create: (_) => TokenService()),
    Provider<TokenStorage>(create: (_) => TokenStorage()),
    Provider<UserService>(create: (_) => UserService()),
    Provider<OAuthLoginService>(create: (_) => OAuthLoginService()),
    Provider<EmailPasswordLoginService>(
        create: (_) => EmailPasswordLoginService()),
    Provider<LogoutService>(create: (_) => LogoutService()),
    Provider<UserMapper>(create: (_) => UserMapperImpl()),
    Provider<TokenMapper>(create: (_) => TokenMapperImpl()),
    Provider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(
        oAuthLoginService:
            Provider.of<OAuthLoginService>(context, listen: false),
        emailPasswordLoginService:
            Provider.of<EmailPasswordLoginService>(context, listen: false),
        tokenService: Provider.of<TokenService>(context, listen: false),
        tokenStorage: Provider.of<TokenStorage>(context, listen: false),
        logoutService: Provider.of<LogoutService>(context, listen: false),
        userService: Provider.of<UserService>(context, listen: false),
        userMapper: Provider.of<UserMapper>(context, listen: false),
        tokenMapper: Provider.of<TokenMapper>(context, listen: false),
      ),
    ),
    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(
        repository: Provider.of<AuthRepository>(context, listen: false),
      ),
    ),
    Provider<LogoutUseCase>(
      create: (context) => LogoutUseCase(
        repository: Provider.of<AuthRepository>(context, listen: false),
      ),
    ),
  ];
}
