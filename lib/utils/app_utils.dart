   
import 'package:shopfusion/imports.dart';

class AppUtils {
  AppUtils._();
 

  static showToast(String message, BuildContext context,{Color? color}) {
    Fluttertoast.showToast(msg: message,backgroundColor: color ?? Colors.green,textColor: Colors.white);
  }
  
  static Future<bool> isInternetAvailable() async {
    var connectivity = await Connectivity().checkConnectivity();
    return connectivity != ConnectivityResult.none;
  }
 
  static showSnackbar(String message, Color color,BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: color.withOpacity(0.8),
        content: Text(
          message,
          textScaleFactor: 1.2,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static Future<void> logout() async {
      DataManager.instance.logout();
    //Navigator.popAndPushNamed(context, Constants.ROUTE_LOGIN);
  }
}
