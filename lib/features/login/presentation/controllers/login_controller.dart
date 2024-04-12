import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';


  GlobalKey<FormState> get formKey{
    return _formKey;
  }

}