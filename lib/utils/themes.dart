// ignore_for_file: deprecated_member_use, constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class Themes {
//  todo splash screen ios
  Themes._();

  static Color lightPrimary = Colors.teal.shade500;
  static Color lightPrimaryDark = Colors.teal.shade700;
  static const Color lightPrimaryLight = Color(0xFF518b96);
  static const Color lightSecondary = Color(0xff8E24AA);
  static const Color lightSecondaryLight = Color(0xffAB47BC);

  static const Color lightBackground = Color(0xfffafafa);
  static const Color lightSurface = Color(0xfffafafa);
  static const Color lightError = Color(0xffd32f2f);
  static const Color lightOnError = Color(0xffffffff);
  static const Color lightOnPrimary = Color(0xffffffff);
  static const Color lightOnSecondary = Color(0xff000000);

  static ColorScheme myScheme = ColorScheme.fromSeed(seedColor: Colors.teal.shade500, brightness: Brightness.light);

  static ThemeData getTheme(BuildContext context) {
    // return myTheme;
    return ThemeData(
      useMaterial3: true,
      colorScheme: myScheme,
      brightness: Brightness.light,
      primaryColor: myScheme.primary,
      primaryColorLight: Color.alphaBlend(Colors.white.withAlpha(0x66), myScheme.primary),
      primaryColorDark: Color.alphaBlend(Colors.black.withAlpha(0x66), myScheme.primary),
      secondaryHeaderColor: Color.alphaBlend(Colors.white.withAlpha(0xCC), myScheme.primary),
      scaffoldBackgroundColor: myScheme.background,
      canvasColor: myScheme.background,
      backgroundColor: myScheme.background,
      cardColor: myScheme.surface,
      bottomAppBarColor: myScheme.surface,
      dialogBackgroundColor: myScheme.surface,
      indicatorColor: myScheme.onPrimary,
      dividerColor: myScheme.onSurface.withOpacity(0.12),
      errorColor: myScheme.error,
      applyElevationOverlayColor: false,
      visualDensity: VisualDensity.standard,
      appBarTheme: AppBarTheme(
          color: myScheme.primary,
          titleTextStyle: Themes.getTitleTextStyleWhite(context),
          centerTitle: true,
          elevation: 2,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: myScheme.primary, statusBarBrightness: Brightness.light)),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: myScheme.primaryContainer, elevation: 2,selectedItemColor: myScheme.secondary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
              backgroundColor: MaterialStateProperty.all(myScheme.primary))),
    );
  }

  static TextStyle getTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
          fontSize: Constants.appFontSizeRegular,
        );
  }

  static TextStyle getPlanCellLargeTitleLabelBlackTextStyle(BuildContext context) {
    return getTextStyleBold(context).copyWith(fontSize: Constants.fontSize20);
  }

  static TextStyle getDrawerTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
          fontSize: Constants.appFontSizeRegular,
        );
  }

  static TextStyle getTextStyleSmall(BuildContext context) {
    return getTextStyle(context).copyWith(
      fontSize: Constants.textSizeSmall,
    );
  }

  static TextStyle getTextStyleMedium(BuildContext context) {
    return getTextStyle(context).copyWith(
      fontSize: Constants.appFontSizeMedium,
    );
  }

  static TextStyle getTextStyleBoldMedium(BuildContext context) {
    return getTextStyleBold(context).copyWith(fontSize: Constants.appFontSizeMedium, fontFamily: "Inter-SemiBold");
  }

  static TextStyle getTextStyleWhite(BuildContext context) {
    return getTextStyle(context).copyWith(color: Constants.colorTextWhite, fontSize: 14);
  }

  static TextStyle getTextStyleCenter(BuildContext context) {
    return getTextStyle(context).copyWith();
  }

  static TextStyle getTextStyleBoldBlack(BuildContext context) {
    return getTextStyleBold(context).copyWith(color: Constants.colorTextBlack, fontFamily: "InstrumentSans-SemiBold");
  }

  static TextStyle getTextStyleBoldBlue(BuildContext context) {
    return getTextStyleBold(context).copyWith(color: Colors.blue[800], fontFamily: "InstrumentSans-SemiBold");
  }

  static TextStyle getTextStyleBoldWhite(BuildContext context) {
    return getTextStyleBold(context).copyWith(color: Constants.colorTextWhite, fontFamily: "InstrumentSans-SemiBold");
  }

  static TextStyle getAWSTextStyle(BuildContext context) {
    return getTextStyle(context).copyWith(
      fontSize: Constants.fontSize18,
    );
  }

  static TextStyle getNoDataTextStyle(BuildContext context) {
    return getTextStyle(context);
  }

  static TextStyle getTextStyleBold(BuildContext context) {
    return getTextStyle(context).copyWith(fontWeight: FontWeight.bold, fontFamily: "Inter-SemiBold");
  }

  static TextStyle getTitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, fontFamily: "Inter-SemiBold");
  }

  static TextStyle getTitleTextStyleWhite(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle getTitleTextWhite(BuildContext context) {
    return getTextStyleBold(context).copyWith(
      color: Constants.colorTextWhite,
    );
  }

  static TextStyle getUltraLargeBannerTitleTextWhite(BuildContext context) {
    return getTextStyleBold(context).copyWith(
      fontSize: 32,
      color: Constants.colorTextWhite,
    );
  }

  static TextStyle getUltraLargeBannerTitleText(BuildContext context) {
    return getTextStyleBold(context).copyWith(fontSize: 36, fontFamily: "InstrumentSans-SemiBold");
  }

  static TextStyle getSectionTitleTextStyle(BuildContext context) {
    return getTitleTextStyle(context).copyWith(fontSize: Constants.APP_FONT_SIZE_EXTRA_LARGE);
  }

  static TextStyle getQuestionTitleTextStyle(BuildContext context) {
    return getTitleTextStyle(context).copyWith(fontSize: Constants.appFontSizeRegular);
  }

  static TextStyle getButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.button!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: Constants.appFontSizeRegular,
        );
  }

  static TextStyle getDialogButtonTextStyle(BuildContext context) {
    return getButtonTextStyle(context).copyWith(
      color: Theme.of(context).buttonTheme.colorScheme!.primary,
    );
  }

  static TextStyle getPlanCellMediumLabelDarkGrayTextStyle(BuildContext context) {
    return getTextStyleSmall(context).copyWith(color: Colors.grey[600], fontSize: Constants.appFontSizeRegular);
  }

  static Color getIconColorOnSurface(BuildContext context) {
    return Constants.colorIconBlack;
  }

  static Color getIconColorOnPrimary(BuildContext context) {
    return Constants.colorTextWhite;
  }

  static Color getDividerColor(BuildContext context) {
    return Constants.colorDivider;
  }

  static TextStyle getTextFieldTextStyle(BuildContext context) {
    return getTextStyle(context).copyWith(
        // color: Constants.COLOR_TEXT_FIELD_TEXT,
        );
  }

  static TextStyle getTextFieldTextStyleWhite(BuildContext context) {
    return getTextStyle(context).copyWith(
      color: Colors.white,
    );
  }

  static TextStyle getTextFieldHintStyle(BuildContext context) {
    return getTextStyle(context).copyWith(
      color: Constants.colorGrey,
    );
  }

  static TextStyle getTabTextStyle(BuildContext context) {
    return getButtonTextStyle(context);
  }

  static TextStyle getChildMessageTextStyle(BuildContext context, int childMsg1Type) {
    var fontSize, fontWeight, color = Constants.colorTextWhite;
    switch (childMsg1Type) {
      case 1:
        {
          fontSize = Constants.fontSize22;
          fontWeight = FontWeight.bold;

          break;
        }
      case 2:
        {
          fontSize = Constants.fontSize20;
          fontWeight = FontWeight.normal;
          break;
        }
      case 3:
        {
          fontSize = Constants.fontSize18;
          fontWeight = FontWeight.bold;
          break;
        }
      case 4:
        {
          fontSize = Constants.fontSize16;
          fontWeight = FontWeight.bold;
          break;
        }
      case 5:
        {
          fontSize = Constants.fontSize16;
          fontWeight = FontWeight.normal;
          break;
        }
      default:
        {
          fontSize = Constants.fontSize16;
          fontWeight = FontWeight.normal;
          color = Constants.colorDullWhite;
          break;
        }
    }
    return getTextStyle(context).copyWith(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  static TextStyle getSettingsTitle(BuildContext context) {
    return getTextStyle(context).copyWith(fontSize: Constants.fontSize18);
  }

  static TextStyle getSettingsNormalTextStyle(BuildContext context) {
    return getTextStyle(context).copyWith(color: Constants.colorTextBlack);
  }
}
