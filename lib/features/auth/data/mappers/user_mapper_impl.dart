import 'package:untitled/features/auth/data/models/email_password_user_dto.dart';
import 'package:untitled/features/auth/data/models/oauth_user_dto.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/domain/entities/email_password_user_entity.dart';
import 'package:untitled/features/auth/domain/entities/oauth_user_entity.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';
import 'package:untitled/features/auth/domain/mappers/user_mapper.dart';

class UserMapperImpl implements UserMapper {

  /*
  * Entity를 DTO로 변환하는 메서드
  */
  @override
  UserDTO toDTO(UserEntity entity) {
    if (entity is OAuthUserEntity) {
      return OAuthUserDTO(
        email: entity.email,
        platform: entity.platform,
        oauthId: entity.oauthId,
        oauthToken: entity.oauthToken,
      );
    } else if (entity is EmailPasswordUserEntity) {
      return EmailPasswordUserDTO(
        email: entity.email,
        platform: entity.platform,
      );
    } else {
      throw UnsupportedError('Unsupported UserEntity type');
    }
  }


  /*
  * DTO를 Entity로 변환하는 메서드
  */
  @override
  UserEntity toEntity(UserDTO dto) {
    if (dto is OAuthUserDTO) {
      return OAuthUserEntity(
        email: dto.email,
        platform: dto.platform,
        oauthId: dto.oauthId,
        oauthToken: dto.oauthToken,
      );
    } else if (dto is EmailPasswordUserDTO) {
      return EmailPasswordUserEntity(
        email: dto.email,
        platform: dto.platform,
      );
    } else {
      throw UnsupportedError('Unsupported UserDTO type');
    }
  }
}
