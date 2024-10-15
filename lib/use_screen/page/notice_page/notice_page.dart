import 'package:dbmallhome/use_screen/page/notice_page/controller/notice_page_controller.dart';
import 'package:dbmallhome/use_screen/page/notice_page/ingredient/item_notice.dart';
import 'package:dbmallhome/use_screen/page/notice_page/ingredient/notice_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../data/noticeData/noticeData.dart';

class notice_page extends StatefulWidget {
  const notice_page({super.key});

  @override
  State<notice_page> createState() => _notice_pageState();
}

class _notice_pageState extends State<notice_page> {

  List<noticeData> dataList = [];

  Future<void> _refresh() async {
    dataList = await notice_page_controller.get_notice_list();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: notice_app_bar(),
      ),
      body: RefreshIndicator(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              padding: EdgeInsets.only(top: 10),
              children: [
                Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: item_notice(data: dataList[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        onRefresh: _refresh,
      ),
    );
  }
}
