import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/constants.dart';
import '../utils/themes.dart';

class ConnectionLostView extends StatelessWidget {
  final bool isShow;
  final VoidCallback onRetryPressed;

  const ConnectionLostView(
      {Key? key, required this.isShow, required this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isShow,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off,
                color: Constants.colorGrey,
                size: 80,
              ),
              Text(
                AppLocalizations.of(context).lblWhoops,
                style: Themes.getTextStyleBold(context).copyWith(
                    color: Constants.colorGrey,
                    fontSize: Constants.APP_FONT_SIZE_EXTRA_LARGE),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                    top: Constants.APP_PADDING,
                    bottom: Constants.APP_PADDING),
                child: Text(
                  AppLocalizations.of(context).lblNoInternet,
                  textAlign: TextAlign.center,
                  style: Themes.getTextStyle(context)
                      .copyWith(color: Constants.colorGrey),
                ),
              ),
              OutlinedButton(
                onPressed: onRetryPressed,
                child: Text(
                  AppLocalizations.of(context).btnTapToRetry,
                  style: Themes.getTextStyleBold(context)
                      .copyWith(color: Constants.colorGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
