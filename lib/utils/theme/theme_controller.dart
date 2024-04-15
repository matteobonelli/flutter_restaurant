import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:project_x/features/menu/presentation/controllers/menu_controller.dart';
import 'package:project_x/utils/theme/theme.dart';

class ThemeController extends GetxController{

  Rx<ThemeData> themeData = lightMode.obs;

  void toggleTheme(){
    if(themeData.value == lightMode){
      themeData.value = darkMode;
    } else {
      themeData.value = lightMode;
    }
  }

}