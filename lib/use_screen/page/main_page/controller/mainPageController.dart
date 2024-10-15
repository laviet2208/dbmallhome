import 'package:dbmallhome/data/Ads/productShowType2.dart';
import 'package:dbmallhome/data/product/ProductDirectory.dart';
import 'package:dbmallhome/data/product/ProductType.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../data/Ads/TextAds.dart';
import '../../../../data/product/Product.dart';

class mainPageController {
  static Future<TextAds> get_ads(String id) async {
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("Ads/TextAds").child(id).once();
    final dynamic data = snapshot.snapshot.value;
    return TextAds.fromJson(data);
  }

  static Future<ProductDirectory> get_directory(String id) async {
    DatabaseReference reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("UI").child(id).once();
    dynamic data = snapshot.snapshot.value.toString();
    reference = FirebaseDatabase.instance.ref();
    snapshot = await reference.child("productDirectory").child(data).once();
    data = snapshot.snapshot.value;
    return ProductDirectory.fromJson(data);
  }

  static Future<List<ProductType>> get_type_1_list() async {
    DatabaseReference reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("UI").child('productType').once();
    dynamic data = snapshot.snapshot.value;
    List<ProductType> typeList = [];
    for (final result in data) {
      ProductType directory = ProductType.fromJson(result);
      typeList.add(directory);
    }
    return typeList;
  }

  static Future<productShowType2> get_type_2_list() async {
    DatabaseReference reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("UI").child('productType1').once();
    dynamic data = snapshot.snapshot.value;
    return productShowType2.fromJson(data);
  }

  static Future<List<Product>> get_product_list_by_direct_id(String id, VoidCallback event) async {
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("productList").orderByChild('directoryList/0').equalTo(id).once();
    print('Gọi hàm lấy type thành công');
    final dynamic data = snapshot.snapshot.value;
    List<Product> dataList = [];
    if (data != null) {
      data.forEach((key, value) {
        Product product = Product.fromJson(value);
        if (product.showStatus != 0) {
          dataList.add(product);
          event();
        }
      });
    }
    return dataList;
  }

  static Future<List<Product>> get_product_list_by_type_id(String id, VoidCallback event) async {
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("productList").orderByChild('productType').equalTo(id).once();
    print('Gọi hàm lấy type thành công');
    final dynamic data = snapshot.snapshot.value;
    List<Product> dataList = [];
    if (data != null) {
      data.forEach((key, value) {
        Product product = Product.fromJson(value);
        if (product.showStatus != 0) {
          dataList.add(product);
          event();
        }
      });
    }
    return dataList;
  }
}