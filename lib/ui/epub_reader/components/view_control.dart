import 'package:flutter/material.dart';

class ViewControl extends StatelessWidget {
  const ViewControl({super.key});

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
                ButtonSegment(value: 0, label: Text("Light")),
                ButtonSegment(value: 1, label: Text("Grey")),
                ButtonSegment(value: 2, label: Text("Dark")),
              ],
              selected: <int>{2},
            ),
            SizedBox(height: 10),
            Text("Text Align"),
            SegmentedButton(
              // showSelectedIcon: false,
              segments: [
                ButtonSegment(value: 0, label: Icon(Icons.format_align_left)),
                ButtonSegment(value: 1, label: Icon(Icons.format_align_center)),
                ButtonSegment(value: 1, label: Icon(Icons.format_align_justify)),
                ButtonSegment(value: 1, label: Icon(Icons.format_align_right)),
              ],
              selected: <int>{0},
            ),
            SizedBox(height: 10),
            Text("Font Size"),
            SegmentedButton(
              // showSelectedIcon: false,
              segments: [
                ButtonSegment(value: 0, label: Text("XS")),
                ButtonSegment(value: 1, label: Text("S")),
                ButtonSegment(value: 2, label: Text("M")),
                ButtonSegment(value: 3, label: Text("L")),
                ButtonSegment(value: 4, label: Text("XL")),
              ],
              selected: <int>{2},
            ),
            SizedBox(height: 10),
            Text("Line Height"),
            SegmentedButton(
              // showSelectedIcon: false,
              segments: [
                ButtonSegment(value: 0, label: Text("1")),
                ButtonSegment(value: 1, label: Text("1.5")),
                ButtonSegment(value: 2, label: Text("2")),
                ButtonSegment(value: 3, label: Text("2.5")),
              ],
              selected: <int>{1},
            ),
            SizedBox(height: 10),
            Text("Page Flipping"),
            SegmentedButton(
              // showSelectedIcon: false,
              segments: [
                ButtonSegment(value: 0, label: Text("Vertical")),
                ButtonSegment(value: 1, label: Text("Horizontal")),
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
