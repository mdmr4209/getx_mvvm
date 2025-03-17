
import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preferece_view_model.dart';

import '../../res/routes/routes_name.dart';

class SplashServices {

  UserPreferece userPreferece = UserPreferece();

  void isLogin(){

    userPreferece.getUser().then((value) {

      print(value.token);
       Timer(const Duration(seconds: 3), () {
  if (value.token == null || value.token!.trim().isEmpty) {
    Get.offNamed(RoutesName.loginView);
  } else {
    Get.offNamed(RoutesName.homeView);
  }
});
    });
  }
}