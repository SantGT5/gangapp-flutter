import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service_products.dart';
import 'package:gangapp_flutter/models/product_model.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> productsList = Rx<List<ProductModel>>([]);
  Rx<List<ProductModel>> productsCategoryList = Rx<List<ProductModel>>([]);
  TextEditingController searchQueryController = TextEditingController();
  Rx<bool> isSearching = false.obs;
  String searchQuery = "Search query";
  Rx<List<ProductModel>> addProducts = Rx<List<ProductModel>>([]);
  List<String> productCategories = ['Hombre', 'Mujer', 'Niños', 'Equipamiento'];

  @override
  void onReady() {
    productsList.bindStream(DataBaseProducts().productsStream());
    super.onReady();
  }

  void updateSearchQuery(String newQuery) async {
    addProducts.value.clear();
    searchQuery = newQuery;
    if (productsCategoryList.value.isEmpty) {
      addProducts.value.addAll(productsList.value.where(
          (element) => element.name!.contains(searchQueryController.text)));
    } else {
      addProducts.value.addAll(productsCategoryList.value.where(
          (element) => element.name!.contains(searchQueryController.text)));
    }

    addProducts.refresh();
    print(addProducts);
  }

  void clearSearchQuery() {
    searchQueryController.clear();
    addProducts.value.clear();
    addProducts.refresh();
    print(addProducts);
    updateSearchQuery("");
  }

  void stopSearching() {
    clearSearchQuery();
    addProducts.value.clear();
    isSearching.value = false;
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
