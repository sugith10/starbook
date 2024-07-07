import 'package:get/get.dart';
import 'package:star_book/model/user_model.dart';

import '../service/repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo;
  AuthController(this._authRepo);

  var userModel = Rxn<UserModel>();
  var errorMessage = ''.obs;

    Future<void> login(String email, String password) async {
    try {
      final UserModel user = await _authRepo.login(email, password);
      userModel.value = user;
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }

  void error(String error){
    errorMessage.value = error;
  }

  //Authentication failed. Please try again.
}
