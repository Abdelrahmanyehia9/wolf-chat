import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/core/utils/dimention.dart';

import 'chat_bubble.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (context, index) => const ChatBubble(),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.attach_file, color: Colors.white),
            SizedBox(
              width: dimWidth(context) * 0.7,
              child: TextFormField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.2)),
                    hintText: "message",
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 0.2, color: Colors.grey))),
              ),
            ),
            CircleAvatar(
              backgroundColor: mainColor,
              child: const Icon(
                Icons.send,
                color: Colors.white,
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
