import 'package:dbmallhome/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../data/final_mainpage_data/final_mainpage_data.dart';
import '../../data/finaldata.dart';
import '../../use_screen/page/main_page/controller/mainPageController.dart';
import '../../use_screen/page/main_page/ingredient/ImageAds.dart';
import '../../use_screen/page/main_page/ingredient/main_page_app_bar.dart';
import '../../use_screen/page/main_page/ingredient/main_page_directory/main_page_directory.dart';
import '../../use_screen/page/main_page/ingredient/main_page_product_type/main_page_product_type_1.dart';
import '../../use_screen/page/main_page/ingredient/main_page_product_type/main_page_product_type_2.dart';
import '../../use_screen/page/main_page/ingredient/search_box.dart';
import '../../use_screen/page/main_page/ingredient/text_ads.dart';
import '../login_screen/login_screen_step_1.dart';

class preview_screen extends StatefulWidget {
  const preview_screen({super.key});

  @override
  State<preview_screen> createState() => _preview_screenState();
}

class _preview_screenState extends State<preview_screen> {
  bool loading = false;
  Future<void> _refresh() async {
    setState(() {loading = true;});
    finaldata.ads1 = await mainPageController.get_ads('textAds1');
    finaldata.ads2 = await mainPageController.get_ads('textAds2');
    finaldata.imgads = await mainPageController.get_ads('imageAds1');
    finaldata.directory1 = await mainPageController.get_directory('maindirectory1');
    finaldata.directory2 = await mainPageController.get_directory('maindirectory2');
    setState(() {loading = false;});
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
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: RefreshIndicator(
                child: ListView(
                  children: [
                    SizedBox(height: 10,),

                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        child: search_box(),
                        onTap: () {
                          toastMessage('Please login for use this feature');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_screen_step_1()));
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

                          main_page_directory(directory: finaldata.directory1, beforeWidget: preview_screen(),),

                          SizedBox(height: 20,),

                          main_page_product_type_1(typeList: finaldata.typeList1, beforeWidget: preview_screen(),),

                          SizedBox(height: 20,),

                          main_page_directory(directory: finaldata.directory2, beforeWidget: preview_screen(),),

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

            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: GestureDetector(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // màu của shadow
                        spreadRadius: 5, // bán kính của shadow
                        blurRadius: 7, // độ mờ của shadow
                        offset: Offset(0, 3), // vị trí của shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      finaldata.mainlanguage.letgetstart,
                      style: TextStyle(
                        fontFamily: 'muli',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login_screen_step_1()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
