import 'package:ebooks4mm/ui/widgets/app_dialog.dart';
import 'package:flutter/material.dart';

class BookReqDialog extends StatelessWidget {
  const BookReqDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "Book Request",
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Book's Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              labelText: "Author's Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: "Your Comment (Optional)",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
      cancelLabel: "Back",
      okLabel: "Request",
    );
  }
}
