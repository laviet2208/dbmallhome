import 'package:dbmallhome/data/product/ProductType.dart';
import 'package:firebase_database/firebase_database.dart';

class view_all_type_controller {
  static Future<List<ProductType>> get_type_list() async {
    List<ProductType> list = [];
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("productType").once();
    final dynamic data = snapshot.snapshot.value;
    data.forEach((key, value) {
      ProductType data = ProductType.fromJson(value);
      list.add(data);
    });
    return list;
  }
}