import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gangapp_flutter/models/product_model.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service.dart';

class DataBaseProducts {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String _collection = "products";
  static FirestoreService _service = FirestoreService(_collection);

  Future<bool> createNewProduct(ProductModel product) async {
    try {
      product.uid = _service.generateId();
      await _firestore.collection(_collection).doc(product.uid).set({
        "uid": product.uid,
        "name": product.name,
        "description": product.description,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// GENERATE ID
  String generateIdProduct() {
    return FirebaseFirestore.instance.collection(_collection).doc().id;
  }
}
