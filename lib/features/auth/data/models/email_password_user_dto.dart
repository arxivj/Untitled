import 'package:untitled/features/auth/data/models/user_dto.dart';

class EmailPasswordUserDTO extends UserDTO {
  EmailPasswordUserDTO({
    required super.email,
    required super.platform,
  });

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    return json;
  }
}
