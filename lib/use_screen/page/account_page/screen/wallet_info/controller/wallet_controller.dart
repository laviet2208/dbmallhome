import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/data/historyData/Transaction.dart';
import 'package:firebase_database/firebase_database.dart';

class wallet_controller {
  static Future<List<TransactionHis>> get_his_list() async {
    List<TransactionHis> list = [];
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("Transaction").orderByChild('owner').equalTo(finaldata.account.id).once();
    final dynamic data = snapshot.snapshot.value;
    data.forEach((key, value) {
      TransactionHis data = TransactionHis.fromJson(value);
      list.add(data);
    });
    return list;
  }
}