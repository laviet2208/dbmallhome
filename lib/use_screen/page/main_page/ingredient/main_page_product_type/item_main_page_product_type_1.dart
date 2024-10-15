import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../data/product/ProductType.dart';

class item_main_page_product_type_1 extends StatefulWidget {
  final ProductType type;
  const item_main_page_product_type_1({super.key, required this.type});

  @override
  State<item_main_page_product_type_1> createState() => _item_main_page_product_type_1State();
}

class _item_main_page_product_type_1State extends State<item_main_page_product_type_1> {

  String url = '';

  void _getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('productType').child(widget.type.id + '.png');
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
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (width - 60)/3,
      height: (width - 60)/3 + 40,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 40,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: Color.fromARGB(255, 219, 219, 219),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      image: url != '' ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(url),
                      ) : null,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              alignment: Alignment.center,
              child: Text(
                widget.type.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'muli',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: width/30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
