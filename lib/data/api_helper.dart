// ignore_for_file: constant_identifier_names, non_constant_identifier_names, prefer_final_fields
 
import 'rest_helper/rest_const.dart'; 
import '../imports.dart';

mixin class ApiHelper {
  static const String BASE_URL = " ";
  static const String BASE_LOGIN_URL = "";

  static const String API_LOGIN = "login"; 

  // static const String API_PAPER
  
  var _log = FimberLog("ApiHelper");

  Future<User?> loginApiCall(String userId, String password) async {
    Map<String, String> params = {
      "username": userId,
      "password": password,
    };
    var req = RestRequest(reqUrl: API_LOGIN)
      ..reqMethod = RequestMethod.METHOD_POST
      ..contentType = ContentType.CONTENT_JSON
      ..baseUrl = BASE_LOGIN_URL
      ..params = params;
    Response res = await req.dioSend();
    debugPrint("$API_LOGIN => ${res.toString()}"); 
    return User.fromHashMap(jsonDecode(res.data));
  }

  Future<List<Product>> getProductList() async {
    var req = RestRequest(reqUrl:"products")
      ..reqMethod = RequestMethod.METHOD_GET..baseUrl = "https://dummyjson.com/";
    Response res = await req.dioSend();
    debugPrint("Response from api helper : ${res.data.toString()}");
    return Product.fromArrayOfHashMap(res.data['products']);
  }

}
