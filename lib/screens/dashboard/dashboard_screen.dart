import 'package:shopfusion/imports.dart';
import 'package:shopfusion/screens/dashboard/dashboard_contract.dart';
import 'package:shopfusion/screens/dashboard/dashboard_presenter.dart';
import 'package:shopfusion/screens/product/product_detail_screen.dart';
import 'package:shopfusion/screens/settings/profile_settings.dart';
import 'package:shopfusion/utils/app_utils.dart';

import '../base/base_view_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseViewState<DashboardScreen> implements DashboardContractView {
  int selectedIndex = 0;
  List<Product> productList = [], selectedProducts = [];
  late DashboardContractPresenter<DashboardContractView> presenter;

  @override
  void initState() {
    super.initState();
    presenter = DashboardPresenter();
    presenter.onAttach(this);
    presenter.getProductList();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Hello, Admin"),
          actions: [
            GestureDetector(
              onTap: () {
                AppUtils.logout();
                Navigator.pushNamedAndRemoveUntil(context, Constants.routeLogin, (route) => false);
              },
              child: const Icon(
                Icons.logout_outlined,
                size: 24,
                color: Colors.white,
              ),
            ),
            Components.horizontallSizedBox()
          ],
          automaticallyImplyLeading: false,
          centerTitle: false),
      body: [getBody(), MyCart(cartItems: selectedProducts), const ProfileSettingScreen()][selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(width: 1))),
        child: BottomNavigationBar(
          
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            (selectedIndex == 0)
                ? BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Home-active.svg'), label: '')
                : BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Home.svg'), label: ''),
            (selectedIndex == 1)
                ? BottomNavigationBarItem(
                    icon: Badge(label: Text("${selectedProducts.length}"),child: const Icon(Icons.shopping_cart),),
                     label: '')
                : BottomNavigationBarItem(
                    icon: Badge(label: Text("${selectedProducts.length}"), child:const Icon(Icons.shopping_cart_outlined)),
                    label: ''),
            // (selectedIndex == 2)
            //     ? BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Profile-active.svg'), label: '')
            //     : BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Profile.svg'), label: ''),
          ],
          // backgroundColor: Colors.teal.shade300,
        ),
      ),
    );
  }

  getBody() {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            presenter.getProductList();
          },
          child: Padding(
            padding: Constants.APP_PADDING_20,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1),
              itemCount: productList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  bool res = await Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: productList[index])));
                  if (res) {
                    setState(() {
                      productList[index].isInCart = true;
                      productList[index].cartCount = 1;
                      selectedProducts.add(productList[index]);
                    });
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(child: Image.network(productList[index].mainImage!, height: 120)),
                    Text(productList[index].title!),
                  ],
                ),
              ),
            ),
          ),
        ),
        getExtraViews(),
      ],
    );
  }

  @override
  void addDataToProductList(List<Product> data) {
    setState(() {
      productList = data;
    });
  }

  @override
  void getAppVersion() {}
}
