import 'package:dbmallhome/use_screen/page/account_page/screen/view_all_productType/ingredient/product_type_appbar.dart';
import 'package:dbmallhome/use_screen/page/account_page/screen/view_all_productType/view_all_type_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../data/product/ProductType.dart';
import '../../../../category_view_screen/category_view_screen.dart';
import '../../../../main_screen/main_screen.dart';
import '../../../main_page/ingredient/main_page_product_type/item_main_page_product_type_1.dart';

class view_all_productType extends StatefulWidget {
  const view_all_productType({super.key});

  @override
  State<view_all_productType> createState() => _view_all_productTypeState();
}

class _view_all_productTypeState extends State<view_all_productType> {
  List<ProductType> typeList = [];

  Future<void> _refresh() async {
    typeList = await view_all_type_controller.get_type_list();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => main_screen()));
            },
          ),
          title: product_type_appbar(),
        ),
        body: RefreshIndicator(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: 10,),

                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: GridView.builder(
                      shrinkWrap: true,
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => category_view_screen(productType: typeList[index], beforewidget: widget)));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          onRefresh: _refresh,
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => main_screen()));
        return true;
      },
    );
  }
}
