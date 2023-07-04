import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: const Color(0xff222222),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey, width: .5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage("assets/images/wood.jpg"),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "alexander",
                      style: TextStyle(fontFamily: gilroy, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "hey whats up",
                      style: TextStyle(fontFamily: gilroy, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text("4 mins",
                    style: TextStyle(
                      fontFamily: gilroy,
                      fontSize: 14,
                      color: mainColor,
                    )),
                const SizedBox(
                  height: 4,
                ),
                CircleAvatar(
                  radius: 13,
                  backgroundColor: mainColor,
                  child: const Text(
                    "1",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
