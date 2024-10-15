import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../before_screen/login_screen/login_screen_step_1.dart';
import '../../../before_screen/preview_screen/preview_screen.dart';
import '../../../data/finaldata.dart';
import '../../../utils/utils.dart';
import '../../cart_screen/cart_screen.dart';

class product_view_app_bar extends StatelessWidget {
  final Widget beforeWidget;
  final Widget currentWidget;
  final String name;
  const product_view_app_bar({super.key, required this.beforeWidget, required this.name, required this.currentWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            width: 40,
            height: 40,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          onTap: () {
            if (finaldata.account.id != '') {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => beforeWidget),);
            } else {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => preview_screen()),);
            }
          },
        ),

        SizedBox(width: 10,),

        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'muli',
                color: Colors.black,
                fontSize: 100,
              ),
            ),
          ),
        ),

        SizedBox(width: 20,),

        GestureDetector(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          onTap: () {
            if (finaldata.account.id != "") {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cart_screen(beforeWidget: currentWidget)),);
            } else {
              toastMessage('Please login for use this feature');
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_screen_step_1()));
            }
          },
        ),

        SizedBox(width: 10,),

        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Center(
            child: Icon(
              Icons.notifications_active_outlined,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
