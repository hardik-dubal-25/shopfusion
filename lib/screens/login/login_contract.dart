import '../base/base_contract.dart';

abstract class LoginContractView implements BaseContractView {
  void loginSuccess();
  void loginFailed();
}

abstract class LoginContractPresenter<V extends LoginContractView> implements BaseContractPresenter<V> {
  void doLogin(String userId, String password);
}
