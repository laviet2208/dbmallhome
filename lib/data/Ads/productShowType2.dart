import '../product/ProductType.dart';

class productShowType2 {
  String title;
  String subtitle;
  List<ProductType> list;

  productShowType2({required this.title, required this.subtitle, required this.list});

  factory productShowType2.fromJson(Map<dynamic, dynamic> json) {
    List<ProductType> prdList = [];

    if (json["list"] != null) {
      for (final result in json["list"]) {
        prdList.add(ProductType.fromJson(result));
      }
    }

    return productShowType2(
      title: json['title'].toString(),
      subtitle: json['subtitle'].toString(),
      list: prdList,
    );
  }
}