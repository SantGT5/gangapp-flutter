import 'package:flutter/material.dart';
import 'package:gangapp_flutter/models/message_model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  TextEditingController msgController = TextEditingController();
  Rx<String> message = "".obs;
  Rx<List<MessageModel>> messagesList = Rx<List<MessageModel>>([]);
  List<MessageModel> get messages => messagesList.value.obs;

  getMessages(String value) => message.value = value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
