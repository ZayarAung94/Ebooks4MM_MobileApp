import 'package:ebooks4mm/ui/constant.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final Widget? body;
  final String? cancelLabel;
  final String? okLabel;
  final Function()? tapCancel;
  final Function()? tapOk;

  const AppDialog({
    super.key,
    required this.title,
    this.body,
    this.cancelLabel,
    this.okLabel,
    this.tapCancel,
    this.tapOk,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            body ?? SizedBox(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.softBg),
                  ),
                  onPressed: tapCancel ??
                      () {
                        Navigator.of(context).pop();
                      },
                  child: Text(cancelLabel ?? 'Cancel'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green.shade900),
                  ),
                  onPressed: tapOk ??
                      () {
                        // Handle positive action
                        Navigator.of(context).pop();
                      },
                  child: Text(okLabel ?? 'OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
