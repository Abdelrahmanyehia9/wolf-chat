import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/features/chat/presentation/widget/chat_view_body.dart';

import '../../../../core/utils/helper.dart';
class ChatView extends StatelessWidget {
   ChatView({Key? key}) : super(key: key);

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

              return  [
                PopupMenuItem(
                  onTap: (){
                    deleteChat() ;
                  },
                  child: const Text("remove chat"),
                ),
                const PopupMenuItem(
                  child: Text("search"),
                ),
                const PopupMenuItem(
                  child: Text("Add Friend"),
                ),
                const PopupMenuItem(
                  child: Text("Block"),
                )
              ];
            },
          )
        ],
      ),
      body:  ChatViewBody(),
    );
  }
}

