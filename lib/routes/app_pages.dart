import 'package:get/get.dart';
import 'package:project_x/features/cart/bindings/cart_binding.dart';
import 'package:project_x/features/detail_page/bindings/detail_page_bindings.dart';
import 'package:project_x/features/detail_page/presentation/pages/detail_page_screen.dart';
import 'package:project_x/features/login/bindings/login_binding.dart';
import 'package:project_x/features/login/presentation/pages/login_screen.dart';
import 'package:project_x/features/menu/bindings/menu_binding.dart';
import 'package:project_x/features/menu/presentation/pages/menu_view.dart';
import 'package:project_x/features/registration/bindings/registration_binding.dart';
import 'package:project_x/features/registration/presentation/pages/registration_screen.dart';
import 'package:project_x/routes/routes.dart';
import '../features/cart/presentation/pages/cart_view.dart';
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
      page: () => const MenuView(),
      bindings: [MenuBinding(), CartBinding()]

    ),
    GetPage(
        name: Routes.CART,
        page: () => const CartView(),
        bindings: [
          CartBinding(),
        ]
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTRATION,
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: '/menu/:id',
      page: () => const DetailPageScreen(),
      binding: DetailPageBindings(),
    )
  ];
}