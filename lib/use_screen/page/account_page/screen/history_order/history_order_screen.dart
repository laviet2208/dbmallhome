import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/orderData/Order.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/history_order/controller/history_order_controller.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/history_order/ingredient/his_order_appbar.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/history_order/ingredient/his_order_item.dart';
import 'package:flutter/material.dart';

import '../../../../../data/historyData/Transaction.dart';
import '../../../../main_screen/main_screen.dart';

class history_order_screen extends StatefulWidget {
  const history_order_screen({super.key});

  @override
  State<history_order_screen> createState() => _history_order_screenState();
}

class _history_order_screenState extends State<history_order_screen> {
  List<Order> orderList = [];

  Future<void> _refresh() async {
    orderList = await history_order_controller.get_order_list();
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
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => main_screen()));
            },
          ),
          title: his_order_appbar(),
        ),
        body: RefreshIndicator(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: 10,),

                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        return his_order_item(order: orderList.reversed.toList()[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          onRefresh: _refresh,
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => main_screen()));
        return true;
      },
    );
  }
}
