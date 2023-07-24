import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../utils/constants.dart';
import '../utils/themes.dart';

class Components {
  Components._();
  static getLogo() {
    // return SvgPicture.asset("assets/images/roexlogo.svg", width: 110, height: 40);
    return Container(alignment: Alignment.center,child: const Text("Shopfusion"));
  }

  static poweredByRow(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Text("Powerd By", style: Themes.getTextStyleMedium(context).copyWith(color: Colors.black45)),
          const SizedBox(width: 5),
          Text("Shopfusion", style: Themes.getTextStyleBoldMedium(context))
        ],
      ),
    );
  }

  static appBarLeadingIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.arrow_back_ios_new, color: Colors.teal, size: 22),
    );
  }

  static getSvgImage(String name,{double? height,double? width})
  {
     return SvgPicture.asset("assets/images/$name.svg");
  }
  static getSvgIcon(String name,{double? height,double? width,Color? color})
  {
     return SvgPicture.asset("assets/icons/$name.svg");
  }
  static getAssetImage(String name,{double? height,double? width})
  {
     return SvgPicture.asset("assets/images/$name");
  }
  static getAssetIcon(String name,{double? height,double? width,Color? color})
  {
     return Image.asset("assets/icons/$name",height: height ?? 24,width: width ?? 24);
  }
  static getDefaultIcon(IconData icon,{Color? color}){
    return color != null ? Icon(icon,color: color,): Icon(icon);
  }

  static appBar(BuildContext context,String title){
    return AppBar(
            leading: Components.appBarLeadingIcon(context),
            title: Text(title, style: Themes.getTextStyleBoldWhite(context)),
            centerTitle: true,
            backgroundColor: Constants.appBarColor);
  }

  

  static navigateTo(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }

  static getDelay(int delay) async {
    return await Future.delayed(Duration(seconds: delay));
  }

  static getDivider({double? thickness, Color? color, double? indent, double? endIndent}) {
    return Divider( endIndent: endIndent, indent: indent);
  }
  static getTextBlack(String text,BuildContext context,{double? size}){
    return Text(text,style: Themes.getTextStyle(context).copyWith(fontSize: size));
  }
  static getTextBoldBlack(String text,BuildContext context,{double? size}){
    return Text(text,style: Themes.getTextStyleBold(context).copyWith(fontSize: size));
  }
  static getTextWhite(String text,BuildContext context,{double? size}){
    return Text(text,style: Themes.getTextStyleWhite(context).copyWith(fontSize: size));
  }
  static getTextBoldWhite(String text,BuildContext context,{double? size}){
    return Text(text,style: Themes.getTextStyleBoldWhite(context).copyWith(fontSize: size));
  }
  static getTextField({bool isPasswordField=false,Widget? prefixIcon,String? hintText,TextEditingController? controller}) {
    return TextFormField(
      style: const TextStyle(fontSize: 16),
      controller: controller,
      cursorWidth: 2.5,
      textAlign: TextAlign.left,
      obscureText: isPasswordField,
      cursorColor: Colors.teal,
      decoration: getTextFieldDecoration(hintText: hintText,prefixIcon: prefixIcon),
    );
  }

  static getIcon(IconData iconData){
    return Icon(iconData);
  }

  static getTextFieldDecoration({String? hintText,Widget? prefixIcon}){
     return InputDecoration(
      prefixIcon: Padding(
        padding: Constants.appPaddingL10,
        child: prefixIcon ?? Container(),
      ),
      hintText: hintText ?? "",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: const BorderSide(color: Color(0xffb3b3b3))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: const BorderSide(color: Color(0xffb3b3b3))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: const BorderSide(color: Color(0xffb3b3b3))),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: const BorderSide(color: Color(0xffb3b3b3))),
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 00, 10));
  }

  static getButton(String buttonText,void Function() onPressed,BuildContext context){
    return ElevatedButton(onPressed: onPressed, child: Padding(
      padding: Constants.appPaddingLR20,
      child: Text(buttonText,style: Themes.getTextStyleBoldWhite(context),),
    ));
  }

  static getTextButton(String buttonText,void Function() onPressed,BuildContext context){
    return TextButton(onPressed: onPressed, child: Padding(
      padding: Constants.appPaddingLR20,
      child: Text(buttonText,style: Themes.getTextStyle(context).copyWith(color: Themes.myScheme.primary),),
    ));
  }

  static verticalSizedBox({double? height}) {
    return SizedBox(height: height ?? 10);
  }

  static horizontallSizedBox({double? width}) {
    return SizedBox(width: width ?? 10);
  }

  static Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context).titleExitApp, textAlign: TextAlign.center),
            content: Text(AppLocalizations.of(context).lblExitApp, textAlign: TextAlign.center),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  ElevatedButton(
                    onPressed: () => exit(0),
                    child: getTextWhite(AppLocalizations.of(context).lblYes, context),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                    child: getTextBlack(AppLocalizations.of(context).lblNo, context),
                  ),
                ],
              ),
            ],
          ),
        ) ??
        false; //if showDialogue had returned null, then return false
  }


}
