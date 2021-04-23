import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controllers/auth_controller/auth_controller.dart';
import 'package:flutter_app_demo/screens/home.dart';
import 'package:flutter_app_demo/screens/login.dart';
import 'package:get/get.dart';

class RegisterStatus extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
     return (authController.user != null) ? Home() : Login();
    });
  }
}
