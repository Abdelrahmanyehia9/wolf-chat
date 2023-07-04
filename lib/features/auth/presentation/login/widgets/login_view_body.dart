import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/core/utils/app_router.dart';
import 'package:untitled/core/utils/dimention.dart';
import 'package:untitled/core/widget/custom_text_formfiield.dart';
import 'package:untitled/features/auth/presentation/manger/auth_cubit.dart';
import 'package:untitled/features/auth/presentation/manger/auth_states.dart';
import 'custom_buttom.dart';
import 'toggle_auth_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({Key? key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (BuildContext context, state) {
        if (state is AuthSuccess) {
          isLoading = false;
          GoRouter.of(context).push(AppRouter.home);
        } else if (state is AuthFailure) {
          isLoading = false;
          Fluttertoast.showToast(
              msg: state.error.toString(), backgroundColor: Colors.red);
        } else {
          isLoading = true;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: mainColor,
        ),
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                SizedBox(
                  height: dimHeight(context) * 0.1,
                ), // image
                SizedBox(
                  width: double.infinity,
                  height: dimHeight(context) * 0.3,
                  child: Image.asset(
                    "assets/images/wolf.gif",
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hint: "email",
                  iconData: Icons.email,
                  controller: _emailController,
                ),
                CustomTextField(
                    hint: "Password",
                    iconData: Icons.lock,
                    controller: _passwordController),
                const SizedBox(
                  height: 18,
                ),

                CustomButton(
                  text: "Log in",
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .loginByEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text);
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ToggleAuthButton(
                    text1: "Don't Have an Account ? ",
                    text2: "Sign up  ",
                    onPress: () {
                      GoRouter.of(context).push(AppRouter.signUp);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
