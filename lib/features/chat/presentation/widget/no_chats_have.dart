import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/utils/dimention.dart';

class NoChatsYouHave extends StatelessWidget {
  const NoChatsYouHave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 150, height: dimHeight(context)*0.25,
        child: Lottie.asset("assets/images/hello.json",fit: BoxFit.cover) , ) ;
  }
}
