import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controllers/auth_controller.dart';
import 'package:get/get.dart';

class RegisterStatus extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (authController.user != null) {
        "home";
      } else {
        "login";
      }
      return;
    });
  }
}
