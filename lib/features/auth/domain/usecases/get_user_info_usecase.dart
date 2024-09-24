import 'dart:async';

import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class GetUserInfoUseCase extends UseCase<UserEntity, NoParams?> {
  final AuthRepository repository;

  GetUserInfoUseCase({required this.repository});

  @override
  FutureOr<UserEntity> call([NoParams? params]) {
    return repository.getUserInfo();
  }
}
