import 'package:flutter/material.dart';

import 'package:untitled/constant.dart';

class ToggleAuthButton extends StatelessWidget {
  const ToggleAuthButton(
      {Key? key, required this.text1, required this.text2, this.onPress})
      : super(key: key);
  final String text1;
  final String text2;
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontFamily: gilroy,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
            onTap: onPress,
            child: Text(
              text2,
              style:
                  TextStyle(fontFamily: gilroy, color: mainColor, fontSize: 14),
            )),
      ],
    );
  }
}
