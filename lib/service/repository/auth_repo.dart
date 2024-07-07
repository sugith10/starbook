import 'package:star_book/core/util/app_logger.dart';

import '../../model/user_model.dart';
import '../data/auth_data.dart';

class AuthRepo {
  final RemoteDataSource _remoteDataSource;
  AuthRepo(this._remoteDataSource);

  Future<UserModel> login(String email, String password) async {
    try {
      return await _remoteDataSource.emailSignIn(email, password);
    } catch (e) {
      appLogger.e(e);
      rethrow;
    }
  }
}
