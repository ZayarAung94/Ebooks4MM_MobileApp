import 'package:ebooks4mm/ui/widgets/app_dialog.dart';
import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "Logout",
      body: Text("Are you sure to logout?"),
      okLabel: "Logout",
    );
  }
}
