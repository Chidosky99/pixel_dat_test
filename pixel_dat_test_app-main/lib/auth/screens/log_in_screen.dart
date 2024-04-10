import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixel_dat_test_app/auth/screens/sign_up_screen.dart';
import 'package:pixel_dat_test_app/auth/widgets/custom_divider.dart';
import 'package:pixel_dat_test_app/auth/widgets/new_outlined_button.dart';
import 'package:pixel_dat_test_app/utils/app_filled_button.dart';
import 'package:pixel_dat_test_app/utils/app_text_button.dart';
import 'package:pixel_dat_test_app/utils/app_text_field.dart';
import 'package:pixel_dat_test_app/utils/buttons.dart';
import 'package:pixel_dat_test_app/utils/config/colour_config.dart';
import 'package:pixel_dat_test_app/utils/config/text_config.dart';
import 'package:pixel_dat_test_app/utils/const.dart';
import 'package:pixel_dat_test_app/utils/dimensions.dart';
import 'package:pixel_dat_test_app/utils/outlined_button.dart';
import 'package:pixel_dat_test_app/utils/strings.dart';
import 'package:pixel_dat_test_app/utils/text_field.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/utils/theme.dart';
import 'package:pixel_dat_test_app/utils/validator.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
    );
  }

  LoginScreen({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final _forgetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: h,
      width: w,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: appColors.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),

                //
                Text(
                  'Securely login to your pixel account',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: appColors.grey,
                  ),
                ),

                const SizedBox(
                  height: 42,
                ),

                // Form field

                ListView(
                  shrinkWrap: true,
                  children: [
                    const AppTextField(
                        title: 'Email address',
                        labelText: 'Email address',
                        textInputAction: TextInputAction.next,
                        // controller: provider.emailController,
                        validator: Validator.nonEmptyField),
                    const SizedBox(height: 24),
                    const AppTextField(
                      title: 'Password',
                      labelText: 'Password',
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      // controller: provider.passwordController,
                      validator: Validator.password,
                    ),

                    const SizedBox(height: 56),

                    // Proceed button
                    AppFilledButton(
                      buttonText: kProceed,
                      onPressed: () async {},
                    ),

                    const SizedBox(height: 30),

                    // Sign up button
                    Center(
                      child: AppRichTextButton(
                          highLightedText: kRegister,
                          text: kDontHaveAcct,
                          onTap: () => Navigator.pushNamed(context, '/signup')),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

  // void logUserIn() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("No user found for that email."),
  //         ),
  //       );
  //     } else if (e.code == 'wrong-password') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("Wrong password provided for that user."),
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("$e"),
  //         ),
  //       );
  //     }
  //   }
  //   if (context.mounted) {
  //     Navigator.pop(context);
  //   }
  // }
