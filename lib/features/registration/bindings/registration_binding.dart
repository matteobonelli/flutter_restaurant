import 'package:get/get.dart';
import 'package:project_x/features/registration/presentation/controllers/registration_controller.dart';

class RegistrationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }

}