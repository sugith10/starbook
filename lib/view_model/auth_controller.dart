import 'package:get/get.dart';
import 'package:star_book/core/util/app_exception.dart';
import 'package:star_book/view/util/app_notification.dart';

import '../model/user_model.dart';
import '../service/repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo;
  AuthController(this._authRepo);

  var userModel = Rxn<UserModel>();
  var errorMessage = Rxn<AppNotification>();
  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    _callLoading(true);
    await Future.delayed(Duration(seconds: 2), () {});
    try {
      final UserModel user = await _authRepo.login(email, password);
      userModel.value = user;
    } on AppException catch (e) {
      error(e);
    } finally {
      _callLoading(false);
    }
  }

  Future<void> register(String email, String password, String name) async {
    _callLoading(true);
   await Future.delayed(Duration(seconds: 2), () {});
    try {
      final UserModel user = await _authRepo.register(email, password, name);
      userModel.value = user;
    } on AppException catch (e) {
      error(e);
    } finally {
      _callLoading(false);
    }
  }

  void error(AppException error) {
    errorMessage.value = AppNotification(
      title: error.alert,
      description: error.details,
    );
  }

  void _callLoading(bool value) {
    isLoading.value = value;
    print(isLoading.value);
  }
}
