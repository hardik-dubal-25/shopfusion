
// ignore_for_file: constant_identifier_names

import 'package:shopfusion/imports.dart';

abstract class Constants {
  Constants._();

  static const somthingWentWrong = "Something went wrong";
  static const jwtExpired = "Your Session has been Expired Please Login Again.";

  static const failCode = 0;
  static const failInternetCode = -1;
  static const failSomethingWentWrongCode = -2;

  static const cardShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)));
  static const cardElevation5 = 5.0, cardElevation8 = 8.0, cardElevation10 = 10.0;
//  globle constants

//  assets path
//   static const ASSETS_APP_BG = "assets/images/app_bg.png";
  static const assetsAppLogo = "assets/images/launch_icon.png";

  static const assetsConnectionLost = "assets/images/ic_connection_lost.png";

  static const double textSizeSmall = 10;

//colors

  static const Color colorGrey = Colors.grey,
      appBarColor = Colors.blue,
      colorTextWhite = Colors.white,
      colorTextHint = Colors.grey,
      colorTextBlack = Colors.black,
      colorIconBlack = Colors.black,
      colorDivider = Colors.grey,
      colorDullWhite = Color(0xffb3b3b3);

//  routes
  static const String routeSplash = "Splash";
  static const String routeDashboard = "Dashboard";
  static const String routeLogin = "Login", routeContactUs = "ContactUs", routeForgotPassword = "ForgotPassword", routeProduct = "Product";

  static const String routeUserProfile = "UserProfile", routeCategories = "Categories", routeProductDetail = "ProductDetail";

// routes builder
  static Map<String, WidgetBuilder> getRoutes(BuildContext buildContext) {
    return {
      Constants.routeSplash: (BuildContext context) => const SplashScreen(),
      Constants.routeDashboard: (BuildContext context) => const DashboardScreen(),
      Constants.routeLogin: (BuildContext context) => const LoginScreen(),
      Constants.routeForgotPassword: (BuildContext context) => const ForgotPasswordScreen(),
      Constants.routeUserProfile: (context) => Container(),
      Constants.routeCategories: (context) => Container(),
      Constants.routeProduct: (context) => Container(),
      // Constants.ROUTE_CONTACT_US: (BuildContext context) {
      //   return const ContactUs();
      // },
      // Constants.ROUTE_SSID_SCREEN:(context) {
      //   return const SsidScreen();
      // }
    };
  }

  // static const String ROUTE_DASHBOARD_HOME = "Home";

/*
  static const String ROUTE_DASHBOARD_RESULT = "Results";

*/

