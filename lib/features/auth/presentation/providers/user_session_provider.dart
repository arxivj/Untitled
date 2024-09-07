
import 'package:flutter/cupertino.dart';

class AuthUser {}

class UserSessionProvider with ChangeNotifier {
  AuthUser? _authUser;

  AuthUser? get authUser => _authUser;

  void setAuthUser(AuthUser user){
    _authUser = user;
    notifyListeners();
  }

  void clearAuthUser(){
    _authUser = null;
    notifyListeners();
  }

}