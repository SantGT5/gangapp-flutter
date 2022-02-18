import 'package:flutter/material.dart';
import 'package:gangapp_flutter/ui/products/controllers/product_controller.dart';
import 'package:get/get.dart';

class RowCategories extends StatelessWidget {
  final List<String> categories;
  const RowCategories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () async {
                print(categories[index]);
                productController.productsCategoryList.value =
                    await productController.categorySelected(categories[index]);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green[300])),
              child: Text(
                categories[index],
              ),
            ),
          );
        });
  }
}
