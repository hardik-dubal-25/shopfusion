import 'package:flutter/material.dart';
import 'package:shopfusion/screens/splash/splash_contract.dart';

import '../../utils/constants.dart';
import '../../utils/themes.dart';
import '../base/base_view_state.dart';
import 'splash_presenter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseViewState<SplashScreen> with TickerProviderStateMixin implements SplashContractView {
  late SplashContractPresenter<SplashContractView> presenter;
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    presenter = SplashPresenter();
    presenter.onAttach(this);
    presenter.init();
    controller = AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FadeTransition(opacity: animation!, child: Text("Shopfusion", style: Themes.getTextStyleBold(context).copyWith(fontSize: 32,color: Colors.teal)))));
  }

  @override
  void openDashboard() {
    Navigator.of(context).popAndPushNamed(Constants.routeDashboard);
  }

  @override
  void openLogin() {
    Navigator.of(context).popAndPushNamed(Constants.routeLogin);
  }
}
