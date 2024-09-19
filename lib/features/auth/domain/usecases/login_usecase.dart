import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class LoginParams {
  final AuthPlatform platform;

  LoginParams({required this.platform});
}

class LoginUseCase extends UseCase<List<Token>, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<List<Token>> call(LoginParams params) async {
    final authUser = await repository.login(params.platform);
    final List<Token> tokens = await repository.requestToken(authUser);
    await repository.saveTokens(tokens);
    return tokens;
  }
}
