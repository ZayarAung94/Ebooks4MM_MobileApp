import 'package:ebooks4mm/ui/widgets/app_dialog.dart';
import 'package:flutter/material.dart';

class DownloadOwnBookDialog extends StatefulWidget {
  const DownloadOwnBookDialog({super.key});

  @override
  State<DownloadOwnBookDialog> createState() => _DownloadOwnBookDialogState();
}

class _DownloadOwnBookDialogState extends State<DownloadOwnBookDialog> {
  bool downloadStatus = false;
  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "Download All Books",
      body: downloadStatus
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: 10),
                  Text("1/10"),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Column(
                children: [
                  Text("Your have 20 books."),
                  SizedBox(height: 10),
                  Text(
                    "Do you want to download your all own books?",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
      okLabel: downloadStatus ? "Downloading..." : "Download",
      tapOk: () {
        if (downloadStatus == false) {
          setState(() {
            downloadStatus = true;
          });
        }
      },
    );
  }
}
