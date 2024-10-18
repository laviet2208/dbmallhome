import 'package:dbmallhome/before_screen/login_screen/controller/signin_controller.dart';
import 'package:dbmallhome/before_screen/login_screen/ingredient/login_step_1_ingredient/forgot_password_dialog.dart';
import 'package:dbmallhome/before_screen/login_screen/ingredient/signup_step_1_ingredient/edit_text_in_signup_step_1.dart';
import 'package:dbmallhome/before_screen/login_screen/login_screen_step_1.dart';
import 'package:dbmallhome/before_screen/login_screen/signup_screen_step_1.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/main_screen/main_screen.dart';
import 'package:dbmallhome/utils/utils.dart';
import 'package:flutter/material.dart';

import 'ingredient/login_screen_ingredient/login_main_app_bar.dart';
import 'ingredient/login_screen_ingredient/welcome_text.dart';

class login_main_screen extends StatefulWidget {
  const login_main_screen({super.key});

  @override
  State<login_main_screen> createState() => _login_main_screenState();
}

class _login_main_screenState extends State<login_main_screen> {
  bool loading = false;
  final email_controller =  TextEditingController();
  final pass_controller = TextEditingController();

  bool can_continue() {
    if (email_controller.text.isNotEmpty && pass_controller.text.isNotEmpty) {
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
          title: const login_main_app_bar(),
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
                      const welcome_text(),

                      const SizedBox(height: 10,),

                      SizedBox(
                        height: 50,
                        child: edit_text_in_signup_step_1(controller: email_controller, hint: 'Email', event: () {setState(() {});  },),
                      ),

                      const SizedBox(height: 10,),

                      SizedBox(
                        height: 50,
                        child: edit_text_in_signup_step_1(controller: pass_controller, hint: finaldata.mainlanguage.password, event: () {setState(() {});  },),
                      ),

                      const SizedBox(height: 20,),

                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(can_continue() ? Colors.blue : Colors.grey),
                          ),
                          onPressed: () async {
                            if (can_continue()) {
                              setState(() {loading = true;});
                              await signin_controller.loginHandleWeb(email_controller.text.toString(), pass_controller.text.toString(),
                                () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_screen()),);},
                                () {setState(() {loading = false;});},);
                            } else {
                              toastMessage('Please fill all information and try again');
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: !loading ? Text(
                              finaldata.mainlanguage.signin,
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

                      const SizedBox(height: 20,),

                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: finaldata.mainlanguage.createanaccount,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: width / 26,
                                    fontFamily: 'muli',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => signup_screen_step_1()));
                        },
                      ),

                      const SizedBox(height: 20,),

                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: finaldata.mainlanguage.resetyourpass,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: width / 26,
                                    fontFamily: 'muli',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return forgot_password_dialog();
                            },
                          );
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
    );
  }
}
