import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/model/user_model.dart';

class ApiServices {
  final Dio _dio = Dio();
  final String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserModel>> getUserData() async {
    List<UserModel> userData = [];
    try {
      Response response = await _dio.get(url);
      print(response.data);
      print(response.statusCode);
      List<dynamic> data = response.data;
      for (var i = 0; i < data.length; i++) {
        UserModel user = UserModel.fromJson(data[i]);
        userData.add(user);
      }
      // userData = userModelFromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return userData;
  }
}

final apiProvider = Provider<ApiServices>((ref) {
  return ApiServices();
});
