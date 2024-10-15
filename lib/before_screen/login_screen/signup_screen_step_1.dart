import 'package:dbmallhome/before_screen/login_screen/login_screen_step_1.dart';
import 'package:dbmallhome/before_screen/login_screen/signup_screen_step_2.dart';
import 'package:dbmallhome/data/Account/Account.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/otherdata/Tool.dart';
import 'package:dbmallhome/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../data/otherdata/Time.dart';
import 'ingredient/signup_step_1_ingredient/edit_text_in_signup_step_1.dart';
import 'ingredient/signup_step_1_ingredient/signup_step_1_appbar.dart';
import 'ingredient/signup_step_1_ingredient/start_text.dart';
import 'login_main_screen.dart';

class signup_screen_step_1 extends StatefulWidget {
  const signup_screen_step_1({super.key});

  @override
  State<signup_screen_step_1> createState() => _signup_screen_step_1State();
}

class _signup_screen_step_1State extends State<signup_screen_step_1> {
  final Account account = Account(id: '', username: '', password: '', address: '', createTime: Time(second: 0, minute: 0, hour: 0, day: 0, month: 0, year: 0), money: 0, firstName: '', lastName: '', phoneNum: '', lockstatus: 1, voucherList: []);

  final email_controller = TextEditingController();
  final first_name_controller = TextEditingController();
  final last_name_controller = TextEditingController();

  bool can_continue() {
    if(email_controller.text.isNotEmpty && first_name_controller.text.isNotEmpty && last_name_controller.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const signup_step_1_appbar(),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 10,
                bottom: 0,
                left: 20,
                right: 20,
                child: Container(
                  child: Column(
                    children: [
                      const start_text(),

                      const SizedBox(height: 10,),

                      SizedBox(
                        height: 50,
                        child: edit_text_in_signup_step_1(controller: email_controller, hint: 'Email', event: () {setState(() {});  },),
                      ),

                      const SizedBox(height: 10,),

                      SizedBox(
                        height: 50,
                        child: edit_text_in_signup_step_1(controller: first_name_controller, hint: 'First name', event: () {setState(() {});  },),
                      ),

                      const SizedBox(height: 10,),

                      SizedBox(
                        height: 50,
                        child: edit_text_in_signup_step_1(controller: last_name_controller, hint: 'Last name', event: () {setState(() {});  },),
                      ),

                      const SizedBox(height: 20,),

                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(can_continue() ? Colors.blue : Colors.grey),
                          ),
                          onPressed: () {
                            if (can_continue()) {
                              String id = (DateTime.now().hour >= 10 ? DateTime.now().hour.toString() : '0' + DateTime.now().hour.toString()) + (DateTime.now().minute >= 10 ? DateTime.now().minute.toString() : '0' + DateTime.now().minute.toString()) + (DateTime.now().second >= 10 ? DateTime.now().second.toString() : '0' + DateTime.now().second.toString()) + (DateTime.now().day >= 10 ? DateTime.now().day.toString() : '0' + DateTime.now().day.toString()) + (DateTime.now().month >= 10 ? DateTime.now().month.toString() : '0' + DateTime.now().month.toString()) + (DateTime.now().year >= 10 ? DateTime.now().year.toString() : '0' + DateTime.now().year.toString());
                              account.id = 'TK' + id;
                              account.createTime = getCurrentTime();
                              account.firstName = first_name_controller.text.toString();
                              account.lastName = last_name_controller.text.toString();
                              account.username = email_controller.text.toString();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => signup_screen_step_2(account: account)));
                            } else {
                              toastMessage('please fill infomation');
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              finaldata.mainlanguage.Continue,
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.white,
                                fontSize: width/25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),

                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: finaldata.mainlanguage.alreadymember,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width / 26,
                                      fontFamily: 'muli',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: finaldata.mainlanguage.signin,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: width / 26,
                                      fontFamily: 'muli',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_main_screen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_screen_step_1()));
        return true;
      },
    );  }
}
