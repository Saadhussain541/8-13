import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:testing/UserMain/AccessoriesScreen.dart';
import 'package:testing/UserMain/main_screen.dart';
import 'package:testing/UserMain/helpMenu.dart';
import '../ContactScreen.dart';
import '../reusable_widget/colors.dart';


class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override

  int selected_page = 0;

  void _pageshifter(int index){
    setState(() {
      selected_page = index;
    });
  }

  final List<Widget> page = [
    main_screen(),
    AccessoriesScreen(),
    ContactScreen(),
    helpMenu(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selected_page],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: GNav(
          tabBackgroundColor: MyColors.background_color.withOpacity(0.4),
          activeColor: MyColors.heading_color,
          gap: 6,
          curve: Curves.easeInExpo,
          selectedIndex: selected_page,
          onTabChange: _pageshifter,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
          tabs: [
            GButton(
                text: "Plants",
                icon: Icons.person),
            GButton(
                text: "Accessories",
                icon: Icons.energy_savings_leaf),
            GButton(
                text: "FeedBack",
                icon: Icons.feedback),
            GButton(
                text: "Profile",
                icon: Icons.place),
          ],
        ),
      ),
    );
  }
}
