import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/services/authentication_repository.dart';
import 'package:project_x/utils/theme/theme_controller.dart';

import '../../cart/presentation/controllers/cart_controller.dart';
import '../presentation/controllers/menu_controller.dart';

class MenuBinding extends Bindings {  @override
  void dependencies() {
    Get.lazyPut<MenusController>(() => MenusController());
    Get.put(CartController());
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
