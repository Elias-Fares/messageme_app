import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:message_me/controller/chatscreen_controller.dart';
import 'package:message_me/core/appcolors.dart';

class MessageModel extends StatelessWidget {
  final int index;
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  final ChatController controller;
  const MessageModel({
    super.key,
    required this.snapshot,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    List<QueryDocumentSnapshot<Object?>> reversedSnapshot =
        snapshot.data!.docs.reversed.toList();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: reversedSnapshot[index].get('sender') ==
                controller.signedInUser.email
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            reversedSnapshot[index].get('sender'),
            style: TextStyle(color: AppColors.yellow),
          ),
          SizedBox(
            height: 4,
          ),
          Material(
              color: reversedSnapshot[index].get('sender') ==
                      controller.signedInUser.email
                  ? AppColors.transparentDarkBlue
                  : AppColors.orangeMessage,
              borderRadius: BorderRadius.only(
                topLeft: snapshot.data!.docs.reversed
                            .toList()[index]
                            .get('sender') ==
                        controller.signedInUser.email
                    ? Radius.circular(5)
                    : Radius.circular(20),
                topRight: snapshot.data!.docs.reversed
                            .toList()[index]
                            .get('sender') ==
                        controller.signedInUser.email
                    ? Radius.circular(20)
                    : Radius.circular(5),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13),
                child: Text(
                  reversedSnapshot[index].get('text'),
                  style: TextStyle(fontSize: 17, color: AppColors.white),
                ),
              )),
        ],
      ),
    );
  }
}
