import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/product/Product.dart';
import 'package:dbmallhome/use_screen/product_view_screen/product_view_controller/product_view_controller.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class action_button extends StatelessWidget {
  final Product product;
  final int number;
  const action_button({super.key, required this.product, required this.number});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () {
                  if (finaldata.account.id != '') {

                  } else {
                    toastMessage('Please login for use this feature');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    finaldata.mainlanguage.buyitnow,
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: Colors.white,
                      fontSize: width/25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextButton(
                style: ButtonStyle(
                  side: WidgetStateProperty.all(const BorderSide(color: Colors.blue, width: 1)),
                ),
                onPressed: () {
                  if (finaldata.account.id != '') {
                    product_view_controller.add_to_cart_handle(product, number);
                  } else {
                    toastMessage('Please login for use this feature');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    finaldata.mainlanguage.addtocart,
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: Colors.blue,
                      fontSize: width/25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
