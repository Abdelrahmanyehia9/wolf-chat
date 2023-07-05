import 'package:go_router/go_router.dart';
import 'package:untitled/features/Splash/splash_view.dart';


import '../../features/auth/presentation/login/view/login_view.dart';
import '../../features/auth/presentation/signup/view/sign_up_view.dart';
import '../../features/chat/presentation/view/chat_view.dart';


class AppRouter {
  static String logIn= "/loginView" ;
  static String signUp = '/SignupView' ;
  static String chat = "/chatView" ;
  static final routes = GoRouter(
      routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashView()) ,
        GoRoute(path: chat , builder: (context, state) =>  ChatView()),
        GoRoute(path: signUp, builder: (context, state) => const SignUPView()),




      ]);
}
