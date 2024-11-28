import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/screens/setting/childs/about.dart';
import 'package:ebooks4mm/ui/screens/setting/childs/following_writers.dart';
import 'package:ebooks4mm/ui/screens/setting/childs/how_to_used.dart';
import 'package:ebooks4mm/ui/screens/setting/childs/pravicy_policy.dart';
import 'package:ebooks4mm/ui/screens/setting/childs/whitelist.dart';
import 'package:ebooks4mm/ui/screens/setting/components/book_req_dialog.dart';
import 'package:ebooks4mm/ui/screens/setting/components/customer_support.dart';
import 'package:ebooks4mm/ui/screens/setting/components/download_dialog.dart';
import 'package:ebooks4mm/ui/screens/setting/components/logout_dialog.dart';
import 'package:ebooks4mm/ui/screens/setting/components/topup_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            color: AppColors.softBg,
            elevation: 10,
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Balance"),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: AppData.balance,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                      children: [
                        TextSpan(
                          text: "  MMK",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dashData("Own Books : 20"),
                      dashData("Finished : 10"),
                    ],
                  )
                ],
              ),
            ),
          ),
          settingTitle("Profile"),
          settingBtn(
            icon: Icons.person_2_rounded,
            label: "Name",
            value: AppData.userName,
          ),
          settingBtn(
            icon: Icons.email,
            label: "E-mail",
            value: AppData.email,
          ),
          settingBtn(
            icon: Icons.phone,
            label: "Phone",
            value: AppData.phone,
          ),
          settingBtn(
            icon: Icons.phone_android_outlined,
            label: "Active Device",
            value: AppData.activeDevice,
          ),
          settingBtn(
            icon: Icons.logout,
            label: "Logout",
            onTap: () {
              Get.dialog(LogoutDialog());
            },
          ),
          settingTitle("Control"),
          settingBtn(
            icon: Icons.monetization_on_outlined,
            label: "Top-up Money",
            onTap: () {
              Get.bottomSheet(TopupSheet());
            },
          ),
          settingBtn(
            icon: Icons.download_outlined,
            label: "Download My Own Books",
            onTap: () {
              Get.dialog(
                DownloadOwnBookDialog(),
              );
            },
          ),
          settingBtn(
            icon: Icons.star_border_purple500,
            label: "White List",
            onTap: () {
              Get.to(() => WhiteListScreen());
            },
          ),
          settingBtn(
            icon: Icons.favorite_outline,
            label: "Following Writers",
            onTap: () {
              Get.to(() => FollowingWritersScreen());
            },
          ),
          settingBtn(
            icon: Icons.request_page_outlined,
            label: "Request Book",
            onTap: () {
              Get.dialog(BookReqDialog());
            },
          ),
          settingTitle("About"),
          settingBtn(
            icon: Icons.support_agent_outlined,
            label: "Customer Services",
            onTap: () {
              Get.bottomSheet(CustomerSupport());
            },
          ),
          settingBtn(
            icon: Icons.movie,
            label: "How to Used!",
            onTap: () {
              Get.to(() => HowToUsedScreen());
            },
          ),
          settingBtn(
            icon: Icons.abc_outlined,
            label: "About EBooks 4MM",
            onTap: () {
              Get.to(() => AboutScreen());
            },
          ),
          settingBtn(
            icon: Icons.policy_outlined,
            label: "Pravicy Policy",
            onTap: () {
              Get.to(() => PravicyPolicyScreen());
            },
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text("Version : 1.001 (Beta)"),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }

  Container dashData(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(label),
    );
  }

  Padding settingTitle(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector settingBtn({
    required IconData icon,
    required String label,
    void Function()? onTap,
    String? value,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(
          left: 8,
          bottom: 8,
          right: 8,
        ),
        color: AppColors.softBg,
        elevation: 10,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(icon),
                      SizedBox(width: 15),
                      Text(
                        label,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: value == null ? 50 : 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          value ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: TextStyle(),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: Icon(Icons.chevron_right_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
