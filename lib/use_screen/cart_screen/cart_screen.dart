import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/otherdata/Tool.dart';
import 'package:dbmallhome/data/voucherData/Voucher.dart';
import 'package:dbmallhome/use_screen/cart_screen/ingredient/caculate_total_money.dart';
import 'package:dbmallhome/use_screen/cart_screen/ingredient/cart_screen_app_bar.dart';
import 'package:dbmallhome/use_screen/cart_screen/ingredient/item_cart.dart';
import 'package:flutter/material.dart';

import '../main_screen/main_screen.dart';

class cart_screen extends StatefulWidget {
  final Widget beforeWidget;
  const cart_screen({super.key, required this.beforeWidget});

  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  final Voucher voucher = Voucher(id: '', Money: 0, mincost: 0, startTime: getCurrentTime(), endTime: getCurrentTime(), useCount: 0, maxCount: 0, eventName: '', type: 0, perCustom: 0, CustomList: [], maxSale: 0);
  Future<void> _Refresh() async {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: cart_screen_app_bar(beforeWidget: widget.beforeWidget),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: RefreshIndicator(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
                  child: AutoSizeText(
                    finaldata.mainlanguage.yourcart + finaldata.cartList.length.toString() + ')',
                    style: TextStyle(
                      fontFamily: 'muli',
                      fontSize: 100,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Container(
                child: ListView.builder(
                  itemCount: finaldata.cartList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return item_cart(cartdata: finaldata.cartList[index]);
                  },
                ),
              ),

              caculate_total_money(voucher: voucher,),
            ],
          ),
          onRefresh: _Refresh,
        ),
      ),
    ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cart_screen(beforeWidget: main_screen())),);
        return true;
      },
    );
  }
}
