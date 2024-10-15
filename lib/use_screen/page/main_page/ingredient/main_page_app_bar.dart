import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/cart_screen/cart_screen.dart';
import 'package:dbmallhome/use_screen/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../../before_screen/login_screen/login_screen_step_1.dart';
import '../../../../utils/utils.dart';

class main_page_app_bar extends StatelessWidget {
  const main_page_app_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20 * (649/113),
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/dbtext.png'),
              )
          ),
        ),

        Expanded(child: Container()),

        GestureDetector(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          ),
          onTap: () {
            if (finaldata.account.id != "") {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cart_screen(beforeWidget: main_screen())),);
            } else {
              toastMessage('Please login for use this feature');
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_screen_step_1()));
            }
          },
        )
      ],
    );
  }
}
