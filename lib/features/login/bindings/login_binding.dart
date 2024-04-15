import 'package:get/get.dart';
import 'package:project_x/features/login/presentation/controllers/login_controller.dart';
import 'package:project_x/services/authentication_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
