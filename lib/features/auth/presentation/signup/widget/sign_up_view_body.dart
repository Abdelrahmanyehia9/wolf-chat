import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/core/utils/app_router.dart';
import 'package:untitled/core/utils/dimention.dart';
import 'package:untitled/core/widget/custom_text_formfiield.dart';
import 'package:untitled/features/auth/presentation/manger/auth_states.dart';

import '../../login/widgets/custom_buttom.dart';
import '../../login/widgets/toggle_auth_button.dart';
import '../../manger/auth_cubit.dart';

class SignUpViewBody extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isLoading = false;

  SignUpViewBody({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          isLoading = false;
          GoRouter.of(context).push(AppRouter.home);
        } else if (state is AuthFailure) {
          isLoading = false;
          Fluttertoast.showToast(msg: state.error);
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                SizedBox(
                  height: dimHeight(context) * 0.05,
                ), // image
                SizedBox(
                  width: double.infinity,
                  height: dimHeight(context) * 0.28,
                  child: Image.asset("assets/images/wolf.gif"),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hint: "Username",
                  iconData: Icons.person,
                  controller: _usernameController,
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
                CustomTextField(
                    hint: " Confirm Password",
                    controller: _cPasswordController),

                CustomButton(
                  text: "Sign up",
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      if (_passwordController.text ==
                          _cPasswordController.text) {
                        BlocProvider.of<AuthCubit>(context)
                            .signUpUsingEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Password doesn't Match ",
                            backgroundColor: Colors.red);
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                ToggleAuthButton(
                  text1: "Have Account already ! ",
                  text2: "Login ",
                  onPress: () {
                    GoRouter.of(context).push(AppRouter.logIn);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
