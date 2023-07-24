// ignore_for_file: constant_identifier_names

import 'package:shopfusion/imports.dart';

mixin class PrefHelper {
  late SharedPreferences _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance(); 
  }

  static const USER_ID = "userId";
  static const USER_MOBILE = "userMobile";
  static const ROTP = "ROTP";
  
  // static const USER_EMAIL = "userEmail";
  static const USER_NAME = "userName";
  static const USERS_NAME = "usersName";
  static const USER_FIRST_NAME = "userFirstName";
  static const USER_LAST_NAME = "userLastName";
  static const IS_USER_VERIFIED = "isUserVerified";
  static const USER_ROLEID = "roleIds";
  static const USER_TEAMID = "teamIds";
  static const USER_EMAIL = "UserEmail";
  static const ACCESS_TOKEN = "AccessToken";
  static const PARTNER_FLAG = "partnerFlag";
  static const PARTENER_ID = "partnerId";
  static const ASSIGNABLE_FLAG = "isAssignableFlag";
  static const CASE_DESC = "caseDesc";
  static const CASE_REASON = "caseReason";
  static const CASE_STATUS = "caseStatus";
  static const CASE_PRIORITY = "casePriority";
  static const CREATE_TIME = "createTime";
  static const DEVICE_MODEL = "deviceModel";
  static const DEVICE_NAME = "deviceName";
  static const DEVICE_OS = "deviceOS";
  static const DEVICE_TOKEN = "deviceToken";
  static const INVENTORY_TOKEN = "inventoryToken";
  static const DEVICE_OS_VERSION = "osVersion";
  static const INVENTORY_TOKEN_VERIFIED = "incventeryTokenVerified";
  static const PREVIOUS_OPERATION = "PreviousOperation";
  Future<void> setInt(String key, int value) async {
    await _pref.setInt(key, value);
  }

  Future<void> setString(String key, String value) async {
    await _pref.setString(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _pref.setBool(key, value);
  }

  int getInt(String key, {required int defaultValue}) {
    var result = _pref.getInt(key);
    if (result == null) {
      return defaultValue;
    } else {
      return result;
    }
  }

  String getString(String key, {required String defaultValue}) {
    var result = _pref.getString(key);
    if (result == null) {
      return defaultValue;
    } else {
      return result;
    }
  }

  bool getBool(String key, {required bool defaultValue}) {
    var result = _pref.getBool(key);
    if (result == null) {
      return defaultValue;
    } else {
      return result;
    }
  }

  Future<bool> clear() async {
    return await _pref.clear();
  }
}
