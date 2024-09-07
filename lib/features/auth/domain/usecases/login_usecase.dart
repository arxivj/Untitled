import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/auth/domain/entities/auth_user_entity.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class LoginParams {
  final String platform;

  LoginParams({required this.platform});
}

class LoginUseCase extends UseCase<AuthUserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<AuthUserEntity> call(LoginParams params) async {
    if (params.platform.isEmpty) {
      throw Exception("Platform must be provided");
    }

    return await repository.login(params.platform);
  }
}