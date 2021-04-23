import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controllers/auth_controller/auth_controller.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final authController = Get.find<AuthController>();

  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Feel at home')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              authController.signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("Users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.isBlank) {
              return const Center(
                child: Text("You don't have any unfinished tasks"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title:
                          Text(snapshot.data.docs[index]['Email'].toString()),
                      subtitle: Text(snapshot.data.docs[index]['First Name'].toString()),
                    ),
                  );
                },
              );
            }
            return null;
          } else {
            return const Center(
              child: Text("loading..."),
            );
          }
        },
      ),
    );
  }
}
