import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/core/utils/dimention.dart';
import 'package:untitled/features/chat/data/model/message_model.dart';
import 'package:untitled/features/chat/presentation/widget/error_loading_chats.dart';
import 'package:untitled/features/chat/presentation/widget/no_chats_have.dart';

import 'chat_bubble.dart';

class ChatViewBody extends StatefulWidget {
  ChatViewBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final pController = ScrollController();
  CollectionReference message = FirebaseFirestore.instance.collection("chats");
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    pController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: message.orderBy(createdTime, descending: true).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MessageModel> messageList = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  messageList
                      .add(MessageModel.fromJson(snapshot.data!.docs[i]));
                }
                return Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: pController,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      if (snapshot.data!.docs[index].get("sender") ==
                          FirebaseAuth.instance.currentUser!.email) {
                        return ChatBubble2(
                          messageModel: messageList[index],
                        );
                      } else {
                        return ChatBubble(
                          messageModel: messageList[index],
                        );
                      }
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                );
              }
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.attach_file, color: Colors.white),
            SizedBox(
              width: dimWidth(context) * 0.7,
              child: TextFormField(
                controller: _messageController,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.2)),
                    hintText: "message",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.2, color: Colors.grey))),
              ),
            ),
            InkWell(
              onTap: () {
                message.add({
                  "text": _messageController.text,
                  "time": DateTime.now(),
                  "sender": FirebaseAuth.instance.currentUser!.email
                });
                _messageController.clear();
                pController.position.animateTo(
                  0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              },
              child: CircleAvatar(
                backgroundColor: mainColor,
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
