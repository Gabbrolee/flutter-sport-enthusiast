import 'package:flutter/material.dart';

class DiscoveriesScreen extends StatefulWidget {
  const DiscoveriesScreen({Key? key}) : super(key: key);

  @override
  State<DiscoveriesScreen> createState() => _DiscoveriesScreenState();
}

class _DiscoveriesScreenState extends State<DiscoveriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("Discoveries Screen"),
      ),
    );
  }
}
