
import '../../data/data_manager.dart';
import '../../data/rest_helper/rest_exceptions.dart';
import '../../models/product_model.dart';
import '../../widgets/components.dart';
import '/screens/base/base_presenter.dart';
import 'dashboard_contract.dart';

class DashboardPresenter<V extends DashboardContractView> extends BasePresenter<V>
    implements DashboardContractPresenter<V> {
  String? userId;
  bool? isLoadingPending;
  bool isCreatePending = false;

  @override
  void init() {
    if (getView() == null) return;
    
  }

  @override
  void retry() {
    if (isLoadingPending!) {
      
    }
  }
  

  @override
  void reset() {
    //getUserDetails();

  }
 

  @override
  Future getUserDetails() async {
   // await DataManager.instance.getUserDetails();
  }
   @override
   getLoading() async {
    startLoading();
    Components.getDelay(2);
    loadingSuccess();
}
  
  @override
  getProductList() async{ 
    try {
      startLoading();
      List<Product> dataList = await DataManager.instance.getProductList();
      loadingSuccess();
      getView()?.addDataToProductList(dataList);
    } catch (e) {
      if (e is! NoInternetException) {}
      loadingFailed(e); 
    }
  }
  
 
 
}
