import 'package:flutter/material.dart';

import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/custom_alert_dialog.dart';
import '../../utils/themes.dart';
import '../../widgets/connection_lost_view.dart';
import '../../widgets/loading.dart';
import 'base_contract.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
 

abstract class BaseViewState<T extends StatefulWidget> extends State<T>
    implements BaseContractView {
  bool isShowProgressBar = false;
  bool isShowConnectionLostView = false;

  Widget getExtraViews() {
    return Stack(
      children: [
        if (isShowProgressBar == true)
          Loading(
            isShow: isShowProgressBar,
          ),
        ConnectionLostView(
          isShow: isShowConnectionLostView,
          onRetryPressed: () {
            retryClicked();
          },
        ),
      ],
    );
  }

  void retryClicked() async {
    if (await AppUtils.isInternetAvailable()) {
      setState(() {
        isShowConnectionLostView = false;
      });
    }
  }

  @override
  void showProgressBar() {
    setState(() {
      isShowProgressBar = true;
    });
  }

  @override
  void hideProgressBar() {
    setState(() {
      isShowProgressBar = false;
    });
  }

  @override
  void showConnectionLostView() {
    setState(() {
      isShowConnectionLostView = true;
    });
  }

  @override
  void hideConnectionLostView() {
    setState(() {
      isShowConnectionLostView = false;
    });
  }

  @override
  void showError(int code, String msg) {
    CustomAlertDialog.showAlert(
        context: context,
        title: AppLocalizations.of(context).appName,
        message: msg,
        button1Text: AppLocalizations.of(context).btnOk);
  }

  Widget getNoDataFoundView(bool isVisible) {
    return Visibility(
      visible: isVisible,
      child: Center(
        child: Text(
          AppLocalizations.of(context).lblNoDataFound,
          style: Themes.getTextStyle(context),
        ),
      ),
    );
  }

  Widget getBottomLoading(bool isVisible) {
    return Visibility(
      visible: isVisible,
      child: const Center(
          child: Padding(
        padding: EdgeInsets.all(Constants.APP_PADDING),
        child: CircularProgressIndicator(),
      )),
    );
  }

  Widget getBottomLoadingFailed(bool isVisible, VoidCallback onPressed) {
    return Visibility(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.all(Constants.APP_PADDING),
      child: Column(
        children: [
          const Text("It look like no internet connection"),
          OutlinedButton(
              onPressed: onPressed, child: const Text("Tap To Retry"))
        ],
      ),
    )));
  }

  // Widget locationOff(bool isVisible) {
  //   return Visibility(
  //     child: Container(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Icon(
  //               Icons.location_off,
  //               size: MediaQuery.of(context).size.height * .10,
  //               color: Constants.COLOR_APP_BLUE,
  //             ),
  //             SizedBox(height: 15.0),
  //             Text(
  //               "Turn on the location to get ticket list!",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16,
  //                 color: Constants.COLOR_APP_BLUE,
  //               ),
  //             ),
  //             SizedBox(height: 10.0),
  //             TextButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     AppUtils.getGeoLocationPosition();
  //                   });
  //                 },
  //                 child: Text(
  //                   "Turn On",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 18,
  //                     color: Colors.blue[700],
  //                   ),
  //                 ))
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
