import 'package:untitled/features/auth/domain/entities/user_entity.dart';

abstract class UserDTO<T extends UserEntity, U extends UserDTO<T,U>> { // recursive generic, 자식 클래스에서 재정의한 메서드의 리턴타입을 명확하게 정의하기 위해 사용
  final String email;
  final String platform;

  UserDTO({
    required this.email,
    required this.platform,
  });

  Map<String, dynamic> toJson();

  U fromEntity(T entity);
}
