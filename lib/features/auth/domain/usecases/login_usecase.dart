import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class LoginParams {
  final String platform;

  LoginParams({required this.platform});
}

class LoginUseCase extends UseCase<Token, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Token> call(LoginParams params) async {
    if (params.platform.isEmpty) {
      throw Exception("Platform must be provided");
    }

    // Platform에서 응답받은 결과를 AuthUserEntity로 받음
    final authUser = await repository.login(params.platform);

    // 해당 AuthUserEntity를 서버에 전송 후 서버로부터 JWT 토큰을 응답 받음
    final Token token = await repository.requestToken(authUser);

    return token;
  }
}