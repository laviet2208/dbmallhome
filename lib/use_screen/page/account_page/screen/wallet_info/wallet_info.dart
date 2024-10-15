import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/historyData/Transaction.dart';
import 'package:dbmallhome/data/otherdata/Tool.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/wallet_info/controller/wallet_controller.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/wallet_info/ingredient/item_history_transaction.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/wallet_info/ingredient/wallet_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../../data/finaldata.dart';
import '../../../../main_screen/main_screen.dart';
import '../view_account_info/ingredient/text_line_in_profile.dart';

class wallet_info extends StatefulWidget {
  const wallet_info({super.key});

  @override
  State<wallet_info> createState() => _wallet_infoState();
}

class _wallet_infoState extends State<wallet_info> {

  List<TransactionHis> hisList = [];

  Future<void> _refresh() async {
    hisList = await wallet_controller.get_his_list();
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
          title: wallet_appbar(),
        ),
        body: RefreshIndicator(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ListView(
                children: [
                  SizedBox(height: 10,),

                  text_line_in_profile(title: finaldata.mainlanguage.youraccountbalance, content: getStringNumber(finaldata.account.money) + ' .usd'),

                  SizedBox(height: 20,),

                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 0.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: Container(
                      height: 25,
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        finaldata.mainlanguage.historytransaction,
                        style: TextStyle(
                          fontFamily: 'muli',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 100,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: hisList.length,
                      itemBuilder: (context, index) {
                        return item_history_transaction(his: hisList.reversed.toList()[index]);
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
