import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/core/enums/auth_user_field.dart';

/*
* TODO: 텍스트필드에서 가져온 검증 완료된 email, password를
*/
class EmailPasswordLoginService {
  Future<Map<String, dynamic>> loginWithEmailPassword() async {
    final requestData = {"email": "test@test.com", "password": "test"};
    final response = await http.post(
      Uri.parse('http://192.168.0.36:8080/api/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('이메일/비밀번호 로그인에 실패하였습니다.');
    }

    final responseData = jsonDecode(response.body);

    final Map<String, dynamic> userData = {
      AuthUserField.email.jsonKey: responseData[AuthUserField.email.jsonKey],
      AuthUserField.platform.jsonKey: responseData[AuthUserField.platform.jsonKey],
    };

    return userData;
  }
}
