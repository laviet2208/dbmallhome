import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:flutter/material.dart';

import '../../login_screen_step_1.dart';

class signup_step_1_appbar extends StatelessWidget {
  const signup_step_1_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(1000),
            ),
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_screen_step_1()));
          },
        ),

        const SizedBox(width: 20,),

        Expanded(
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Container(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  finaldata.mainlanguage.createanaccount,
                  style: TextStyle(
                    fontFamily: 'muli',
                    fontSize: 100,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10,),
      ],
    );
  }
}
