import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
   LoginButtonWidget({super.key , required this.formKey});
  final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() =>RoundButton(
              width: 200,
              title: 'login'.tr,
              loading: loginVM.loading.value,
              onPress: () {
                if (formKey.currentState!.validate()) {
                  loginVM.loginApi();
                }
              },
            ),);
  }
}