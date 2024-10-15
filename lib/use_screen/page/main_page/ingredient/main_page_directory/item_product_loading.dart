import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class item_product_loading extends StatefulWidget {
  const item_product_loading({super.key});

  @override
  State<item_product_loading> createState() => _item_product_loadingState();
}

class _item_product_loadingState extends State<item_product_loading> {
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
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.white,
              enabled: true,
              child: Container(
                width: (width - 100)/2,
                height: (width - 100)/2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.04),
                ),
              ),
            ),
          ),


          SizedBox(height: 5,),

          Container(
            alignment: Alignment.centerLeft,
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.white,
              enabled: true,
              child: Container(
                width: (width - 100)/2 - 20,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.04),
                ),
              ),
            ),
          ),

          SizedBox(height: 5,),

          Container(
            alignment: Alignment.centerLeft,
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.white,
              enabled: true,
              child: Container(
                width: (width - 100)/4,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.04),
                ),
              ),
            ),
          ),

          SizedBox(height: 5,),

          Container(
            alignment: Alignment.centerLeft,
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.white,
              enabled: true,
              child: Container(
                width: (width - 100)/2 - 40,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.04),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
