import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/voucherData/Voucher.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/controller/voucher_page_controller.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/ingredient/general_voucher_page.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/ingredient/individual_voucher_page.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/ingredient/voucher_app_bar.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/ingredient/voucher_item.dart';
import 'package:flutter/material.dart';

class voucher_page extends StatefulWidget {
  const voucher_page({super.key});

  @override
  State<voucher_page> createState() => _voucher_pageState();
}

class _voucher_pageState extends State<voucher_page> with SingleTickerProviderStateMixin {
  int indexTab = 0;
  late TabController _tabController;

  Widget getwidget() {
    if (indexTab == 0) {
      return general_voucher_page();
    }
    return individual_voucher_page();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: voucher_app_bar(),
      ),
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: SizedBox.shrink(),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    indexTab = index;
                  });
                },
                dividerColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(fontFamily: 'muli', fontWeight: FontWeight.bold), // TextStyle của văn bản khi được chọn
                padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 5),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey.withOpacity(0.2),
                ),
                tabs: [
                  Tab(text: finaldata.mainlanguage.GeneralVoucher),
                  Tab(text: finaldata.mainlanguage.IndividualVoucher),
                ],
              ),
            ],

          ),
        ),
        body: getwidget(),
      ),
    );
  }
}
