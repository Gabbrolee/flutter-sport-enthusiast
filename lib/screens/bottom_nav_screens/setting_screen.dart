import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sport_enthusiast/Service/Auth_Service.dart';
import 'package:toast/toast.dart';

import '../../main.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSelected = false;
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        // leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back),),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildSettings(
                title: "Change Password",
                icon: Icons.arrow_forward,
                onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            buildSettings(
                title: "Update Email",
                icon: Icons.arrow_forward,
                onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            buildSettings(
                title: "Update Username",
                icon: Icons.arrow_forward,
                onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            buildTheme(),
            const SizedBox(
              height: 20,
            ),
            buildSettings(
                title: "Log out",
                icon: Icons.arrow_forward,
                onTap: () async {
                  await authClass.signOut(context);
                  await Future.delayed(const Duration(seconds: 5));
                  signOut();
                }),
          ],
        ),
      ),
    );
  }

  signOut() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (builder) => MyApp()), (route) => false);
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Row buildTheme() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Theme Data"),
        CupertinoSwitch(
            trackColor: Colors.grey,
            activeColor: Colors.green,
            value: isSelected,
            onChanged: (value) {}),
      ],
    );
  }

  GestureDetector buildSettings(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Icon(icon)],
      ),
    );
  }
}
