import 'package:get/get.dart';

import '../../service/data/auth_data.dart';
import '../../service/repository/auth_repo.dart';
import '../../view_model/auth_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource());
    Get.lazyPut<AuthRepo>(() => AuthRepo(Get.find<RemoteDataSource>()));
    Get.lazyPut<AuthController>(() => AuthController(Get.find<AuthRepo>()));

    
  }
}
