import 'package:dbmallhome/data/product/ProductDirectory.dart';
import 'package:dbmallhome/use_screen/category_view_screen/ingredient/item_product_in_category_simple.dart';
import 'package:flutter/material.dart';
import '../../data/product/Product.dart';
import '../category_view_screen/ingredient/category_view_appbar.dart';
import '../page/main_page/controller/mainPageController.dart';
import '../product_view_screen/product_view_screen.dart';

class directory_view_screen extends StatefulWidget {
  final ProductDirectory productDirectory;
  final Widget beforewidget;
  const directory_view_screen({super.key, required this.productDirectory, required this.beforewidget});

  @override
  State<directory_view_screen> createState() => _directory_view_screenState();
}

class _directory_view_screenState extends State<directory_view_screen> {
  List<Product> productList = [];
  bool loading = false;
  Future<void> _refresh() async {
    setState(() {
      loading = true;
    });
    productList = await mainPageController.get_product_list_by_direct_id(widget.productDirectory.id, () {setState(() {loading = false;});});
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
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => widget.beforewidget));
            },
          ),
          title: category_view_appbar(name: widget.productDirectory.name,),
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

                  Container(
                    alignment: Alignment.center,
                    height: productList.length == 0 ? 200 : null,
                    child: productList.length != 0 ? ListView.builder(
                      itemCount: productList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            child: item_product_in_category_simple(product: productList.reversed.toList()[index]),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => product_view_screen(id: productList.reversed.toList()[index].id, beforeWidget: widget)),
                              );
                            },
                          ),
                        );
                      },
                    ) : Text('There are no products here', style: TextStyle(fontSize: 14,color: Colors.black),),
                  ),
                ],
              ),
            ),
          ),
          onRefresh: _refresh,
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => widget.beforewidget));
        return true;
      },
    );
  }
}
