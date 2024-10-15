import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/product/Product.dart';
import '../../category_view_screen/ingredient/item_product_in_category.dart';
import '../../product_view_screen/product_view_screen.dart';
import 'ingredient/item_product_search.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  final searchController = TextEditingController();
  List<Product> filterList = [];

  void onSearchTextChanged(String value) {
    setState(() {
      filterList = finaldata.productList
          .where((product) =>
      product.name.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(height: 40,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10,),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),

                      SizedBox(width: 10,),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                hintText: 'Search product on Dubai Mall',
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                border: InputBorder.none,
                              ),
                              onChanged: onSearchTextChanged,
                              cursorColor: Colors.blue, // Cursor color
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10,),

                      Container(
                        width: 40,
                        child: Icon(
                          Icons.mic_none,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: filterList.length != 0 ? ListView.builder(
                  itemCount: filterList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        child: item_product_search(product: filterList[index]),
                        onTap: () {
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => product_view_screen(id: filterList[index].id, beforeWidget: main_screen())));
                        },
                      ),
                    );
                  },
                ) : Text('There are no products here', style: TextStyle(fontSize: 14,color: Colors.black),),
              ),
            ),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
