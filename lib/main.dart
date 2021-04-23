import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/screens/home.dart';
import 'package:flutter_app_demo/screens/login.dart';
import 'package:flutter_app_demo/screens/register.dart';
import 'package:get/get.dart';

import 'controllers/binding/auth_binding.dart';
import 'controllers/register_status/register_status.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
            name: "register", page: () => Register(), binding: AuthBinding()),
        GetPage(name: "login", page: () => Login(), binding: AuthBinding()),
        GetPage(name: "home", page: () => Home(), binding: AuthBinding()),
        GetPage(
            name: "registerStatus",
            page: () => RegisterStatus(),
            binding: AuthBinding())
      ],
      initialRoute: "registerStatus",
    );
  }
}
