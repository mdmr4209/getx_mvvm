import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
   InputPasswordWidget({super.key});
final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                    controller: loginVM.passwordcontroller.value,
                    focusNode: loginVM.passwordFocusNode.value,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.SnackBar('password_hint'.tr, 'enter_password'.tr);
                      }
                    },
                    onFieldSubmitted: (value) {
                      
                    },
                    decoration: InputDecoration(
                      hintText: 'password_hint'.tr,
                      border: OutlineInputBorder(),
                    ),
                  );
  }
}