import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      color: Colors.white.withOpacity(0.8),
                      child:Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            LoginForm(),
                          ],
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
