import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/features/chat/presentation/widget/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey.shade100,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: mainColor),
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: const Text("isabel"),
        actions: [
          const Icon(Icons.camera_alt),
          const SizedBox(
            width: 14,
          ),
          const Icon(Icons.call),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            onSelected: (value) {
              // your logic
            },
            itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  child: Text("remove chat"),
                ),
                PopupMenuItem(
                  child: Text("search"),
                ),
                PopupMenuItem(
                  child: Text("Add Friend"),
                ),
                PopupMenuItem(
                  child: Text("Block"),
                )
              ];
            },
          )
        ],
      ),
      body: const ChatViewBody(),
    );
  }
}

