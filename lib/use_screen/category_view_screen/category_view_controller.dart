import 'package:dbmallhome/data/product/ProductType.dart';
import 'package:firebase_database/firebase_database.dart';

class category_view_controller {
  static Future<ProductType> get_product_type(String id) async {
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child('productType').child(id).once();
    final dynamic data = snapshot.snapshot.value;
    return ProductType.fromJson(data);
  }
}