import 'package:dbmallhome/data/Ads/productShowType2.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/otherdata/Tool.dart';
import 'package:dbmallhome/data/product/ProductDirectory.dart';
import 'package:dbmallhome/use_screen/main_screen/main_screen.dart';
import 'package:dbmallhome/use_screen/page/main_page/controller/mainPageController.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/ImageAds.dart';
import 'package:dbmallhome/data/Ads/TextAds.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/main_page_app_bar.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/main_page_directory/main_page_directory.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/main_page_product_type/main_page_product_type_1.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/main_page_product_type/main_page_product_type_2.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/search_box.dart';
import 'package:dbmallhome/use_screen/page/main_page/ingredient/text_ads.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../data/final_mainpage_data/final_mainpage_data.dart';
import '../../../data/product/ProductType.dart';

class main_page extends StatefulWidget {
  final VoidCallback event;
  const main_page({super.key, required this.event});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  bool loading = false;
  Future<void> _refresh() async {
    loading = true;
    setState(() {});
    finaldata.ads1 = await mainPageController.get_ads('textAds1');
    finaldata.ads2 = await mainPageController.get_ads('textAds2');
    finaldata.imgads = await mainPageController.get_ads('imageAds1');
    finaldata.directory1 = await mainPageController.get_directory('maindirectory1');
    finaldata.directory2 = await mainPageController.get_directory('maindirectory2');
    loading = false;
    setState(() {});
    finaldata.typeList1 = await mainPageController.get_type_1_list();
    setState(() {});
    finaldata.type2Info = await mainPageController.get_type_2_list();
    setState(() {});
    final_mainpage_data.number_open = -1;
    final_mainpage_data.number_open = final_mainpage_data.number_open + 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (final_mainpage_data.number_open > 3 || final_mainpage_data.number_open == -1) {
      _refresh();
    } else {
      final_mainpage_data.number_open = final_mainpage_data.number_open + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: main_page_app_bar(),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: RefreshIndicator(
          child: ListView(
            children: [
              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  child: search_box(),
                  onTap: () {
                    finaldata.currentPage = 2;
                    widget.event();
                  },
                ),
              ),

              SizedBox(height: 20,),

              !loading ? Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    text_ads(title: finaldata.ads1.title, subtitle: finaldata.ads1.subTitle, backgroundColor: Color.fromARGB(255, 76, 147, 251), textColor: Colors.black, productId: finaldata.ads1.productId,),

                    SizedBox(height: 20,),

                    text_ads(title: finaldata.ads2.title, subtitle: finaldata.ads2.subTitle, backgroundColor: Color.fromARGB(255, 1, 60, 102), textColor: Color.fromARGB(255, 211, 239, 253), productId: finaldata.ads2.productId,),

                    SizedBox(height: 20,),

                    image_ads(title: finaldata.imgads.title, subtitle: finaldata.imgads.subTitle, backgroundColor: Color.fromARGB(255, 219, 59, 7), textColor: Colors.white, url: finaldata.adsImageUrl, productId: finaldata.imgads.productId,),

                    SizedBox(height: 20,),

                    main_page_directory(directory: finaldata.directory1, beforeWidget: main_screen(),),

                    SizedBox(height: 20,),

                    main_page_product_type_1(typeList: finaldata.typeList1, beforeWidget: main_screen(),),

                    SizedBox(height: 20,),

                    main_page_directory(directory: finaldata.directory2, beforeWidget: main_screen(),),

                    SizedBox(height: 20,),

                    main_page_product_type_2(info: finaldata.type2Info,),

                    SizedBox(height: 20,),
                  ],
                ),
              ) : Container(height: height - 150, child: SpinKitWave(color: Colors.black, size: 30,),),

            ],
          ),
          onRefresh: () async {
            await _refresh();
          },
        ),
      ),
    );
  }
}
