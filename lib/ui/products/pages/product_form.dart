import 'package:flutter/material.dart';
import 'package:gangapp_flutter/global_widgets/textfield_global.dart';
import 'package:gangapp_flutter/ui/products/controllers/product_controller.dart';

class ProductForm extends StatelessWidget {
  ProductForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ProductController productController = ProductController();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: productController.nameProduct,
                    obscureText: false,
                    hintText: "Introduce el nombre del producto",
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    minLines: 1,
                    onSave: (value) {
                      productController.nameProduct.text = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: productController.descriptionProduct,
                    obscureText: false,
                    hintText: "Introduce el nombre del producto",
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    minLines: 5,
                    onSave: (value) {
                      productController.descriptionProduct.text = value!;
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 40, top: 40),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[200])),
                      child: const Text(
                        "ENVIAR DATOS",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () async {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
