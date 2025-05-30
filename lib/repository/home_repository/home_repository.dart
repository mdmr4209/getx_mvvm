import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }

}