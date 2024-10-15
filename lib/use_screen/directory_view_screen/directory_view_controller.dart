import 'package:dbmallhome/data/product/ProductDirectory.dart';
import 'package:firebase_database/firebase_database.dart';

class directory_view_controller {
  static Future<ProductDirectory> get_directory(String id) async {
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child('productDirectory').child(id).once();
    final dynamic data = snapshot.snapshot.value;
    return ProductDirectory.fromJson(data);
  }
}