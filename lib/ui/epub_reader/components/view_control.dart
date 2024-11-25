import 'package:ebooks4mm/ui/epub_reader/models/view_config.dart';
import 'package:ebooks4mm/ui/widgets/btn_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewControl extends StatefulWidget {
  const ViewControl({super.key});

  @override
  State<ViewControl> createState() => _ViewControlState();
}

class _ViewControlState extends State<ViewControl> {
  int themeIndex = ViewConfigData.themeIndex;
  int textAlignIndex = ViewConfigData.textAlignIndex;
  int fontSizeIndex = ViewConfigData.fontSizeIndex;
  int lineHeightIndex = ViewConfigData.lineHeightIndex;
  int pageFlippingIndex = ViewConfigData.pageFlippingIndex;

  ViewConfig viewConfig = ViewConfig();

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
              selected: <int>{themeIndex},
              onSelectionChanged: (ind) {
                if (ind.first == 0) viewConfig.viewTheme = "Light";
                if (ind.first == 1) viewConfig.viewTheme = "Grey";
                if (ind.first == 2) viewConfig.viewTheme = "Dark";

                setState(() {
                  themeIndex = ind.first;
                });
              },
            ),
            SizedBox(height: 10),
            Text("Text Align"),
            SegmentedButton(
              // showSelectedIcon: false,
              segments: [
                ButtonSegment(value: 0, label: Icon(Icons.format_align_left)),
                ButtonSegment(value: 1, label: Icon(Icons.format_align_center)),
                ButtonSegment(value: 2, label: Icon(Icons.format_align_justify)),
                ButtonSegment(value: 3, label: Icon(Icons.format_align_right)),
              ],
              selected: <int>{textAlignIndex},
              onSelectionChanged: (ind) {
                if (ind.first == 0) viewConfig.textAlign = "left";
                if (ind.first == 1) viewConfig.textAlign = "center";
                if (ind.first == 2) viewConfig.textAlign = "justify";
                if (ind.first == 3) viewConfig.textAlign = "right";

                setState(() {
                  textAlignIndex = ind.first;
                });
              },
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
              selected: <int>{fontSizeIndex},
              onSelectionChanged: (ind) {
                if (ind.first == 0) viewConfig.fontSize = 12;
                if (ind.first == 1) viewConfig.fontSize = 14;
                if (ind.first == 2) viewConfig.fontSize = 16;
                if (ind.first == 3) viewConfig.fontSize = 18;
                if (ind.first == 4) viewConfig.fontSize = 20;
                setState(() {
                  fontSizeIndex = ind.first;
                });
              },
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
              selected: <int>{lineHeightIndex},
              onSelectionChanged: (ind) {
                if (ind.first == 0) viewConfig.lineHeight = 1;
                if (ind.first == 1) viewConfig.lineHeight = 1.5;
                if (ind.first == 2) viewConfig.lineHeight = 2;
                if (ind.first == 3) viewConfig.lineHeight = 2.5;
                setState(() {
                  lineHeightIndex = ind.first;
                });
              },
            ),
            SizedBox(height: 10),
            Text("Page Flipping"),
            SegmentedButton(
              // showSelectedIcon: false,
              segments: [
                ButtonSegment(value: 0, label: Text("Vertical")),
                ButtonSegment(value: 1, label: Text("Horizontal")),
              ],
              selected: <int>{pageFlippingIndex},
              onSelectionChanged: (ind) {},
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppBtn.expendedBtn(
                  color: Colors.green,
                  label: "Apply",
                  onPressed: () {
                    ViewConfigData.themeIndex = themeIndex;
                    ViewConfigData.textAlignIndex = textAlignIndex;
                    ViewConfigData.fontSizeIndex = fontSizeIndex;
                    ViewConfigData.lineHeightIndex = lineHeightIndex;
                    ViewConfigData.pageFlippingIndex = pageFlippingIndex;

                    Get.back(result: viewConfig);
                  }),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
