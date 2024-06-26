import 'package:get/get.dart';
import 'package:project_x/features/home/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

}