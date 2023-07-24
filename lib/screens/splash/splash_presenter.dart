
import '../../data/data_manager.dart';
import '../base/base_presenter.dart';
import 'splash_contract.dart';

class SplashPresenter<V extends SplashContractView> extends BasePresenter<V>
    implements SplashContractPresenter<V> {
  @override
  void init() async {
    await Future.delayed(const Duration(seconds: 4));
    if (DataManager.instance.isLoggedIn()) {
      getView()!.openDashboard();
    } else {
      getView()?.openLogin();
    }
  }
}
