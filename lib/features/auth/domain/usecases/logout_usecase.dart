import 'dart:async';
import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class LogoutParams {
  final UserEntity user;

  LogoutParams({required this.user});
}

class LogoutUseCase extends UseCase<void, LogoutParams> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  @override
  FutureOr<void> call(LogoutParams params) async {
    await repository.logout(params.user);
  }
}
