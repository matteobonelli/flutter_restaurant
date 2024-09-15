
import 'package:get/get.dart';
import 'package:project_x/features/dashboard/presentation/controllers/user_controller.dart';
import 'package:project_x/utils/firestore_helper.dart';

import '../../../../services/authentication_repository.dart';
import '../../data/mock_data/mock_data.dart';
import '../../data/models/product.dart';


class MenusController extends GetxController {

  final userController = Get.find<UserController>();
  final authController = Get.find<AuthenticationRepository>();
  List<Product> _state = [];

  @override
  void onInit() async {
    _state = await FirestoreHelper.fetchProducts();
    update();
    super.onInit();
  }

  // @override
  // void onReady() async {
  //   await FirestoreHelper.addProducts(productList);
  //   super.onReady();
  // }

  List<Product> get products{
    return _state;
  }

  void getToCart(int index){
    if(index == 0){
      return;
    }
    Get.toNamed("/cart");
  }

  void logout() {
    AuthenticationRepository.instance.logout();
  }

}