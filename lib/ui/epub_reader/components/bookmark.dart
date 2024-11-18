import 'package:flutter/material.dart';

class BookmarkSheet extends StatelessWidget {
  const BookmarkSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 3,
              margin: const EdgeInsets.only(top: 4),
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            SegmentedButton(
              segments: [
                ButtonSegment(value: 0, label: Text("Bookmark")),
                ButtonSegment(value: 1, label: Text("Highlights")),
                ButtonSegment(value: 2, label: Text("Notes")),
              ],
              selected: <int>{1},
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
