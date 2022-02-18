import 'package:flutter/material.dart';
import 'package:gangapp_flutter/models/product_model.dart';
import 'package:gangapp_flutter/ui/products/widgets/webview_product.dart';
import 'package:gangapp_flutter/ui/theme/color_theme.dart';
import 'package:gangapp_flutter/ui/theme/text_theme.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetails({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const String _url = 'https://flutter.dev';

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // if (!await launch(_url)) throw 'Could not launch $_url';
          Get.to(WebViewProduct());
        },
      ),
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: AppColors.white,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Container(
                height: 500,
                width: double.infinity,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      child: Image.network(
                        productModel.photoUrl!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(productModel.name!),
                              Text(
                                productModel.originalPrice!,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.rotate(
                                angle: 50,
                                child: Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 40,
                                ),
                              ),
                              Text(
                                productModel.realPrice!,
                                style: textTheme.headline1,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(productModel.description!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
