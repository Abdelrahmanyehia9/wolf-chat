import 'package:flutter/material.dart';

import '../widget/sign_up_view_body.dart';

class SignUPView extends StatelessWidget {
  const SignUPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpViewBody(),
    );
  }
}
