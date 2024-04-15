import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/services/authentication_repository.dart';
import 'package:project_x/features/login/presentation/pages/login_screen.dart';
import 'package:project_x/firebase_options.dart';
import 'package:project_x/routes/app_pages.dart';
import 'package:project_x/utils/theme/theme.dart';
import 'package:project_x/utils/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeController());
    return Obx(() =>
      GetMaterialApp(
        getPages: AppPages.routes,
        home: const CircularProgressIndicator(),
        title: 'Flutter Demo',
        theme: controller.themeData.value,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}