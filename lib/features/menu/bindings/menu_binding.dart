import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/presentation/controllers/cart_controller.dart';
import '../presentation/controllers/menu_controller.dart';

class MenuBinding extends Bindings {  @override
  void dependencies() {
    Get.lazyPut<MenusController>(() => MenusController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
