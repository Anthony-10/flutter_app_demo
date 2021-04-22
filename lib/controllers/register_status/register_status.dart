import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controllers/auth_controller.dart';
import 'package:flutter_app_demo/screens/home.dart';
import 'package:flutter_app_demo/screens/login.dart';
import 'package:get/get.dart';

class RegisterStatus extends StatelessWidget {

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return   Obx((){
      if(authController.user !=null){
        Get.toNamed("home");
      }else{
        Get.toNamed("login");
      }
      return;
     // return(Get.find<AuthController>().user !=null) ? Home(): Login();
    });
  }
}
