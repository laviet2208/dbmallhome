import 'package:dbmallhome/data/Ads/productShowType2.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/main_screen/main_screen.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/main_page_product_type/item_main_page_product_type_2.dart';
import 'package:flutter/material.dart';

import '../../../../category_view_screen/category_view_screen.dart';

class main_page_product_type_2 extends StatelessWidget {
  final productShowType2 info;
  const main_page_product_type_2({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 242, 189),
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                info.title,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'muli',
                  fontSize: width/20,
                  color: Color.fromARGB(255, 90, 46, 19),
                  fontWeight: FontWeight.bold,
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
                info.subtitle,
                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'muli',
                  fontSize: width/26,
                  color: Color.fromARGB(255, 90, 46, 19),
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

                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 90, 46, 19)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                    child: Text(
                      finaldata.mainlanguage.turnin,
                      style: TextStyle(
                          fontFamily: 'muli',
                          fontSize: width/24,
                          color: Color.fromARGB(255, 252, 242, 189),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 120,
              child: ListView.builder(
                itemCount: info.list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      child: item_main_page_product_type_2(type: info.list[index]),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => category_view_screen(productType: info.list[index], beforewidget: main_screen())));
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
