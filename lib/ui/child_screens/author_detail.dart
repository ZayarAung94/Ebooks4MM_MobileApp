import 'package:ebooks4mm/models/author.dart';
import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/widgets/btn_helper.dart';
import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  const AuthorDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Author author = Author(
      name: "မြသန်းတင့်",
      avaliableBooks: 40,
      about: MyText.long,
      books: ["မှောင်မိုက်မှာငို (၁၉၉၄)", "ဓါးတောင်ကိုကျော်၍ မီးပင်လယ်ကိုဖြတ်မည် (၂၀၀၀)"],
      achivement: ['စာပေဗိမာန် ဘာသာပြန်ဆု (၁၉၉၄)'],
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: Text("Author's Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 50),
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
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: AppBtn.expendedBtn(color: AppColors.assent, label: "Follow"),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: AppBtn.expendedBtn(color: Colors.green.shade900, label: "Avaliable Books"),
                  )
                ],
              ),
              SizedBox(height: 10),
              title("About"),
              Text(author.about ?? ""),
              title("Books"),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: author.books == null ? 0 : author.books!.length,
                itemBuilder: (context, index) {
                  String book = author.books![index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${index + 1}. "),
                      Expanded(
                        child: Text(
                          book,
                          style: TextStyle(
                            fontFamily: AppData.mmFont,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              title("Achivement"),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: author.achivement == null ? 0 : author.achivement!.length,
                itemBuilder: (context, index) {
                  String achivement = author.achivement![index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${index + 1}. "),
                      Expanded(
                        child: Text(
                          achivement,
                          style: TextStyle(
                            fontFamily: AppData.mmFont,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 17,
          color: AppColors.assent,
        ),
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
