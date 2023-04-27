import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/model/user_model.dart';
import 'package:user_app/serivces/api_services.dart';

final userProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUserData();
});
