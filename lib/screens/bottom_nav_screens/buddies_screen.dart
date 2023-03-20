import 'package:flutter/material.dart';

class BuddiesScreen extends StatefulWidget {
  const BuddiesScreen({Key? key}) : super(key: key);

  @override
  State<BuddiesScreen> createState()=> _BuddiesScreenState();
}

class _BuddiesScreenState extends State<BuddiesScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Buddies"),
      ),
    );
  }
}
