import 'package:flutter/cupertino.dart';
import 'package:untitled/features/auth/domain/entities/auth_user_entity.dart';

class UserSessionProvider with ChangeNotifier {
  AuthUserEntity? _authUser;

  AuthUserEntity? get authUser => _authUser;

  void setAuthUser(AuthUserEntity user){
    _authUser = user;
    notifyListeners();
  }

  void clearAuthUser(){
    _authUser = null;
    notifyListeners();
  }

}