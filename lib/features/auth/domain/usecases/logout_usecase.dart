import 'dart:async';
import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase extends UseCase<void, NoParams?> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  @override
  FutureOr<void> call([NoParams? params]) async {
    await repository.logout();
  }
}
