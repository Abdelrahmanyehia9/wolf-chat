import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/core/utils/dimention.dart';

class CurrentlyActive extends StatelessWidget {
  const CurrentlyActive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: dimWidth(context) * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), gradient: myGradient),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Recently Active",
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: gilroy,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 5,
              backgroundColor: green,
            )
          ],
        ),
      ),
    );
  }
}

class RecentChatContainer extends StatelessWidget {
  const RecentChatContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: dimWidth(context) * 0.27,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), gradient: myGradient),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "recent",
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: gilroy,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.watch_later,
              size: 12,
            )
          ],
        ),
      ),
    );
  }
}

class ImgContainers extends StatelessWidget {
  const ImgContainers({
    Key? key,
    required this.mName,
  }) : super(key: key);
  final String? mName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: SizedBox(
                height: dimHeight(context) * 0.12,
                width: dimWidth(context) * 0.2,
                child: Image.asset(
                  "assets/images/wood.jpg",
                  fit: BoxFit.fill,
                )),
          ),
          Text(
              textAlign: TextAlign.center,
              mName ?? "user",
              style: const TextStyle(
                  fontFamily: gilroy,
                  fontSize: 14,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
