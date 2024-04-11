import 'package:get/get.dart';
import 'package:project_x/features/cart/bindings/cart_binding.dart';
import 'package:project_x/features/menu/bindings/menu_binding.dart';
import 'package:project_x/features/menu/presentation/pages/landing_menu_cart.dart';
import 'package:project_x/features/menu/presentation/pages/menu_view.dart';
import 'package:project_x/routes/routes.dart';
import '../features/home/bindings/home_binding.dart';
import '../features/home/presentation/pages/home_page.dart';

class AppPages{
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.MENU,
      page: () => const LandingMenuCart(),
      bindings: [
        CartBinding(),
        MenuBinding(),
      ]
    ),
  ];
}