//DIMENTIONS
  static const APP_PADDING_MACRO = 4.0;
  static const APP_PADDING_MIN = 8.0;
  static const APP_PADDING = 12.0, APP_PADDING_10 = EdgeInsets.all(10), APP_PADDING_20 = EdgeInsets.all(20);
  static const APP_PADDING_MAX = 16.0;
  static const APP_BTN_PADDING = 30.0;
  static const APP_BOTTOM_STRIP_PADDING = 60.0;

  static const APP_PADDING_LTRB_MIN = EdgeInsets.all(8),
      APP_PADDING_LTRB = EdgeInsets.all(12),
      APP_PADDING_LTRB_MAX = EdgeInsets.all(16),
      appPaddingLMIN = EdgeInsets.only(left: 8),
      appPaddingLMAX = EdgeInsets.only(left: 16),
      appPaddingLMACRO = EdgeInsets.only(left: 4),
      appPaddingL = EdgeInsets.only(left: 12),
      appPaddingL10 = EdgeInsets.only(left: 10),
      appPaddingL20 = EdgeInsets.only(left: 20),
      APP_PADDING_RIGHT_MACRO = EdgeInsets.only(right: 4),
      APP_PADDING_RIGHT_MIN = EdgeInsets.only(right: 8),
      APP_PADDING_RIGHT_MAX = EdgeInsets.only(right: 16),
      APP_PADDING_RIGHT = EdgeInsets.only(right: 12),
      APP_PADDING_RIGHT_10 = EdgeInsets.only(right: 10),
      APP_PADDING_RIGHT_20 = EdgeInsets.only(right: 20),
      APP_PADDING_TOP_MACRO = EdgeInsets.only(top: 4),
      APP_PADDING_TOP_MIN = EdgeInsets.only(top: 8),
      APP_PADDING_TOP = EdgeInsets.only(top: 12),
      APP_PADDING_TOP_20 = EdgeInsets.only(top: 20),
      APP_PADDING_TOP_10 = EdgeInsets.only(top: 10),
      APP_PADDING_TOP_MAX = EdgeInsets.only(top: 16),
      APP_PADDING_BOTTOM_MACRO = EdgeInsets.only(bottom: 4),
      APP_PADDING_BOTTOM_MIN = EdgeInsets.only(bottom: 8),
      APP_PADDING_BOTTOM_10 = EdgeInsets.only(bottom: 10),
      APP_PADDING_BOTTOM = EdgeInsets.only(bottom: 12),
      APP_PADDING_BOTTOM_20 = EdgeInsets.only(bottom: 20),
      APP_PADDING_BOTTOM_MAX = EdgeInsets.only(bottom: 16),
      appPaddingLRMIN = EdgeInsets.only(left: 8, right: 8),
      appPaddingLRMAX = EdgeInsets.only(left: 16, right: 16),
      appPaddingLR = EdgeInsets.only(left: 12, right: 12),
      appPaddingLR10 = EdgeInsets.only(left: 10, right: 10),
      appPaddingLR20 = EdgeInsets.only(left: 20, right: 20),
      APP_PADDING_LT_MIN = EdgeInsets.only(left: 8, top: 8),
      APP_PADDING_LT = EdgeInsets.only(left: 12, top: 12),
      APP_PADDING_LT_MAX = EdgeInsets.only(left: 16, top: 16),
      APP_PADDING_LT_10 = EdgeInsets.only(left: 10, top: 10),
      APP_PADDING_LT_20 = EdgeInsets.only(left: 20, top: 20),
      APP_PADDING_TB_MIN = EdgeInsets.only(top: 8, bottom: 8),
      APP_PADDING_TB = EdgeInsets.only(top: 12, bottom: 12),
      APP_PADDING_TB_20 = EdgeInsets.only(top: 20, bottom: 20),
      APP_PADDING_TB_10 = EdgeInsets.only(top: 12, bottom: 12),
      APP_PADDING_TB_MAX = EdgeInsets.only(top: 16, bottom: 16),
      APP_PADDING_LTR_MIN = EdgeInsets.fromLTRB(8, 8, 8, 0),
      APP_PADDING_LTR_MAX = EdgeInsets.fromLTRB(16, 16, 16, 16),
      APP_PADDING_LTR = EdgeInsets.fromLTRB(12, 12, 12, 0),
      APP_PADDING_LTR_10 = EdgeInsets.fromLTRB(10, 10, 10, 0),
      APP_PADDING_LTR_20 = EdgeInsets.fromLTRB(20, 20, 20, 0),
      APP_PADDING_LRB_MIN = EdgeInsets.fromLTRB(0, 8, 8, 8),
      APP_PADDING_LRB_MAX = EdgeInsets.fromLTRB(0, 16, 16, 16),
      APP_PADDING_LRB = EdgeInsets.fromLTRB(0, 12, 12, 12),
      APP_PADDING_LRB_10 = EdgeInsets.fromLTRB(0, 10, 10, 10),
      APP_PADDING_LRB_20 = EdgeInsets.fromLTRB(0, 20, 20, 20);

  static const appButtonHeight = 50.0;

  static const appFontSizeSmall = 12.0;
  static const appFontSizeMedium = 14.0;
  static const appFontSizeRegular = 16.0;
  static const appFontSizeLarge = 18.0;
  static const APP_FONT_SIZE_EXTRA_LARGE = 20.0;
  static const APP_DEFAULT_ICON_SIZE = 24.0;
  static const APP_CRATE_REQUEST_ICON_SIZE = 36.0;

  static const appDeviderHeight = 1.0;
  static const APP_ROW_UI_ICON_SIZE = 18.0;
  static const APP_FAB_SIZE = 65.0;

  static const fontSize22 = 22.0; //BOLD
  static const fontSize20 = 20.0; //REGULER
  static const fontSize18 = 18.0; //BOLD
  static const fontSize16 = 16.0; //BOLD

  
//  doximity
}
