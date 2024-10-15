import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/orderData/Order.dart';
import 'package:dbmallhome/use_screen/cart_screen/check_out/ingredient/update_note.dart';
import 'package:dbmallhome/use_screen/cart_screen/check_out/ingredient/update_receiver_info.dart';
import 'package:flutter/material.dart';

class receiver_info extends StatefulWidget {
  final Order order;
  const receiver_info({super.key, required this.order});

  @override
  State<receiver_info> createState() => _receiver_infoState();
}

class _receiver_infoState extends State<receiver_info> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),

          GestureDetector(
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: (width - 50)/3,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      'Ship to',
                      style: TextStyle(
                        fontFamily: 'muli',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                      ),
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
                              widget.order.receiver.name == '' ? 'Please add your name' : widget.order.receiver.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/25,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.district == '' ? finaldata.mainlanguage.Pleaseaddyourdistrict : widget.order.receiver.district,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/25,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.city == '' ? finaldata.mainlanguage.Pleaseaddyourcity : widget.order.receiver.city,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/25,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.province == '' ? finaldata.mainlanguage.Pleaseaddyourprovince : (widget.order.receiver.province + ' ' + widget.order.receiver.podcode),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/25,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.nation == '' ? finaldata.mainlanguage.Pleaseaddyournation : widget.order.receiver.nation,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/25,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.phoneNumber == '' ? finaldata.mainlanguage.PleaseaddyourphoneNum : widget.order.receiver.phoneNumber,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/25,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return update_receiver_info(order: widget.order, event: () {setState(() {});},);
                },
              );
            },
          ),

          SizedBox(height: 10,),

          GestureDetector(
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: (width - 50)/3,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Note',
                      style: TextStyle(
                        fontFamily: 'muli',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: width/25,
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Expanded(
                    child: Container(
                      child: Text(
                        widget.order.note == '' ? finaldata.mainlanguage.Clicktoaddnote : widget.order.note,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: width/25,
                          color: Colors.black,
                          fontFamily: 'muli',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return update_note(order: widget.order, event: () {setState(() {});},);
                },
              );
            },
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
