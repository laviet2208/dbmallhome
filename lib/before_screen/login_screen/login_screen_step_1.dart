import 'package:dbmallhome/before_screen/login_screen/ingredient/login_step_1_ingredient/hello_text.dart';
import 'package:dbmallhome/before_screen/login_screen/ingredient/login_step_1_ingredient/login_step_1_appbar.dart';
import 'package:dbmallhome/before_screen/login_screen/login_main_screen.dart';
import 'package:dbmallhome/before_screen/login_screen/signup_screen_step_1.dart';
import 'package:dbmallhome/before_screen/preview_screen/preview_screen.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:flutter/material.dart';

class login_screen_step_1 extends StatefulWidget {
  const login_screen_step_1({super.key});

  @override
  State<login_screen_step_1> createState() => _login_screen_step_1State();
}

class _login_screen_step_1State extends State<login_screen_step_1> {
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
          title: const login_step_1_appbar(),
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
                  child: const Column(
                    children: [
                      hello_text(),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_main_screen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              finaldata.mainlanguage.useemailorusername,
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

                      const SizedBox(height: 10,),

                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            side: WidgetStateProperty.all(const BorderSide(color: Colors.blue, width: 1)),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => signup_screen_step_1()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              finaldata.mainlanguage.createannewaccount,
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.blue,
                                fontSize: width/25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => preview_screen()));
        return true;
      },
    );
  }
}
