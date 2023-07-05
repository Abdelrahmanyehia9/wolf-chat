
import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/core/utils/dimention.dart';
import 'package:untitled/features/chat/data/model/message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.messageModel,}) : super(key: key);
final MessageModel messageModel ;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/wood.jpg"),
          radius: 24,
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                  gradient: myGradient),
              child:  Text(
                messageModel.text ,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatBubble2 extends StatelessWidget {
  const ChatBubble2({Key? key, required this.messageModel}) : super(key: key);
final MessageModel messageModel ;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: dimWidth(context)*0.6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade800),
              child:  Text(
                messageModel.text,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(messageModel.time.toDate().toLocal().toString().substring(10,16) , style: TextStyle(fontSize: 10),)
        ],
      ),
    );
  }
}
