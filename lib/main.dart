import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/utils/app_router.dart';
import 'package:untitled/features/auth/presentation/manger/auth_cubit.dart';

import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

runApp(const Mego()) ;
}


class Mego extends StatelessWidget {
  const Mego({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit())
      ],
      child: MaterialApp.router(
debugShowCheckedModeBanner: false,
routerConfig: AppRouter.routes,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black
        ),


      ),
    );
  }
}
