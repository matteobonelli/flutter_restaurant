import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/validators.dart';
import '../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Divider(
                  color: Colors.black,
                ),
                Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("Email"),
                              hintText: "email@gmail.com"),
                          // maxLength: 30,
                          validator: validateEmail,
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration:
                              const InputDecoration(label: Text("Password")),
                          // maxLength: 30,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          onSaved: (value) {
                            controller.password = value!;
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              Get.offNamed("/menu");
                            }
                          },
                          child: const Text("Login"),
                          style: ButtonStyle(),
                        ),
                      ],
                    ))
              ],
            ));
  }
}
