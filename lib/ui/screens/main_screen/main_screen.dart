import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/screens/channel/channel.dart';
import 'package:ebooks4mm/ui/screens/home/home.dart';
import 'package:ebooks4mm/ui/screens/my_library/mylibrary.dart';
import 'package:ebooks4mm/ui/screens/setting/setting.dart';
import 'package:ebooks4mm/ui/screens/shop/shop.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String title = "eBooks 4MM";
  Color buttonColor = Colors.deepOrange;
  int pageIndex = 2;

  List<Widget> pages = [
    const ShopScreen(),
    const MyLibraryScreen(),
    const HomeScreen(),
    const ChannelScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 5, top: 5),
          child: const CircleAvatar(
            child: Image(image: AssetImage('assets/img/logo.png')),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pages[pageIndex],
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.shop, color: AppColors.assent),
          Icon(Icons.dashboard, color: AppColors.assent),
          Icon(Icons.home, color: AppColors.assent),
          Icon(Icons.card_membership, color: AppColors.assent),
          Icon(Icons.person_2_rounded, color: AppColors.assent),
        ],
        inactiveIcons: const [
          Text("Shop"),
          Text("My Books"),
          Text("Home"),
          Text("Channels"),
          Text("Profile"),
        ],
        color: AppColors.softBg,
        circleColor: Colors.purple,
        height: 60,
        circleWidth: 50,
        activeIndex: pageIndex,
        onTap: (index) {
          pageIndex = index;

          if (index == 0) {
            title = "Books Shop";
            buttonColor = AppColors.assent;
          } else if (index == 1) {
            title = "My Libiary";
            buttonColor = AppColors.assent;
          } else if (index == 2) {
            title = "eBooks 4MM";
            buttonColor = Colors.deepOrange;
          } else if (index == 3) {
            title = "Membership Channel";
            buttonColor = AppColors.assent;
          } else {
            title = "Profile & Settings";
            buttonColor = AppColors.assent;
          }

          setState(() {});
        },
      ),
    );
  }

  BottomNavigationBarItem myBNBI({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: AppColors.softBg,
      icon: Icon(
        icon,
      ),
      label: label,
    );
  }
}
