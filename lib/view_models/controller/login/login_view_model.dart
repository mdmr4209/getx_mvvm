import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preferece_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreferece userPreferece = UserPreferece();

  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailcontroller.value.text,
      'password': passwordcontroller.value.text,
    };
    _api
        .loginApi(data)
        .then((value) {
          loading.value = false;

          if (value['error'] == 'user not found') {
            Utils.SnackBar('Error', value['error']);
          } else {
            userPreferece
                .saveUser(UserModel.fromJson(value))
                .then((value) {
                  Get.delete<LoginViewModel>();
                  Get.toNamed(RoutesName.homeView)!.then((value) {});
            Utils.SnackBar('Success', 'Login Success');
                }).onError((error, StackTrace) {

                });
          }
        }).onError((error, stackTrace) {
          print(error.toString());
          loading.value = false;
          Utils.SnackBar('Error', error.toString());
        });
  }
}
