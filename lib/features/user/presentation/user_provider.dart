//generate the user provider class with all nencessary fields and functions to expose to the app

import 'package:flutter/foundation.dart';

import '../domain/user_entity.dart';

class UserProvider extends ChangeNotifier {
  late UserEntity _user;
  UserEntity get user => _user;

  void setCurrentUser(UserEntity userEntity) {
    _user = userEntity;
    notifyListeners();
  }

  

}
