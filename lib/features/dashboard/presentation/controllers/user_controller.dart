import 'package:get/get.dart';
import 'package:project_x/utils/firestore_helper.dart';

import '../../../../services/authentication_repository.dart';
import '../../../registration/data/models/user.dart';

class UserController extends GetxController{

  final authController = Get.find<AuthenticationRepository>();
  late final Users userData;

  @override
  void onInit() async {
    userData = await FirestoreHelper.fetchUser(authController.firebaseUser.value!.uid.toString());
    update();
    super.onInit();
  }

}