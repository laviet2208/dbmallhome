import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/otherdata/Tool.dart';
import 'package:dbmallhome/data/voucherData/Voucher.dart';
import 'package:dbmallhome/use_screen/page/voucher_page/ingredient/gift_voucher/gift_voucher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/utils.dart';

class voucher_individual_item extends StatelessWidget {
  final Voucher voucher;
  final VoidCallback event;
  const voucher_individual_item({super.key, required this.voucher, required this.event});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // màu của shadow
            spreadRadius: 5, // bán kính của shadow
            blurRadius: 7, // độ mờ của shadow
            offset: Offset(0, 3), // vị trí của shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),

            Container(
              child: Row(
                children: [
                  Container(
                    width: (width - 30)/3,
                    height: (width - 30)/3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/mainlogo.png')
                        )
                    ),
                  ),

                  SizedBox(width: 10,),

                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              voucher.eventName,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width/25,
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              voucher.Money >= 100 ? (finaldata.mainlanguage.vouchercontent1  + getStringNumber(voucher.Money) + finaldata.mainlanguage.vouchercontent2) : (finaldata.mainlanguage.vouchercontent1  + voucher.Money.toStringAsFixed(0) + '% discount promo code for all products, buy now!'),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: width/30,
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: finaldata.mainlanguage.Timelimit,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width / 30,
                                        fontFamily: 'muli',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text: getDayTimeString(voucher.endTime),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width / 30,
                                        fontFamily: 'muli',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),

                          Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    voucher.id,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'muli',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width/30,
                                    ),
                                  ),

                                  SizedBox(width: 10,),

                                  GestureDetector(
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Icon(
                                        Icons.copy,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                    ),
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(text: voucher.id));
                                      toastMessage('copied successfully');
                                    },
                                  ),

                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return gift_voucher(voucher: voucher, event: event,);
                                        },
                                      );
                                    },
                                    autofocus: true,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        finaldata.mainlanguage.Giftthis,
                                        style: TextStyle(
                                          fontFamily: 'muli',
                                          color: Colors.blue,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),

                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}