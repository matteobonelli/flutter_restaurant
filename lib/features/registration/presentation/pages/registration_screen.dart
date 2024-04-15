import 'package:flutter/material.dart';
import 'package:project_x/features/registration/presentation/widgets/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/pasta.jpg"))),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Card(
                        color: Theme.of(context).colorScheme.background.withOpacity(0.7),
                        child:const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RegistrationForm(),
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                )
              ]
          ),
        ));
  }
}
