

import 'package:shopfusion/imports.dart';

class DataManager with ApiHelper,PrefHelper {
  static DataManager? _dataManager;
  static String inventoryToken = "";

  static DataManager get instance {
    _dataManager ??= DataManager._internal();
    return _dataManager!;
  }

  DataManager._internal();

  Future initSelf() async {
    await init();
    // await initDB();
  }

  Future<User> doLogin(String userName, String password) async {
    await clear();
    User? result = await loginApiCall(userName, password);

    setBool(PrefHelper.IS_USER_VERIFIED, true);
    setString(PrefHelper.USER_NAME, result!.username!);
    //setString(PrefHelper.ACCESS_TOKEN, result!.authToken ?? "");

    return result;
  }
  verifyUser(usrName){
    setBool(PrefHelper.IS_USER_VERIFIED, true);
    setString(PrefHelper.USER_NAME, usrName);
  }
  // Future getDeviceDetails() async {
  //   String? deviceModel = getString(PrefHelper.DEVICE_MODEL, defaultValue: '');
  //   String? deviceName = getString(PrefHelper.DEVICE_NAME, defaultValue: '');
  //   String? deviceOS = getString(PrefHelper.DEVICE_OS, defaultValue: '');
  //   String? deviceToken = getString(PrefHelper.DEVICE_TOKEN, defaultValue: '');
  //   String? osVersion =
  //       getString(PrefHelper.DEVICE_OS_VERSION, defaultValue: '');
  //   await deviceRegistrationApiCall(
  //       deviceModel, deviceName, deviceOS, deviceToken, osVersion);
  // }

  // Future<ResetPassword> resetPassword(String userName, String otp) async {
  //   await clear();
  //   ResetPassword? result = await validateForgotPasswordApiCall(userName, otp);
  //   setString(PrefHelper.USER_ID, result!.id!);
  //   setString(PrefHelper.ROTP, result.ROTP!);
  //   return result;
  // }

  // Future<User?> getUserDetails() async {
  //   // User? result = await getLoggedInUserDetails();
  //   setString(PrefHelper.USER_ID, result!.staffid!);
  //   setString(PrefHelper.USER_NAME, result.username!);
  //   setString(PrefHelper.USER_MOBILE, result.phone ?? "");
  //   setString(PrefHelper.USER_FIRST_NAME, result.firstname ?? "");
  //   setString(PrefHelper.USER_LAST_NAME, result.lastname ?? "");
  //   setString(PrefHelper.USER_EMAIL, result.email ?? "");
  //   // return result;
  // }

  bool isLoggedIn() {
    var result = false;
    // var userId = getString(PrefHelper.USER_ID, defaultValue: "");
    // if (userId != "") {
      var isUserVerified = getBool(PrefHelper.IS_USER_VERIFIED, defaultValue: false);
      if (isUserVerified) {
        result = true;
      } else {
        result = false;
      }
    //}
    return result;
  }

  // ResetPassword getUserDetail() {
  //   String? id = getString(PrefHelper.USER_ID, defaultValue: '');
  //   String rotp = getString(PrefHelper.ROTP, defaultValue: '');
  //   ResetPassword resetPassword = ResetPassword();
  //   resetPassword.id = id;
  //   resetPassword.ROTP = rotp;
  //   return resetPassword;
  // }

  User getUser() {
    String? userId = getString(PrefHelper.USER_ID, defaultValue: '');
    String? mobile = getString(PrefHelper.USER_MOBILE, defaultValue: '');
    String? username = getString(PrefHelper.USER_NAME, defaultValue: '');
    String? firstname = getString(PrefHelper.USER_FIRST_NAME, defaultValue: '');
    String? lastname = getString(PrefHelper.USER_LAST_NAME, defaultValue: '');
    String? email = getString(PrefHelper.USER_EMAIL, defaultValue: '');
    String? authToken = getString(PrefHelper.ACCESS_TOKEN, defaultValue: '');
    String? roleId = getString(PrefHelper.USER_ROLEID, defaultValue: '');

    User user = User();
    user.username = username;
    user.firstname = firstname;
    user.lastname = lastname;
    user.staffid = userId;
    user.phone = mobile;
    user.email = email;
    user.authToken = authToken;
    user.roleId = roleId;
    // print("Roles String:--${user.roleListString}");
    return user;
  }

  void logout() {
    setBool(PrefHelper.IS_USER_VERIFIED,false);
    // FirebaseMessaging.instance.deleteToken();
    clear();
  }
}
