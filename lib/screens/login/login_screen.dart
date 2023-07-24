import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopfusion/screens/login/login_contract.dart';
import 'package:shopfusion/utils/app_utils.dart';
import 'package:shopfusion/utils/constants.dart';
import 'package:shopfusion/widgets/components.dart';
import '../base/base_view_state.dart';
import 'login_presenter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseViewState<LoginScreen> implements LoginContractView {
  GlobalKey<FormState>? formKey;
  late LoginContractPresenter<LoginContractView> presenter;
  late TextEditingController? userNameController, passwordController;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey();
    presenter = LoginPresenter();
    presenter.onAttach(this);
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: () => Components.showExitPopup(context),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            painter: CurvePainter(),
                            child: Container(height: MediaQuery.of(context).size.width / 1.7),
                          ),
                          Components.getTextBoldWhite("Shopfusion", context, size: 28)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                        child: Column(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Components.getTextBlack(AppLocalizations.of(context).titleLogin, context, size: 26)),
                            Components.getDivider(),
                            Components.verticalSizedBox(height: 15),
                            Components.getTextField(prefixIcon: const Icon(Icons.person), hintText: "Username",controller: userNameController),
                            Components.verticalSizedBox(height: 15),
                            Components.getTextField(isPasswordField: true, prefixIcon: const Icon(Icons.vpn_key), hintText: "Password",controller: passwordController),
                            Components.verticalSizedBox(height: 15),
                            Components.getButton(AppLocalizations.of(context).btnLogin, () {
                              presenter.doLogin(userNameController!.text.trim(), passwordController!.text.trim().toString());
                            }, context),
                            Components.getTextButton(AppLocalizations.of(context).btnForgotPassword, () {}, context)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              getExtraViews()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void loginSuccess() {
    Components.navigateTo(context, Constants.routeDashboard);
    AppUtils.showSnackbar("Login Success", Colors.green,context);
  }
  @override
  void loginFailed() {
    AppUtils.showSnackbar("Login Failed",Colors.red.shade400,context);
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.teal;
    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.750, size.width * 0.50, size.height * 0.950);
    path.quadraticBezierTo(size.width * 0.80, size.height * 1.15, size.width * 1.0, size.height * 0.950);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
