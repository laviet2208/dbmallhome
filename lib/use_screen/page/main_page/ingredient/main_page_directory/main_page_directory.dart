import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/use_screen/directory_view_screen/directory_view_screen.dart';
import 'package:dbmallhome/use_screen/main_screen/main_screen.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/main_page_directory/item_simple_product.dart';
import 'package:dbmallhome/use_screen/product_view_screen/product_view_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../data/product/Product.dart';
import '../../../../../data/product/ProductDirectory.dart';
import '../../controller/mainPageController.dart';
import 'item_product_in_directory_main_page.dart';
import 'item_product_loading.dart';

class main_page_directory extends StatefulWidget {
  final ProductDirectory directory;
  final Widget beforeWidget;
  const main_page_directory({super.key, required this.directory, required this.beforeWidget});

  @override
  State<main_page_directory> createState() => _main_page_directoryState();
}

class _main_page_directoryState extends State<main_page_directory> {
  List<Product> productList = [];
  bool loading = false;

  Future<void> _refresh() async {
    setState(() {
      loading = true;
    });
    productList = await mainPageController.get_product_list_by_direct_id(widget.directory.id, () {setState(() {loading = false;});});
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
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 25,
            child: Row(
              children: [
                Container(width: 10,),

                Container(
                  width: width - 80,
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    widget.directory.name,
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

                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          finaldata.mainlanguage.seeall,
                          style: TextStyle(
                            fontFamily: 'muli',
                            color: Colors.black,
                            fontSize: width/30,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => directory_view_screen(productDirectory: widget.directory, beforewidget: widget.beforeWidget)));
                      },
                    ),
                  ),
                ),

                SizedBox(width: 10,),
              ],
            ),
          ),

          SizedBox(height: 10,),

          Container(
            height: 240,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: !loading ? (productList.length != 0 ? ListView.builder(
                itemCount: productList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: item_simple_product(product: productList[index]),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => product_view_screen(id: productList[index].id, beforeWidget: main_screen())),
                      );
                    },
                  );
                },
              ) :
              Text('There is not any products in here!', style: TextStyle(fontSize: 12, color: Colors.grey),)) :
              ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 5, top: 4, bottom: 4),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: item_product_loading(),
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
