import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/auth/domain/entities/token_entity.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class LoginParams {
  final AuthPlatform platform;

  LoginParams({required this.platform});
}

class LoginUseCase extends UseCase<List<TokenEntity>, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<List<TokenEntity>> call(LoginParams params) async {
    final authUser = await repository.login(params.platform);
    final List<TokenEntity> tokens = await repository.requestToken(authUser);
    await repository.saveTokens(tokens);
    return tokens;
  }
}
