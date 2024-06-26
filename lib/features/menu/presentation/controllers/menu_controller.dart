
import 'package:get/get.dart';
import 'package:project_x/utils/firestore_helper.dart';

import '../../../../services/authentication_repository.dart';
import '../../data/mock_data/mock_data.dart';
import '../../data/models/product.dart';


class MenusController extends GetxController {

  List<Product> _state = [];

  @override
  void onReady() async {
    getProducts();
    super.onReady();
  }

  // @override
  // void onReady() async {
  //   await FirestoreHelper.addProducts(productList);
  //   super.onReady();
  // }

  void getProducts() async{
    _state = await FirestoreHelper.fetchProducts();
    update();
  }

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