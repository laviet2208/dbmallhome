import 'package:dbmallhome/before_screen/preview_screen/preview_screen.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/otherdata/Tool.dart';
import 'package:dbmallhome/data/product/Product.dart';
import 'package:dbmallhome/use_screen/product_view_screen/ingredient/action_button.dart';
import 'package:dbmallhome/use_screen/product_view_screen/ingredient/image_view.dart';
import 'package:dbmallhome/use_screen/product_view_screen/ingredient/main_description.dart';
import 'package:dbmallhome/use_screen/product_view_screen/ingredient/name_and_cost.dart';
import 'package:dbmallhome/use_screen/product_view_screen/ingredient/product_view_app_bar.dart';
import 'package:dbmallhome/use_screen/product_view_screen/product_view_controller/product_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class product_view_screen extends StatefulWidget {
  final String id;
  final Widget beforeWidget;
  const product_view_screen({super.key, required this.id, required this.beforeWidget});

  @override
  State<product_view_screen> createState() => _product_view_screenState();
}

class _product_view_screenState extends State<product_view_screen> {
  int numberProduct = 1;
  bool loading = false;
  Product product = Product(id: '', name: '', productType: '', showStatus: 0, createTime: getCurrentTime(), description: '', directoryList: [], cost: 0, costBeforeSale: 0, inventory: 0, saleLimit: getCurrentTime(), subdescription: '');
  List<String> imageUrls = [];

  Future<void> _Refresh() async {
    setState(() {
      loading = true;
    });
    product = await product_view_controller.get_product(widget.id);
    setState(() {
      loading = false;
    });
    imageUrls = await product_view_controller.get_all_image(widget.id);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Refresh();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: product_view_app_bar(beforeWidget: widget.beforeWidget, name: product.name == '' ? 'Loading...' : product.name, currentWidget: widget,),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: RefreshIndicator(
            child: ListView(
              children: [
                !loading ? Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),

                      image_view(imageUrls: imageUrls),

                      SizedBox(height: 10,),

                      name_and_cost(product: product),

                      SizedBox(height: 10,),

                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Number: ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              icon: Icon(Icons.remove, size: 14,),
                              onPressed: () => setState(() {
                                final newValue = numberProduct - 1;
                                numberProduct = newValue.clamp(1, 100);
                              }),
                            ),

                            Text(numberProduct.toString()),

                            IconButton(
                              icon: Icon(Icons.add, size: 14,),
                              onPressed: () => setState(() {
                                final newValue = numberProduct + 1;
                                numberProduct = newValue.clamp(1, 100);
                              }),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),

                      action_button(product: product, number: numberProduct,),

                      SizedBox(height: 10,),

                      main_description(description: product.description),

                      SizedBox(height: 10,),
                    ],
                  ),
                ) : Container(height: height - 150, child: SpinKitWave(color: Colors.black, size: 30,),),
              ],
            ),
            onRefresh: _Refresh,
          ),
        ),
      ),
      onWillPop: () async {
        if (finaldata.account.id != '') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget.beforeWidget),);
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => preview_screen()),);
        }
        return true;
      },
    );
  }
}
