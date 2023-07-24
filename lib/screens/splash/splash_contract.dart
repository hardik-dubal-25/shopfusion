

import '../base/base_contract.dart';

abstract class SplashContractView extends BaseContractView {
  void openLogin();

  void openDashboard();
}

abstract class SplashContractPresenter<V extends SplashContractView>
    extends BaseContractPresenter<V> {
  void init();
}
