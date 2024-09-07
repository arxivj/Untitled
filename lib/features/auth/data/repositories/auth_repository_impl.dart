import 'package:untitled/features/auth/data/models/auth_user_dto.dart';
import 'package:untitled/features/auth/domain/entities/auth_user_entity.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthUserEntity> login(String platform) async {
    // API 호출 (데이터 처리)
    final response = await loginWithOAuth(platform); // 이 부분에서 google, line, facebook, apple 모두 다른 oauth package를 사용하고 있어서 나눠서 처리해줘야함

    final authUserDTO = AuthUserDTO.fromJson(response);

    return AuthUserEntity(
      id: authUserDTO.id,
      name: authUserDTO.token,
      email: authUserDTO.email,
    );
  }

  Future<Map<String, dynamic>> loginWithOAuth(String platform) async {
    // 플랫폼 별 OAuth 로그인 API 호출 예시

    // 구글의 경우, 애플의 경우, 페이북의 경우 등등 나눠서 처리해줘야함. 심지어 리턴값도 다를 수 있음. 하지만 마지막에 변환되는건 뭐다? 항상 AuthUserEntity를 생성해서 앱에서 사용가능

    return {
      'id': '12345',
      'name': 'John Doe',
      'email': 'john@example.com',
      'token': 'abcd1234',
    };
  }
}
