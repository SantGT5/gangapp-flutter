import 'package:get/get.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service_products.dart';
import 'package:gangapp_flutter/models/product_model.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> productsList = Rx<List<ProductModel>>([]);
  Rx<List<ProductModel>> productsCategoryList = Rx<List<ProductModel>>([]);

  List<String> productCategories = ['Hombre', 'Mujer', 'Niños', 'Equipamiento'];
  @override
  void onReady() {
    productsList.bindStream(DataBaseProducts().productsStream());
    super.onReady();
  }

  Future<List<ProductModel>> categorySelected(String category) async {
    productsCategoryList.value = [];
    for (var element in productsList.value) {
      if (element.productCategory == category) {
        productsCategoryList.value.add(element);
      }
    }
    return productsCategoryList.value;
    // .toList();
  }
}
