import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:untitled/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:untitled/features/auth/data/service/email_password_login_service.dart';
import 'package:untitled/features/auth/data/service/oauth_login_service.dart';
import 'package:untitled/features/auth/data/service/token_service.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';
import 'package:untitled/features/auth/domain/usecases/login_usecase.dart';

class AuthModule {
  static List<SingleChildWidget> providers = [
    Provider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(
        emailPasswordLoginService: EmailPasswordLoginService(),
        oAuthLoginService: OAuthLoginService(),
        tokenService: TokenService(),
      ),
    ),
    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(
        Provider.of<AuthRepository>(context, listen: false),
      ),
    ),
  ];
}
