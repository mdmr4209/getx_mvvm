import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_models.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preferece_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreferece userPreferece = UserPreferece();

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.defaultColor,
        actions: [
          IconButton(
            onPressed: () {
              userPreferece.removeUser().then((value) {
                Get.toNamed(RoutesName.loginView);
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeController.error.value == 'No Internet') {
              return InternetExceptionsWidget(
                onPress: () {
                  homeController.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(
                onPress: () {
                  homeController.refreshApi();
                },
              );
              // return Center(child: Text(homeController.error.toString()));
            }
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        homeController.userList.value.data![index].avatar
                            .toString(),
                      ),
                    ),
                    title: Text(
                      homeController.userList.value.data![index].firstName
                          .toString(),
                    ),
                    subtitle: Text(
                      homeController.userList.value.data![index].email
                          .toString(),
                    ),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
