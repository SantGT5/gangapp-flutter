import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gangapp_flutter/models/message_model.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service.dart';
import 'package:gangapp_flutter/ui/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class DatabaseMessages {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String _collection = "chat_messages";
  static FirestoreService _service = FirestoreService(_collection);

  static addMessage(String id, String text, String roomId) {
    _service.set(id, {
      "id": id,
      "from": Get.find<AuthController>().firestoreUser.value!.uid,
      "roomId": roomId,
      "text": text,
      "sendAt": 1,
      "timestamp": FieldValue.serverTimestamp(),
      "content": Get.find<AuthController>().firestoreUser.value!.name
    });
  }

  Stream<List<MessageModel>> chatMessageStream(String roomId, int index) {
    return _firestore
        .collection(_collection)
        .where("roomId", isEqualTo: roomId)
        .orderBy("timestamp", descending: true)
        .limitToLast(1 + index)
        .snapshots()
        .map((QuerySnapshot query) {
      List<MessageModel> retVal = [];
      query.docs.forEach((element) {
        retVal
            .add(MessageModel.fromJson(element.data() as Map<String, dynamic>));
      });
      return retVal;
    });
  }
}
