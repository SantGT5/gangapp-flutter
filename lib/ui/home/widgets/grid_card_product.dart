import 'package:flutter/material.dart';
import 'package:gangapp_flutter/models/product_model.dart';
import 'package:gangapp_flutter/ui/home/widgets/card_product.dart';

class GridCardProduct extends StatelessWidget {
  final List<ProductModel> listProduct;
  const GridCardProduct({Key? key, required this.listProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemCount: listProduct.length,
      itemBuilder: (context, index) {
        return CardProduct(
          productModel: listProduct[index],
        );
      },
    );
  }
}
