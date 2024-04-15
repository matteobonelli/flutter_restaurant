import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/validators.dart';
import '../controllers/registration_controller.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        builder: (controller) => Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Registrazione",
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
                      controller: controller.name,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                          label: Text(
                            "Nome",
                            style: TextStyle(
                                color:
                                Theme.of(context).colorScheme.tertiary),
                          ),
                          hintText: "Gino"),
                      // maxLength: 30,
                      validator: validateName,
                      keyboardType: TextInputType.text,
                      cursorColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: controller.surname,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                          label: Text(
                            "Cognome",
                            style: TextStyle(
                                color:
                                Theme.of(context).colorScheme.tertiary),
                          ),
                          hintText: "Filiberti"),
                      // maxLength: 30,
                      validator: validateName,
                      keyboardType: TextInputType.text,
                      cursorColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    const SizedBox(height: 8),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Sei già registrato?", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
                        TextButton(onPressed: (){
                          controller.goToLogin();
                        }, child: const Text("Vai al login!", style: TextStyle(color: Colors.blueAccent),))
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        controller.validateRegistrationForm();
                      },
                      child: Text("Registrati" , style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
                    ),
                  ],
                ))
          ],
        ));
  }
}
