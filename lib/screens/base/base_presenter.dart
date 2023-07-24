

import '../../data/rest_helper/rest_exceptions.dart';
import '../../utils/constants.dart';
import 'base_contract.dart';

class BasePresenter<V extends BaseContractView>
    implements BaseContractPresenter<V> {
  V? _view;

  V? getView() {
    return _view;
  }

  @override
  void onAttach(V view) {
    _view = view;
  }

  @override
  void onDetach() {
    _view = null;
  }

  void startLoading() {
    if (getView() == null) {
      
      return;
    }
    getView()?.showProgressBar();
    getView()?.hideConnectionLostView();
  }

  void loadingSuccess() {
    getView()?.hideProgressBar();
    getView()?.hideConnectionLostView();
  }

  void handleCodeMessage(int code, String message,
      {bool isShowDialog = false, bool isConnectionView = true}) {
    getView()?.hideProgressBar();
    if (code == Constants.failInternetCode) {
      if (isConnectionView) getView()?.showConnectionLostView();
      if (isShowDialog) getView()?.showError(code, message);
    } else {
      getView()?.showError(code, message);
    }
  }

  void loadingFailed(e) {
    if (e is FailureResponse) {
      handleCodeMessage(e.response.status!, e.response.message!);
    } else if (e is NoInternetException) {
      handleCodeMessage(Constants.failInternetCode, "No Internet");
    } else {
      handleCodeMessage(
          Constants.failSomethingWentWrongCode, "Something went wrong");
    }
  }

  @override
  void retry() {}
}
