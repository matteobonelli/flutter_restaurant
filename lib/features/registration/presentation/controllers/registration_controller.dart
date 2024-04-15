import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_x/features/registration/data/models/user.dart';

import '../../../../services/authentication_repository.dart';
import '../../../../utils/firestore_helper.dart';

class RegistrationController extends GetxController{

  late final GlobalKey<FormState> formKey;

  final name = TextEditingController();
  final surname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
  }

  void goToLogin(){
    Get.offAllNamed("/login");
  }

  void registrationUser(String email, String password) async {
    AuthenticationRepository.instance
        .registerWithEmailAndPassword(email, password, Users(name: name.text, surname: surname.text, email: email, isOwner: false));
  }

  String? validateRegistrationForm() {
    if (formKey.currentState!.validate()) {
      registrationUser(email.text.trim(), password.text.trim());
    }
    return null;
  }
}