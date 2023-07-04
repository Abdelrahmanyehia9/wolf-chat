import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Messages",
            style: TextStyle(
                fontFamily: "myfont", fontSize: 28, color: Colors.grey),
          ),
          SizedBox(
              height: 24,
              child: Image.asset(
                "assets/icons/Filter.png",
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }
}
