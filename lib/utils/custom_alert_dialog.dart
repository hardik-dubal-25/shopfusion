import 'package:shopfusion/imports.dart';

typedef VoidCallback = void Function();

//todo improve button 3
class CustomAlertDialog {
  CustomAlertDialog._();

  static showAlert({
    required BuildContext context,
    String title = "",
    String message = "",
    Widget? view,
    String? button1Text,
    VoidCallback? button1Click,
    String? button2Text,
    VoidCallback? button2Click,
    String? button3Text,
    VoidCallback? button3Click,
    bool isCancelable = true,
    bool isAutoDismiss = true,
  }) async {
    await showDialog(
        context: context,
        barrierDismissible: isCancelable,
        builder: (BuildContext context) {
          return view != null
              ? _getCustomAlertDialog(
                  context: context, view: view, isCancelable: isCancelable)
              : _getSimpleDialog(
                  context: context,
                  title: title,
                  message: message,
                  button1Text: button1Text,
                  button2Text: button2Text,
                  button3Text: button3Text,
                  button1Click: button1Click,
                  button2Click: button2Click,
                  button3Click: button3Click,
                  isAutoDismiss: isAutoDismiss,
                  isCancelable: isCancelable);
        });
  }

  static _getSimpleDialog(
      {required BuildContext context,
      required String title,
      required String message,
      String? button1Text,
      VoidCallback? button1Click,
      String? button2Text,
      VoidCallback? button2Click,
      String? button3Text,
      VoidCallback? button3Click,
      bool isAutoDismiss = true,
      bool isCancelable = true}) {
    List<Widget> buttons = [];
    if (button1Text != null && button1Text.isNotEmpty) {
      buttons.add(TextButton(
        child: Text(
          button1Text,
          // style: Themes.getDialogButtonTextStyle(context),
        ),
        onPressed: () {
          if (isAutoDismiss) {
            if (message ==
                "Your Session has been Expired Please Login Again.") {
              DataManager.instance.logout();
              Future.delayed(const Duration(milliseconds: 2000));
              Navigator.popAndPushNamed(context, Constants.routeLogin);
            } else {
              Navigator.of(context).pop();
            }
          }
          if (button1Click != null) button1Click();
        },
        // onPressed: () {
        //   if (isAutoDismiss) {
        //     Navigator.of(context).pop();
        //   }
        //   if (button1Click != null) button1Click();
        // },
      ));
    }
    if (button2Text != null && button2Text.isNotEmpty) {
      buttons.add(TextButton(
        child: Text(
          button2Text,
          // style: Themes.getDialogButtonTextStyle(context),
        ),
        onPressed: () {
          if (isAutoDismiss) {
            Navigator.of(context).pop();
          }
          if (button2Click != null) button2Click();
        },
      ));
    }
    if (button3Text != null && button3Text.isNotEmpty) {
      buttons.add(TextButton(
        child: Text(
          button3Text,
          // style: Themes.getDialogButtonTextStyle(context),
        ),
        onPressed: () {
          if (isAutoDismiss) {
            Navigator.of(context).pop();
          }
          if (button3Click != null) button3Click();
        },
      ));
    }

    return WillPopScope(
      child: AlertDialog(
        title: Text(title),
        actions: buttons,
        content: SingleChildScrollView(
          child: Text(message,
              style: Theme.of(context)
                  .copyWith(brightness: Brightness.light)
                  .dialogTheme
                  .contentTextStyle),
        ),
      ),
      onWillPop: () async {
        return isCancelable;
      },
    );
  }

  static _getCustomAlertDialog(
      {required BuildContext context,
      required Widget view,
      required bool isCancelable}) {
    return WillPopScope(
      child: Padding(
        padding: const EdgeInsets.all(Constants.APP_PADDING_MIN),
        child: Center(
          child: view,
        ),
      ),
      onWillPop: () async {
        return isCancelable;
      },
    );
  }

  static showPickerDialog({
    required BuildContext context,
    required Widget view,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return view;
        });
  }
}
