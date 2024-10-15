import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class feature_button extends StatelessWidget {
  final IconData iconData;
  final String title;
  const feature_button({super.key, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 25,
              color: Colors.grey,
            ),

            SizedBox(width: 20,),

            Expanded(
              child: Container(
                height: 25,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  title,
                  style: TextStyle(
                    fontFamily: 'muli',
                    fontWeight: FontWeight.normal,
                    fontSize: 100,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
