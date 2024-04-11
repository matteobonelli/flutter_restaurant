import 'package:get/get.dart';

import '../../../menu/data/models/product.dart';

class CartController extends GetxController {
  RxMap _productList = {}.obs;

  void addProduct(Product p) {
    if (_productList.containsKey(p)) {
      _productList[p] += 1;
    } else {
      _productList[p] = 1;
    }

    Get.snackbar("Product added", "You have added ${p.name} to your cart",
        snackPosition: SnackPosition.BOTTOM);
  }
}
