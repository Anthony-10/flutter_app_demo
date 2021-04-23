import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controllers/auth_controller/auth_controller.dart';
import 'package:flutter_app_demo/controllers/image_controller/image_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authController = Get.find<AuthController>();
  final imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Builder(builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      imageController.getImage(ImageSource.gallery);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Obx(() => imageController
                                    .selectedImagePath.value ==
                                ''
                            ? const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 50.0,
                              )
                            : Image.file(
                                File(imageController.selectedImagePath.value),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    key: const ValueKey("username"),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: "Username"),
                    controller: _userController,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    key: const ValueKey("email"),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: "Email"),
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    key: const ValueKey("password"),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    key: const ValueKey("createAccount"),
                    onPressed: () async {
                      authController.createUser(
                          firstName: _userController.text,
                          email: _emailController.text,
                          password: _passwordController.text);
                    },
                    child: const Text("Create Account"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('login');
                      },
                      child: const Text('Already have an account Login')),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
