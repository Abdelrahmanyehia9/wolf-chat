import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/core/utils/dimention.dart';
import 'package:untitled/features/auth/presentation/login/view/login_view.dart';
import 'package:untitled/features/chat/presentation/view/chat_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() { super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
final bool? logIn = pre.getBool(isLogin);
print(logIn);
    Future.delayed(const Duration(seconds: 3), ()  {
      if (
      logIn ?? false) {
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>ChatView()), (route) => false)  ;
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginView()), (route) => false)  ;
      }
    });
  });
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
            Text("Wolf Chat" ,style: GoogleFonts.romanesco(fontSize: 72), ) ,
          ],)
            ,SizedBox(height: dimHeight(context)*0.3,
                child: Lottie.asset("assets/images/loading.json")) ,

        ],),
      ),
    );
  }
}
