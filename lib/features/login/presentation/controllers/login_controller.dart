import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/services/authentication_repository.dart';

class LoginController extends GetxController {
  final authController = Get.find<AuthenticationRepository>();
  late final GlobalKey<FormState> formKey;

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
  }

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
  }

  void goToRegistration(){
    Get.offAllNamed("/registration");
  }

  void validateLoginForm() {
    authController.errorMessage.value = '';
    if (formKey.currentState!.validate()) {
      loginUser(email.text.trim(), password.text.trim());
    }
  }
}
