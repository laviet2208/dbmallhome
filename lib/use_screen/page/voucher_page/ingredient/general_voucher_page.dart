import 'package:dbmallhome/use_screen/page/voucher_page/ingredient/voucher_item.dart';
import 'package:flutter/material.dart';

import '../../../../data/voucherData/Voucher.dart';
import '../controller/voucher_page_controller.dart';

class general_voucher_page extends StatefulWidget {
  const general_voucher_page({super.key});

  @override
  State<general_voucher_page> createState() => _general_voucher_pageState();
}

class _general_voucher_pageState extends State<general_voucher_page> {
  List<Voucher> voucherList = [];

  Future<void> _refresh() async {
    voucherList = await voucher_page_controller.get_voucher_list();
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
      body: RefreshIndicator(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: ListView(
              padding: EdgeInsets.only(top: 10),
              children: [
                Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: voucherList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: voucher_item(voucher: voucherList[index]),
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
