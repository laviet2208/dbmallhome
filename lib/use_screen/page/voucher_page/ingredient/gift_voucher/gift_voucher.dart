import 'package:dbmallhome/before_screen/login_screen/controller/loading_controller.dart';
import 'package:dbmallhome/before_screen/login_screen/ingredient/signup_step_1_ingredient/edit_text_in_signup_step_1.dart';
import 'package:dbmallhome/data/Account/Account.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/voucherData/Voucher.dart';
import 'package:dbmallhome/use_screen/cart_screen/check_out/check_out_controller.dart';
import 'package:dbmallhome/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class gift_voucher extends StatefulWidget {
  final Voucher voucher;
  final VoidCallback event;
  const gift_voucher({super.key, required this.voucher, required this.event,});

  @override
  State<gift_voucher> createState() => _gift_voucherState();
}

class _gift_voucherState extends State<gift_voucher> {
  bool loading1 = false;
  bool loading2 = false;
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      title: Text(finaldata.mainlanguage.giftthisvoucher, style: TextStyle(fontSize: 15, fontFamily: 'muli', color: Colors.black,),),
      content: Container(
        width: width - 20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: edit_text_in_signup_step_1(controller: emailController, hint: finaldata.mainlanguage.enterreceiveremail, event: () {}),
                  ),

                  Container(
                    width: 10,
                  ),

                  GestureDetector(
                    child: Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: !loading1 ? Icon(Icons.check, color: Colors.black,) : CircularProgressIndicator(color: Colors.black,),
                    ),
                    onTap: () async {
                      if (emailController.text.isNotEmpty) {
                        if (emailController.text.toString() == finaldata.account.username) {
                          toastMessage('Error: Receiver must not yourself');
                        } else {
                          setState(() {
                            loading1 = true;
                          });
                          if (await Loading_Controller.checkAccountData(emailController.text.toString())) {
                            Account acc = await Loading_Controller.getAccountData(emailController.text.toString());
                            acc.voucherList.add(widget.voucher);
                            finaldata.account.voucherList.removeAt(check_out_controller.get_voucher_index(widget.voucher));
                            DatabaseReference database = FirebaseDatabase.instance.ref("Account");
                            await database.child(acc.id).set(acc.toJson());
                            database = FirebaseDatabase.instance.ref("Account");
                            await database.child(finaldata.account.id).set(finaldata.account.toJson());
                            widget.event();
                            toastMessage('Update Complete');
                            setState(() {
                              loading1 = false;
                            });
                            Navigator.of(context).pop();
                            // print('Index: ' + check_out_controller.get_voucher_index(widget.voucher).toString());
                          } else {
                            setState(() {
                              loading1 = false;
                            });
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(finaldata.mainlanguage.Accountdoesnotexist),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      }
                    },
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
