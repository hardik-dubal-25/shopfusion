  
import 'package:shopfusion/data/data_manager.dart'; 

import '../../data/rest_helper/rest_exceptions.dart';
import '../base/base_presenter.dart';
import 'login_contract.dart';

class LoginPresenter<V extends LoginContractView> extends BasePresenter<V>
    implements LoginContractPresenter<V> {
  String? userId;
  String? password;
  bool isLoginPending = false;
  
  @override
  void doLogin(String userId, String password) async {
    this.userId = userId;
    this.password = password;
    isLoginPending = true;
    try {
      startLoading();
      // await DataManager.instance.doLogin(userId, password);
      await Future.delayed(const Duration(milliseconds: 2000), () async {
        if(userId == "admin" && password == "123456"){
          
          await DataManager.instance.verifyUser("Admin");
          
          loadingSuccess();
          getView()?.loginSuccess();
        }
        else{
          loadingSuccess();
          getView()?.loginFailed();
        }
        });
    } catch (e) {
      if (e is! NoInternetException) {
        isLoginPending = false;
      }
      loadingFailed(e);
    }
  }

  @override
  void retry() {
    if (isLoginPending) {
      doLogin(userId!, password!);
    }
  }
}
