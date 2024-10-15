import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:flutter/material.dart';

class product_type_appbar extends StatelessWidget {
  const product_type_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Container(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  finaldata.mainlanguage.Allcategories,
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
      ],
    );
  }
}
