import 'package:flutter/material.dart';
import 'package:gangapp_flutter/models/message_model.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service_messages.dart';
import 'package:gangapp_flutter/ui/chat/controllers/message_controller.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessageController messageController = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "HeroTwo",
        onPressed: () {
          print(messageController.messagesList);
        },
      ),
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: messageController.messages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [],
                );
              }),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController.msgController,
                      minLines: 1,
                      maxLines: 10,
                      onChanged: messageController.getMessages,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        hintText: "Escribe tu mensaje",
                        hintStyle: TextStyle(color: Colors.black38),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      String _messageId =
                          FirestoreService("chat_messages").generateId();
                      DatabaseMessages.addMessage(
                          _messageId, messageController.message.value);
                      messageController.msgController.clear();
                    },
                    child: const Icon(
                      Icons.send,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
