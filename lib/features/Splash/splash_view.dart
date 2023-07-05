import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/core/utils/dimention.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: mainColor,
      body: SplashViewBody(),

    );
  }
}
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(width: double.infinity,
        decoration: BoxDecoration(gradient: myGradient),
        child: Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Column(children: [
            SizedBox(height: dimHeight(context)*0.4,
                child: Image.asset("assets/images/m2i8K9i8d3A0K9A0.png" ,))  ,
            Text("Wolf Chat" ,style: GoogleFonts.romanesco(fontSize: 96), ) ,
          ],)
            ,SizedBox(height: dimHeight(context)*0.3,
                child: Lottie.asset("assets/images/loading.json")) ,

        ],),
      ),
    );
  }
}
