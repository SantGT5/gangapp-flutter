import 'package:flutter/material.dart';
import 'package:gangapp_flutter/models/message_model.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service_messages.dart';
import 'package:get/get.dart';

List<String> roomsChats = [
  "General",
  "Sports",
  "Cinema",
  "Music",
];

class MessageController extends GetxController {
  TextEditingController msgController = TextEditingController();
  Rx<String> message = "".obs;
  Rx<int> chargeM = 0.obs;
  Rx<List<MessageModel>> messagesList = Rx<List<MessageModel>>([]);
  List<MessageModel> get messages => messagesList.value.obs;
  getMessages(String value) => message.value = value;

  @override
  void onReady() {
    messagesList.bindStream(
      DatabaseMessages().chatMessageStream(
        Get.parameters['roomId']!,
        chargeM.value,
      ),
    );

    super.onReady();
  }

  @override
  void onClose() {
    msgController.dispose();
    super.onClose();
  }
}
