import 'package:dbmallhome/data/finaldata.dart';
import 'package:flutter/material.dart';

import '../../../main_screen/main_screen.dart';
import '../../../product_view_screen/product_view_screen.dart';

class text_ads extends StatelessWidget {
  final String title;
  final String subtitle;
  final String productId;
  final Color backgroundColor;
  final Color textColor;
  const text_ads({super.key, required this.title, required this.subtitle, required this.backgroundColor, required this.textColor, required this.productId});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'muli',
                    fontSize: width/20,
                    color: textColor,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitle,
                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'muli',
                  fontSize: width/26,
                  color: textColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Container(
            height: 60,
            child: Row(
              children: [
                SizedBox(width: 10,),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => product_view_screen(id: productId, beforeWidget: main_screen())),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(textColor),
                    overlayColor: WidgetStatePropertyAll<Color>(Colors.blueGrey.withOpacity(0.3)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                    child: Text(
                      finaldata.mainlanguage.viewnow,
                      style: TextStyle(
                        fontFamily: 'muli',
                        fontSize: width/24,
                        color: backgroundColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
