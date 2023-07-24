abstract class BaseContractPresenter<V extends BaseContractView> {
  void onAttach(V view);

  void onDetach();

  void retry();
}

abstract class BaseContractView {
  void showProgressBar();

  void hideProgressBar();

  void showConnectionLostView();

  void hideConnectionLostView();

  void showError(int code, String message);
}
