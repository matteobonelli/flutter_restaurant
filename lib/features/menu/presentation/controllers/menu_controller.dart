
import 'package:get/get.dart';
import 'package:project_x/utils/firestore_helper.dart';

import '../../data/models/product.dart';


class MenusController extends GetxController {

  List<Product> _state = [];

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

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

}