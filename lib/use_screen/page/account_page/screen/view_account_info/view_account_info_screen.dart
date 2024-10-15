import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/otherdata/Tool.dart';
import 'package:dbmallhome/use_screen/main_screen/main_screen.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/view_account_info/ingredient/profile_appbar.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/view_account_info/ingredient/text_line_in_profile.dart';
import 'package:dbmallhome/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../../before_screen/login_screen/ingredient/signup_step_1_ingredient/edit_text_in_signup_step_1.dart';

class view_account_info_screen extends StatefulWidget {
  const view_account_info_screen({super.key});

  @override
  State<view_account_info_screen> createState() => _view_account_info_screenState();
}

class _view_account_info_screenState extends State<view_account_info_screen> {
  bool loading = false;
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  Future<void> _refresh() async {
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstnameController.text = finaldata.account.firstName;
    lastnameController.text = finaldata.account.lastName;
    phoneController.text = finaldata.account.phoneNum;
    addressController.text = finaldata.account.address;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          title: profile_appbar(),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: ListView(
              children: [
                SizedBox(height: 10,),

                text_line_in_profile(title: finaldata.mainlanguage.youraccountid, content: finaldata.account.id),

                SizedBox(height: 15,),

                text_line_in_profile(title: finaldata.mainlanguage.username, content: finaldata.account.username),

                SizedBox(height: 15,),

                text_line_in_profile(title: finaldata.mainlanguage.membersince, content: getAllTimeString(finaldata.account.createTime)),

                SizedBox(height: 20,),

                SizedBox(
                  height: 50,
                  child: edit_text_in_signup_step_1(controller: firstnameController, hint: 'Your first name', event: () {setState(() {});  },),
                ),

                SizedBox(height: 10,),

                SizedBox(
                  height: 50,
                  child: edit_text_in_signup_step_1(controller: lastnameController, hint: 'Your last name', event: () {setState(() {});  },),
                ),

                SizedBox(height: 10,),

                SizedBox(
                  height: 50,
                  child: edit_text_in_signup_step_1(controller: phoneController, hint: 'Your phone number', event: () {setState(() {});  },),
                ),

                SizedBox(height: 10,),

                SizedBox(
                  height: 50,
                  child: edit_text_in_signup_step_1(controller: addressController, hint: 'Your address', event: () {setState(() {});  },),
                ),

                SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                    ),
                    onPressed: () async {
                      setState(() {loading = true;});
                      finaldata.account.firstName = firstnameController.text.isNotEmpty ? firstnameController.text.toString() : '';
                      finaldata.account.lastName = lastnameController.text.isNotEmpty ? lastnameController.text.toString() : '';
                      finaldata.account.phoneNum = phoneController.text.isNotEmpty ? phoneController.text.toString() : '';
                      finaldata.account.address = addressController.text.isNotEmpty ? addressController.text.toString() : '';
                      DatabaseReference database = FirebaseDatabase.instance.ref("Account");
                      await database.child(finaldata.account.id).set(finaldata.account.toJson());
                      setState(() {loading = false;});
                      toastMessage('Update success');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: !loading ? Text(
                        finaldata.mainlanguage.saveinfomation,
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

                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => main_screen()));
        return true;
      },
    );
  }
}
