import 'package:dbmallhome/data/product/Product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../data/otherdata/Tool.dart';

class item_simple_product extends StatefulWidget {
  final Product product;
  const item_simple_product({super.key, required this.product});

  @override
  State<item_simple_product> createState() => _item_simple_productState();
}

class _item_simple_productState extends State<item_simple_product> {
  String url = '';
  void _getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('product').child(widget.product.id).child(widget.product.id + '_0.png');
    url = await ref.getDownloadURL();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImageURL();
  }

  @override
  Widget build(BuildContext context) {
    double width = 392.72727272727275;
    return Container(
      width: (width - 100)/2,
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Đặt bán kính bo tròn
            child: Container(
              width: (width - 100) / 2,
              height: (width - 100) / 2,
              decoration: url != '' ? BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(url),
                ),
              ) : null,
            ),
          ),


          SizedBox(height: 5,),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'muli',
                fontSize: width/30,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: 5,),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              getStringNumber(widget.product.cost) + ' USD',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'muli',
                fontSize: width/25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 5,),

          widget.product.costBeforeSale != 0 ? Container(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: getStringNumber(widget.product.costBeforeSale) + ' USD',
                    style: TextStyle(
                      fontSize: width / 35,
                      fontFamily: 'muli',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough, // Thêm gạch chéo
                      decorationColor: Colors.grey, // Màu gạch chéo
                      decorationThickness: 2,
                    ),
                  ),

                  TextSpan(
                    text: ' . ' + calculateDiscountPercentage(widget.product.costBeforeSale, widget.product.cost).toString() + '% off',
                    style: TextStyle(
                      fontSize: width/35,
                      fontFamily: 'muli',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}

