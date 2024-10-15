import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/category_view_screen/category_view_screen.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/main_page_product_type/item_main_page_product_type_1.dart';
import 'package:flutter/material.dart';
import '../../../../../data/product/ProductType.dart';

class main_page_product_type_1 extends StatelessWidget {
  final List<ProductType> typeList;
  final Widget beforeWidget;
  const main_page_product_type_1({super.key, required this.typeList, required this.beforeWidget});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 25,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: AutoSizeText(
                finaldata.mainlanguage.featuredcategories,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 100,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'muli'
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Container(
            width: width,
            height: ((width - 60)/3) * 2 + 100,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // số phần tử trên mỗi hàng
                  mainAxisSpacing: 20, // khoảng cách giữa các hàng
                  crossAxisSpacing: 20, // khoảng cách giữa các cột
                  childAspectRatio: ((width - 60)/3)/((width - 60)/3 + 40),
                ),
                itemCount: typeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: item_main_page_product_type_1(type: typeList[index]),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => category_view_screen(productType: typeList[index], beforewidget: beforeWidget)));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
