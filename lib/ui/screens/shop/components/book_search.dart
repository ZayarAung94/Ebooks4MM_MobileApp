import 'package:ebooks4mm/ui/screens/shop/childs/by_bestseller.dart';
import 'package:ebooks4mm/ui/screens/shop/childs/by_category.dart';
import 'package:ebooks4mm/ui/screens/shop/childs/search_bookname.dart';
import 'package:ebooks4mm/ui/screens/shop/childs/search_writer.dart';
import 'package:ebooks4mm/ui/widgets/btn_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';

class BookSearch extends StatelessWidget {
  const BookSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.softBg,
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
            const Text(
              "Search Options",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: AppBtn.expendedBtn(
                color: AppColors.assent,
                label: "Search by Book's Name",
                onPressed: () {
                  Get.to(() => const SearchByBookName());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: AppBtn.expendedBtn(
                color: AppColors.assent,
                label: "Search by Writer's Name",
                onPressed: () {
                  Get.to(() => const SearchByWriterName());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: AppBtn.expendedBtn(
                color: AppColors.assent,
                label: "Search by Category",
                onPressed: () {
                  Get.to(() => const SearchByCategory());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: AppBtn.expendedBtn(
                color: AppColors.assent,
                label: "Search by Best Seller",
                onPressed: () {
                  Get.to(() => const SearchByBestSeller());
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
