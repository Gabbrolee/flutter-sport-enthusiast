import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_sport_enthusiast/screens/HomeScreen.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {

  final firebase_auth.FirebaseAuth _firebaseAuth = firebase_auth.FirebaseAuth.instance;

  late Timer timer;
  firebase_auth.User? _user;

  @override
  void initState() {
    _user = _firebaseAuth.currentUser;
    _user?.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      checkEmailVerify();

    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify your email"),
        centerTitle: true,
      ),
      body:  Center(child: Text("An email has been sent to ${_user?.email} please verify"),),
    );
  }

  Future<void> checkEmailVerify() async {
    _user = _firebaseAuth.currentUser;
    await _user?.reload();
    if(_user!.emailVerified){
      timer.cancel();
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }
  }
}
