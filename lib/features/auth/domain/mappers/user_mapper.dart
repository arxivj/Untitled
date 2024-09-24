import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

abstract interface class UserMapper {
  UserDTO toDTO(UserEntity entity);
  UserEntity toEntity(UserDTO dto);
}