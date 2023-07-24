

import '../../models/product_model.dart';
import '../base/base_contract.dart';

abstract class DashboardContractView implements BaseContractView {
   void getAppVersion();
  void addDataToProductList(List<Product> data);
 
  // void addCaseStatusToView(List<CaseStatus> listOfCaseStatus);
  // void addCaseForToView(List<CaseFor> listOfCaseFor);
}

abstract class DashboardContractPresenter<V extends DashboardContractView> implements BaseContractPresenter<V> {
  Future getUserDetails();
  // void getInventoryToken();
  void init();
  void reset();
   getLoading();
   getProductList();
 
  // void getCaseFor();
}
