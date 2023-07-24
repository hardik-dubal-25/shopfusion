import 'package:shopfusion/imports.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatefulWidget {
  Product? product;
  ProductDetailScreen({super.key, this.product});
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product? product;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(padding: Constants.APP_PADDING_10, alignment: Alignment.centerLeft, child: Components.appBarLeadingIcon(context)),
        Image.network("${product!.images[currentIndex]}", height: 230, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
        const SizedBox(height: 15),
        SizedBox(
          height: 75,
          child: ListView.builder(
              itemCount: product!.images.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: product?.images[index] != "" && product?.images[index] != null
                          ? Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(6)),
                              child: Image.network("${product!.images[index]}", height: 60, width: 60),
                            )
                          : const SizedBox(),
                    ),
                  )),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: Constants.APP_PADDING_10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product Details",
                style: Themes.getTextStyleBold(context),
              ),
              Components.getDivider(),
              Text(
                "${product!.title}",
                style: Themes.getTextStyleBold(context),
              ),
              Components.verticalSizedBox(height: 5),
              Text("${product!.description}"),
              Components.verticalSizedBox(height: 3),
              Text("Brand : ${product!.brand}"),
              Components.verticalSizedBox(height: 3),
              Text("Price : ${product!.price}"),
              Components.verticalSizedBox(height: 3),
              Text("Discount : ${product!.discountPercentage}%"),
              Components.verticalSizedBox(height: 3),
              Text("Rating : ${product!.rating}"),
              Components.verticalSizedBox(height: 3),
              Text(product!.stock != 0 ? "In stock" : "Out of stock"),
              Components.verticalSizedBox(height: 20),
              Container(
                  alignment: Alignment.center,
                  child: Components.getButton(
                      product!.isInCart == true ? "Already in cart" : "Add to cart",
                      product!.isInCart == true
                          ? () {}
                          : () {
                              Navigator.pop(context, true);
                            },
                      context)),
            ],
          ),
        )
      ]),
    ));
  }
}
