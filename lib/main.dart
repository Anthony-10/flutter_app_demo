import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/screens/home.dart';
import 'package:flutter_app_demo/screens/login.dart';
import 'package:flutter_app_demo/screens/register.dart';
import 'package:get/get.dart';

import 'controllers/binding/register_binding.dart';
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
            name: "register", page: () => Register(), binding: RegisterBinding()),
        GetPage(name: "login", page: () => Login(), binding: RegisterBinding()),
        GetPage(name: "home", page: () => Home(), binding: RegisterBinding()),
        GetPage(
            name: "registerStatus",
            page: () => RegisterStatus(),
            binding: RegisterBinding())
      ],
      initialRoute: "registerStatus",
    );
  }
}
