import 'package:ebooks4mm/api/auth.dart';
import 'package:ebooks4mm/ui/auth/login.dart';
import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "Logout",
      body: Text("Are you sure to logout?"),
      okLabel: "Logout",
      tapOk: () async {
        await Auth().logout();
        AppData.user = null;
        Get.offAll(() => LoginScreen());
      },
    );
  }
}
