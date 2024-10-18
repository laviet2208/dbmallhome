import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/page/account_page/ingredient/account_page_appbar.dart';
import 'package:dbmallhome/use_screen/page/account_page/ingredient/feature_button.dart';
import 'package:dbmallhome/use_screen/page/account_page/ingredient/language_change.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/history_order/history_order_screen.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/view_account_info/view_account_info_screen.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/view_all_productType/view_all_productType.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/wallet_info/wallet_info.dart';
import 'package:dbmallhome/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../before_screen/login_screen/loading_screen.dart';
import '../../../data/chatData/chatRoom.dart';
import '../../../data/chatData/messenger.dart';
import 'screen/chat_room/chat_room.dart';

class account_page extends StatefulWidget {
  final VoidCallback event;
  const account_page({super.key, required this.event});

  @override
  State<account_page> createState() => _account_pageState();
}

class _account_pageState extends State<account_page> {
  bool loading = false;
  chatRoom room = chatRoom(account: finaldata.account, messengerList: []);
  Future<void> getChatRoom() async {
    final reference = FirebaseDatabase.instance.ref();
    await reference.child("Chatrooms").child(finaldata.account.id).onValue.listen((event) async {
      final dynamic Chatrooms = event.snapshot.value;
      if(Chatrooms != null) {
        room = chatRoom.fromJson(Chatrooms);
        await pushChatRooms(room);
      } else {
        room = chatRoom(account: finaldata.account, messengerList: []);
        room.messengerList.add(messenger(type: 2, content: "Hello, this is DB Mall's customer service department, how can we help you?"));
        await pushChatRooms(room);
      }
    });
  }

  Future<void> pushChatRooms(chatRoom room) async {
    final reference = FirebaseDatabase.instance.ref();
    await reference.child("Chatrooms").child(finaldata.account.id).set(room.toJson());
  }


  Future<void> _refresh() async {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: account_page_appbar(),
      ),
      body: RefreshIndicator(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              finaldata.account.firstName + ' ' + finaldata.account.lastName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'muli',
                                fontSize: 100,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 25,
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Feature',
                    style: TextStyle(
                      fontFamily: 'muli',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 100,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              GestureDetector(
                child: feature_button(iconData: Icons.notifications_none, title: finaldata.mainlanguage.notification,),
                onTap: () {
                  finaldata.currentPage = 3;
                  widget.event();
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.discount_outlined, title: finaldata.mainlanguage.YourVoucher,),
                onTap: () {
                  finaldata.currentPage = 4;
                  widget.event();
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.search, title: finaldata.mainlanguage.ProductSearch,),
                onTap: () {
                  finaldata.currentPage = 2;
                  widget.event();
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.category_outlined, title: finaldata.mainlanguage.ViewCategories,),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => view_all_productType()));
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.language, title: finaldata.mainlanguage.viewnow == 'View now' ? 'Language' : 'Ngôn ngữ',),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return language_change(event: () {setState(() {});});
                    },
                  );
                },
              ),

              SizedBox(height: 30,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 25,
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    finaldata.mainlanguage.Information,
                    style: TextStyle(
                      fontFamily: 'muli',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 100,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              GestureDetector(
                child: feature_button(iconData: Icons.account_circle_outlined, title: finaldata.mainlanguage.youraccount,),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => view_account_info_screen()));
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.attach_money, title: finaldata.mainlanguage.YourWallet,),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => wallet_info()));
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.history_edu_outlined, title: finaldata.mainlanguage.HistoryOrder,),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => history_order_screen()));
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.chat_outlined, title: finaldata.mainlanguage.CustomerCare,),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        insetPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.all(10),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        content: Container(
                          width: width - 80,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(height: 15,),

                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: GestureDetector(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blueAccent.withOpacity(0.7)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.send,
                                              color: Colors.white,
                                            ),

                                            Container(width: 10,),

                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Telegram',
                                                style: TextStyle(
                                                    fontFamily: 'roboto',
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    launch("https://t.me/Customer_care");
                                  },
                                ),
                              ),

                              Container(height: 15,),

                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: GestureDetector(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.yellow.shade600
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            !loading ? Icon(
                                              Icons.chat_sharp,
                                              color: Colors.black,
                                            ) : CircularProgressIndicator(color: Colors.black,strokeWidth: 15,),

                                            Container(width: 10,),

                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                finaldata.mainlanguage.support1,
                                                style: TextStyle(
                                                    fontFamily: 'roboto',
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      loading = false;
                                    });
                                    await getChatRoom();
                                    setState(() {
                                      loading = false;
                                    });
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => chatRoomScreen(),),);
                                  },
                                ),
                              ),

                              Container(height: 15,),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.logout, title: finaldata.mainlanguage.viewnow == 'View now' ? 'Log out' : 'Đăng xuất',),
                onTap: () async {
                  final FirebaseAuth _auth = FirebaseAuth.instance;
                  finaldata.account.id = '';
                  finaldata.account.username = '';
                  await _auth.signOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => loading_screen()), (route) => false,);
                },
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: feature_button(iconData: Icons.delete_outline, title: finaldata.mainlanguage.viewnow == 'View now' ? 'Delete Account' : 'Xóa tài khoản',),
                onTap: () async {
                  final FirebaseAuth _auth = FirebaseAuth.instance;
                  finaldata.account.id = '';
                  finaldata.account.username = '';
                  await _auth.signOut();
                  toastMessage('Please allow 5-7 days for request processing.');
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => loading_screen()), (route) => false,);
                },
              ),

              SizedBox(height: 30,),
            ],
          ),
        ),
        onRefresh: _refresh,
      ),
    );
  }
}
