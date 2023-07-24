import 'package:shopfusion/imports.dart';

// ignore: must_be_immutable
class MyCart extends StatefulWidget {
  MyCart({super.key, this.cartItems});
  List<Product>? cartItems;
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<Product> cartDetails = [];

  @override
  void initState() {
    super.initState();
    cartDetails = widget.cartItems!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:Constants.APP_PADDING_10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My cart",style: Themes.getTextStyleBold(context)),
              Components.verticalSizedBox(),
              Text("Items - ${cartDetails.length}",style: Themes.getTextStyleBold(context).copyWith(color: Colors.teal)),
              Text("Grand total - ₹ ${getTotalprice()}",style: Themes.getTextStyleBold(context).copyWith(color: Colors.teal)),
              Components.verticalSizedBox(),
              ListView.builder(
                  itemCount: cartDetails.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(cartDetails[index].mainImage!, height: 100, width: 150),
                                  Components.horizontallSizedBox(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${cartDetails[index].title}", style: Themes.getTextStyleBold(context)),
                                      Components.verticalSizedBox(height: 3),
                                      Text("Price : ${cartDetails[index].price}"),
                                      Components.verticalSizedBox(height: 2),
                                      Text(cartDetails[index].stock != 0 ? "In stock" : "Out of stock"),
                                      Components.verticalSizedBox(height: 2),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.teal.shade100,
                                        ),
                                        padding: const EdgeInsets.all(3),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (cartDetails[index].cartCount == 1) {
                                                      cartDetails.remove(cartDetails[index]);
                                                    } else {
                                                      cartDetails[index].cartCount = cartDetails[index].cartCount!.toInt() - 1;
                                                    }
                                                  });
                                                },
                                                child: cartDetails[index].cartCount == 1 ? const Icon(Icons.delete_outline) : const Icon(Icons.remove, size: 20)),
                                            Container(width: 35, alignment: Alignment.center, child: Text("${cartDetails[index].cartCount}")),
                                            GestureDetector(
                                                onTap: () {
                                                  cartDetails[index].cartCount = cartDetails[index].cartCount!.toInt() + 1;
                                                  setState(() {});
                                                },
                                                child: const Icon(Icons.add, size: 20))
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
  
  getTotalprice() {
    double totalPrice = 0;
    for (var element in cartDetails) {
      totalPrice = totalPrice + element.price!.toDouble() * element.cartCount!;
    }
    return totalPrice;
  }

}
