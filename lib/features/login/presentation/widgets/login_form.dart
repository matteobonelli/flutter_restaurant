import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/services/authentication_repository.dart';

import '../../../../shared/validators.dart';
import '../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationRepository>();
    return GetBuilder<LoginController>(
        builder: (controller) => Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                              label: Text(
                                "Email",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary),
                              ),
                              hintText: "email@gmail.com"),
                          // maxLength: 30,
                          validator: validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Theme.of(context).colorScheme.tertiary,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: controller.password,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                              label: Text("Password",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary))),
                          // maxLength: 30,
                          obscureText: true,
                          validator: validatePassword,
                          keyboardType: TextInputType.text,
                          cursorColor: Theme.of(context).colorScheme.tertiary,
                        ),
                        const SizedBox(height: 8),
                        Obx(() => authController.errorMessage.value != '' ? SizedBox(
                          height: 16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(authController.errorMessage.value, style: TextStyle(color: Colors.red),),
                            ],
                          ),
                        ) : const SizedBox(height: 0,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Non hai un profilo?", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
                            TextButton(onPressed: (){
                              controller.goToRegistration();
                            }, child: Text("Registrati!", style: TextStyle(color: Colors.blueAccent),))
                          ],
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            controller.validateLoginForm();
                          },
                          child: Text("Login" , style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
                        ),
                      ],
                    ))
              ],
            ));
  }
}
