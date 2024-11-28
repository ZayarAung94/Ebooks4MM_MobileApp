import 'package:ebooks4mm/models/author.dart';
import 'package:ebooks4mm/ui/child_screens/author_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';

class FollowingWritersScreen extends StatelessWidget {
  const FollowingWritersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Author> authors = [
      Author(name: "လွမ်းထားထား", avaliableBooks: 30),
      Author(name: "မြသန်းတင့်", avaliableBooks: 40),
      Author(name: "ရွှေဥဒေါင်း", avaliableBooks: 50),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: Text("Following Authors"),
      ),
      body: ListView.builder(
        itemCount: authors.length,
        itemBuilder: (context, index) {
          Author author = authors[index];
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.to(() => AuthorDetail());
            },
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            author.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppData.mmFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          dataRow(label: "Avaliable Books", value: "${author.avaliableBooks}"),
                          dataRow(label: "Follower", value: "${author.follower}"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Text dataRow({required String label, required String value}) {
    return Text.rich(
      TextSpan(
        text: "$label : ",
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
