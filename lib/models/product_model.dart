
class Product{
  int? id,price,stock,cartCount;
  String? title,description,brand,category,mainImage;
  double? rating,discountPercentage;
  bool? isInCart=false;
  List images=[];
  static Product? fromHashMap(dynamic map) {
    if (map == null) return null;
    Product res = Product();
    res.id = map['id'];
    res.title = map["title"];
    res.category = map["category"];
    res.description = map["description"];
    res.mainImage = map["thumbnail"];
    res.images = map["images"];
    res.price = map["price"];
    res.stock = map['stock'];
    res.brand = map['brand'];
    res.rating = double.parse(map["rating"].toString());
    res.discountPercentage = map['discountPercentage'];

    return res;
  }

  static List<Product> fromArrayOfHashMap(dynamic jsonArray) {
    
    List<Product> list = [];
    if (jsonArray != null) {
      for (var jsonObject in jsonArray) {
        list.add(fromHashMap(jsonObject)!); 
      }
    }
    return list;
  }
}