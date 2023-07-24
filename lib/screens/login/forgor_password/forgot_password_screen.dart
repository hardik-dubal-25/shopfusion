import 'package:flutter/material.dart';

import '../../../utils/themes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back_ios),
            padding: const EdgeInsets.fromLTRB(10, 15, 00, 10),
          ),
          Expanded(
            child: Stack(
              children: [
          //       Align(
          //   alignment: FractionalOffset.bottomCenter,
          //   child: Image.asset("assets/images/login_bg.png"),
          // ),
                Padding(
                  padding: const EdgeInsets.only(bottom:40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center, child: Text("Forgot Password ? ", style: Themes.getTextStyleBold(context).copyWith(fontSize: 28))),
                      const SizedBox(height: 20),
                      Text("Kindly Contact Administrator", style: Themes.getAWSTextStyle(context).copyWith(color: const Color(0xff9E9E9E))),
                      const SizedBox(height: 5),
                      Text("info@roexdesign.com", style: Themes.getAWSTextStyle(context))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
