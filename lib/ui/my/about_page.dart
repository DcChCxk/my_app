import 'package:flutter/material.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/generated/l10n.dart';
import 'package:my_app/ui/get_word.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).about_us),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 100,
                child: Image.asset("assets/my/head.jpg"),
              ),
            ),
            Text(
              "My APP v1.0.0测试版",
              style: MyStyle.text_style_14_153,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
                "这是一个性格开朗、稳重、有活力，待人热情、真诚。工作认真负责，积极主动，能吃苦耐劳。自信心强。思想活跃。有较强的组织能力、实践动手能力和团队协作精神，能迅速的适应各种环境，并融于其中的靓仔写的。"),
          ],
        ),
      ),
        floatingActionButton: Ink(
          child: InkWell(
            onTap: () {
              _makePhoneCall("19847370450");
            },
            child: Text(
              "点击联系这个靓仔",
              style: TextStyle(color: Colors.blue,decoration:TextDecoration.underline),
            ),
          ),
        ),
      bottomNavigationBar: GetWord(),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}
