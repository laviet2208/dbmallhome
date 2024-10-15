import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/ingredient/voucher_individual_item.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/ingredient/voucher_item.dart';
import 'package:flutter/material.dart';

class individual_voucher_page extends StatefulWidget {
  const individual_voucher_page({super.key});

  @override
  State<individual_voucher_page> createState() => _individual_voucher_pageState();
}

class _individual_voucher_pageState extends State<individual_voucher_page> {

  Future<void> _refresh() async {
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    itemCount: finaldata.account.voucherList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: voucher_individual_item(voucher: finaldata.account.voucherList[index], event: () { setState(() {}); },),
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
