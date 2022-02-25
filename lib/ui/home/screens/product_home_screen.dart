import 'package:flutter/material.dart';
import 'package:gangapp_flutter/routes/app_pages.dart';
import 'package:gangapp_flutter/ui/home/widgets/grid_card_product.dart';
import 'package:gangapp_flutter/ui/products/controllers/product_controller.dart';
import 'package:gangapp_flutter/ui/products/widgets/build_actions_search.dart';
import 'package:gangapp_flutter/ui/products/widgets/row_categories.dart';
import 'package:gangapp_flutter/ui/products/widgets/text_search_field.dart';
import 'package:gangapp_flutter/ui/theme/color_theme.dart';
import 'package:get/get.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading:
              productController.isSearching.value ? BackButton() : Container(),
          title: productController.isSearching.value
              ? TextSearchField()
              : Text("Title"),
          actions: [
            BuildActionsSearch(),
          ],
        ),
        backgroundColor: Colors.green,
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: AppColors.white,
            size: 40.0,
          ),
          onPressed: () {
            Get.toNamed(Routes.PRODUCTFORM);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Stack(
            children: [
              SizedBox(
                height: 30,
                child: RowCategories(
                  categories: productController.productCategories,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Obx(
                  () => (productController.addProducts.value.isEmpty &&
                          (productController.isSearching.value == false ||
                              productController.searchQueryController.text ==
                                  ""))
                      ? (productController
                              .productsCategoryList.value.isNotEmpty)
                          ? GridCardProduct(
                              listProduct:
                                  productController.productsCategoryList.value)
                          : GridCardProduct(
                              listProduct: productController.productsList.value)
                      : GridCardProduct(
                          listProduct: productController.addProducts.value),

                  // (productController.addProducts.value.isEmpty ||
                  //         productController.addProducts.value == [])
                  //     ? (productController.productsCategoryList.value.isEmpty)
                  //         ? GridCardProduct(
                  //             listProduct: productController.productsList.value,
                  //           )
                  //         : GridCardProduct(
                  //             listProduct:
                  //                 productController.productsCategoryList.value,
                  //           )
                  //     : GridCardProduct(
                  //         listProduct: productController.addProducts.value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
