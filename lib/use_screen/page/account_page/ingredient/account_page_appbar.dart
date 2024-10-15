import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:flutter/material.dart';

class account_page_appbar extends StatelessWidget {
  const account_page_appbar({super.key});

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
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
          ),
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
                  finaldata.mainlanguage.youraccount,
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
