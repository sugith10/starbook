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

  Future<void> login(String email, String password) async {
    try {
      final UserModel user = await _authRepo.login(email, password);
      userModel.value = user;
    } on AppException catch(e){
      error(e);
    }
  }

  void error(AppException error) {
    errorMessage.value = AppNotification(
      title: error.alert,
      description: error.details,
    );
  }

  //Authentication failed. Please try again.
}
