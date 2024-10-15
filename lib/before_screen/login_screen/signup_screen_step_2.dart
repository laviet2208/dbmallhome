import 'package:dbmallhome/before_screen/login_screen/controller/signup_controller.dart';
import 'package:dbmallhome/before_screen/login_screen/ingredient/signup_step_1_ingredient/signup_step_1_appbar.dart';
import 'package:dbmallhome/before_screen/login_screen/ingredient/signup_step_2_ingredient/create_text.dart';
import 'package:dbmallhome/before_screen/login_screen/login_main_screen.dart';
import 'package:dbmallhome/before_screen/login_screen/signup_screen_step_1.dart';
import 'package:dbmallhome/data/Account/Account.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/utils/utils.dart';
import 'package:flutter/material.dart';

import 'ingredient/signup_step_1_ingredient/edit_text_in_signup_step_1.dart';

class signup_screen_step_2 extends StatefulWidget {
  final Account account;
  const signup_screen_step_2({super.key, required this.account});

  @override
  State<signup_screen_step_2> createState() => _signup_screen_step_2State();
}

class _signup_screen_step_2State extends State<signup_screen_step_2> {
  final pass_controller = TextEditingController();
  bool loading = false;
  bool can_continue() {
    if (pass_controller.text.isNotEmpty) {
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
                      const create_text(),

                      const SizedBox(height: 10,),

                      SizedBox(
                        height: 50,
                        child: edit_text_in_signup_step_1(controller: pass_controller, hint: 'Password', event: () {setState(() {});  },),
                      ),

                      const SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 30),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            finaldata.mainlanguage.passcondition,
                            style: TextStyle(
                              fontFamily: 'muli',
                              color: Colors.black,
                              fontSize: width/30
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 30),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            finaldata.mainlanguage.policysub,
                            style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.black,
                                fontSize: width/30
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15,),

                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, right: 30),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              finaldata.mainlanguage.useragree,
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.black,
                                fontSize: width/30,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25,),

                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, right: 30),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              finaldata.mainlanguage.privacynotice,
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.black,
                                fontSize: width/30,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25,),

                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(can_continue() ? Colors.blue : Colors.grey),
                          ),
                          onPressed: () async {
                            if (can_continue()) {
                              widget.account.password = pass_controller.text.toString();
                              await signup_controller.signUpPressed(widget.account,
                                    () {setState(() {loading = true;});},
                                    () {setState(() {loading = false;});},
                                    () {setState(() {loading = false;}); toastMessage('PLease check your email to verify'); Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_main_screen()));},
                              );
                            } else {
                              toastMessage('please fill your password');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: !loading ? Text(
                              finaldata.mainlanguage.createanaccount,
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.white,
                                fontSize: width/25,
                                fontWeight: FontWeight.bold,
                              ),
                            ) : CircularProgressIndicator(color: Colors.white,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => signup_screen_step_1()));
        return true;
      },
    );
  }
}
