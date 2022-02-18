import 'package:flutter/material.dart';
import 'package:gangapp_flutter/ui/products/controllers/product_controller.dart';
import 'package:gangapp_flutter/ui/proof/controllers/product_proof_controller.dart';
import 'package:get/get.dart';

class TextSearchField extends StatelessWidget {
  const TextSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return TextField(
      controller: productController.searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
          hintText: "Search Data....",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white30)),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => productController.updateSearchQuery(query),
    );
  }
}
