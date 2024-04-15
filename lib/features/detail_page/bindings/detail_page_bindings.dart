import 'package:get/get.dart';
import 'package:project_x/utils/theme/theme_controller.dart';

class DetailPageBindings extends Bindings {  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
