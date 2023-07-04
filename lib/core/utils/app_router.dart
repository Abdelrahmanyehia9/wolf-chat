import 'package:go_router/go_router.dart';


import '../../features/auth/presentation/login/view/login_view.dart';
import '../../features/auth/presentation/signup/view/sign_up_view.dart';
import '../../features/chat/presentation/view/chat_view.dart';
import '../../features/home/presentation/view/home_view.dart';


class AppRouter {
  static String logIn= "/loginView" ;
  static String signUp = '/SignupView' ;
  static String home = "/HomeView";
  static String chat = "chatView" ;
  static final routes = GoRouter(
      routes: [
    GoRoute(path: home, builder: (context, state) => const HomeView()) ,
        GoRoute(path: "/", builder: (context, state) => const ChatView()),
        GoRoute(path: signUp, builder: (context, state) => const SignUPView()),
        GoRoute(path: home, builder: (context, state) => const HomeView())




      ]);
}
