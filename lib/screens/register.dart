import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controllers/auth_controller.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

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
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50.0,
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
                    controller: _emailController,
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
                      authController.createUser(email: _emailController.text, password: _passwordController.text);
                      // final String retVal =
                      // await context.read<Auth>().createAccount(
                      //   email: _emailController.text,
                      //   password: _passwordController.text,
                      // );
                      // if (retVal == "Success") {
                      //   _emailController.clear();
                      //   _passwordController.clear();
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(retVal),
                      //     ),
                      //   );
                      // }
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
