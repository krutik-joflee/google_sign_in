// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/myhomepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
Future<void> logOut() async {
  await FirebaseAuth.instance.signOut();
  if (await GoogleSignIn().isSignedIn()) {
    await GoogleSignIn()
        .signOut()
        .then((value) => print('Google SignOut Successfully'));
  }
}

class HomeScreen extends StatelessWidget {
  final User? user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME SCREEN"),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${user?.email}"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${user?.displayName}"),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(user?.photoURL ?? "")),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: () {
                      logOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    },
                    child: Text("SIGN OUT")),
              )
            ],
          ),
        ),
      )),
    );
  }
}
