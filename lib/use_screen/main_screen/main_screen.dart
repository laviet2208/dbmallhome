import 'package:dbmallhome/data/Account/Account.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/page/account_page/account_page.dart';
import 'package:dbmallhome/use_screen/page/main_page/main_page.dart';
import 'package:dbmallhome/use_screen/page/notice_page/notice_page.dart';
import 'package:dbmallhome/use_screen/page/search_page/controller/controller.dart';
import 'package:dbmallhome/use_screen/page/search_page/search_page.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/voucher_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  Widget get_body_widget() {
    if (finaldata.currentPage == 0) {
      return main_page(event: () { setState(() {}); },);
    }
    if (finaldata.currentPage == 1) {
      return account_page(event: () { setState(() {}); },);
    }
    if (finaldata.currentPage == 2) {
      return search_page();
    }
    if (finaldata.currentPage == 3) {
      return notice_page();
    }
    if (finaldata.currentPage == 4) {
      return voucher_page();
    }
    return Container();
  }

  Future<void> get_all_product() async {
    if (finaldata.productList.length == 0) {
      finaldata.productList = await search_page_controller.get_product_list();
      print('Số lượng: ' + finaldata.productList.length.toString());
    }
  }

  void get_account_data() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("Account").child(finaldata.account.id).onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      finaldata.account = Account.fromJson(data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_account_data();
    get_all_product();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width.toString() + ' ' + MediaQuery.of(context).size.height.toString());
    return WillPopScope(
      child: Scaffold(
        body: get_body_widget(),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blueAccent.withOpacity(0.2),
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.blue)
            ),
            backgroundColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          ),
          child: NavigationBar(
            height: 70,
            selectedIndex: finaldata.currentPage,
            onDestinationSelected: (selectedPage) => setState(() {finaldata.currentPage = selectedPage;}),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: finaldata.currentPage == 0 ? Colors.blue : Colors.black,),
                label: finaldata.mainlanguage.home,
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle_outlined, color: finaldata.currentPage == 1 ? Colors.blue : Colors.black,),
                label: finaldata.mainlanguage.account,
              ),
              NavigationDestination(
                icon: Icon(Icons.search, color: finaldata.currentPage == 2 ? Colors.blue : Colors.black,),
                label: finaldata.mainlanguage.search,
              ),
              NavigationDestination(
                icon: Icon(Icons.notifications_none, color: finaldata.currentPage == 3 ? Colors.blue : Colors.black,),
                label: finaldata.mainlanguage.notice,
              ),
              NavigationDestination(
                icon: Icon(Icons.discount_outlined),
                label: finaldata.mainlanguage.voucher,
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
