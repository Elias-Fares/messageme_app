import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_me/controller/chatscreen_controller.dart';
import 'package:message_me/core/appcolors.dart';
import 'package:message_me/view/chat_screen/widgets/message_model.dart';
import 'package:message_me/view/chat_screen/widgets/send_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 25),
            SizedBox(width: 10),
            Text('MessageMe')
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: controller.getStream(),
              builder: (context, snapshot) {
                
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.darkBlue,
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data != null ? snapshot.data!.size : 0,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return snapshot.data != null
                          ? MessageModel(
                              snapshot: snapshot,
                              index: index,
                              controller: controller,
                            )
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                );
              },
            ),
            GetBuilder<ChatController>(builder: (context) {
              return SendMessage(
                controller: controller.message,
                onPressed: () {
                  controller.send();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
