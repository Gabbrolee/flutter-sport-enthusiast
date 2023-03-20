import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_sport_enthusiast/Service/Auth_Service.dart';
import 'package:flutter_sport_enthusiast/main.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_screens/buddies_screen.dart';
import 'bottom_nav_screens/discoveries_screen.dart';
import 'bottom_nav_screens/profile_screen.dart';
import 'bottom_nav_screens/setting_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  int index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  List<Widget> items = [
    const Icon(Icons.account_circle, size: 30,),
    const Icon(Icons.person_2, size: 30,),
    const Icon(Icons.cached_rounded, size: 30,),
    const Icon(Icons.settings, size: 30,),
  ];

  final screens = [
    ProfileScreen(username: '', interest: [], phoneNumber: '',),
    const BuddiesScreen(),
    const DiscoveriesScreen(),
    const SettingScreen()
  ];
  // @override
  // Widget build(BuildContext context) {
  //   // return Scaffold(
  //   //   // appBar: AppBar(
  //   //   //   title: const Text('Home'),
  //   //   //   centerTitle: true,
  //   //   //   // actions: [
  //   //   //   //   IconButton(
  //   //   //   //       icon: Icon(Icons.logout),
  //   //   //   //       onPressed: () async {
  //   //   //   //         await authClass.signOut(context);
  //   //   //   //         Navigator.pushAndRemoveUntil(
  //   //   //   //             context,
  //   //   //   //             MaterialPageRoute(builder: (builder) => MyApp()),
  //   //   //   //             (route) => false);
  //   //   //   //       }),
  //   //   //   // ],
  //   //   // ),
  //   //
  //   //
  //   //
  //   //
  //   // );
  //
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
          extendBody: true,
          // appBar: AppBar(
          //   title: const Text("Home"),
          // ),
          body: screens[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.white)
            ),
            child: CurvedNavigationBar(
                key: navigationKey,
                color: Colors.blue,
                buttonBackgroundColor: Colors.orange,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInCubic,
                animationDuration: const Duration(milliseconds: 300),
                items: items,
                height: 60,
                index: index,
                onTap: (index)=> setState(() {
                  this.index = index;
                })
            ),
          ),
        ),
      ),
    );
  }
}
