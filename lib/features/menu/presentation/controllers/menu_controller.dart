
import 'package:get/get.dart';


class MenusController extends GetxController {
  RxString title = "Menu".obs;
  RxInt indexBottom = 0.obs;

   void getToPage(int index){
    if(index == 0){
      title.value = "Menu";
      indexBottom.value = index;
    } else {
      title.value = "Cart";
      indexBottom.value = index;
    }
  }

}