import 'package:flutter_app_demo/controllers/image_controller/image_controller.dart';
import 'package:get/get.dart';

import '../auth_controller/auth_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
    Get.put(ImageController());
  }
}
