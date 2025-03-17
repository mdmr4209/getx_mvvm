import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/apps_exceptions.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text('welcome_back'.tr, textAlign: TextAlign.center,),
      )
      // appBar: AppBar(
      //   title: Text('name'.tr),
      //   centerTitle: true,
      //   backgroundColor: const Color.fromARGB(255, 236, 130, 255),
      // ),
      // body: ListView(
      //   children: [
      //     GeneralExceptionWidget(onPress: () {}),
      //     InternetExceptionsWidget(onPress: () {}),
      //     SizedBox(height: 400),
      //     Image(image: AssetImage(ImageAssets.splashScreen)),
      //     SizedBox(height: 200),
      //     Column(
      //       children: [
      //         RoundButton(
      //           onPress: () {},
      //           title: 'Login',
      //           width: double.infinity,
      //           loading: true,
      //         ),
      //         SizedBox(height: 20),
      //         RoundButton(onPress: () {}, title: 'Register', width: 100),
      //       ],
      //     ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Utils.toastMessage('No Internet Connection Bottom');
      //     Utils.toastMessageCenter('No Internet Connection Center');
      //     throw InternetException('No Internet Connection');
      //   },
      //   child: const Icon(Icons.error),
      // ),
    );
  }
}
