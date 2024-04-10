import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixel_dat_test_app/auth/bloc/auth_bloc.dart';
import 'package:pixel_dat_test_app/auth/bloc/auth_event.dart';
import 'package:pixel_dat_test_app/auth/widgets/custom_divider.dart';
import 'package:pixel_dat_test_app/auth/widgets/new_outlined_button.dart';
import 'package:pixel_dat_test_app/utils/app_filled_button.dart';
import 'package:pixel_dat_test_app/utils/app_text_button.dart';
import 'package:pixel_dat_test_app/utils/app_text_field.dart';
import 'package:pixel_dat_test_app/utils/buttons.dart';
import 'package:pixel_dat_test_app/utils/config/colour_config.dart';
import 'package:pixel_dat_test_app/utils/config/text_config.dart';
import 'package:pixel_dat_test_app/utils/const.dart';
import 'package:pixel_dat_test_app/utils/outlined_button.dart';
import 'package:pixel_dat_test_app/utils/strings.dart';
import 'package:pixel_dat_test_app/utils/text_field.dart';
import 'package:pixel_dat_test_app/utils/theme.dart';
import 'package:pixel_dat_test_app/utils/validator.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SignUpScreen(),
    );
  }

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final dogBloc = BlocProvider.of<AuthBloc>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: h,
                width: w,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 54,
                      ),
                      Text(
                        kCreateAccount,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: appColors.textColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Please fill in the following information so',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // color: appColors.grey
                              )),
                      const SizedBox(height: 5),
                      Text(
                        'we can get to know you better',
                        textAlign: TextAlign.center,
                        // style: baseTheme.textTheme.bodyMedium!.copyWith(color: appColors.grey),
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            AppTextField(
                              controller: _firstNameController,
                              title: 'First Name',
                              labelText: 'First Name',
                              validator: Validator.nonEmptyField,
                            ),

                            const SizedBox(height: 24),

                            AppTextField(
                              controller: _lastNameController,
                              title: 'Last Name',
                              labelText: 'Last Name',
                              validator: Validator.nonEmptyField,
                            ),
                            const SizedBox(height: 24),

                            AppTextField(
                              controller: _emailController,
                              title: 'Email Address',
                              labelText: 'Email Address',
                              validator: Validator.emailValidator,
                            ),

                            const SizedBox(height: 24),
                            AppTextField(
                              controller: _passwordController,
                              title: 'Password',
                              isPassword: true,
                              labelText: 'Password',
                              validator: Validator.password,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15, // Specify the width
                                  height: 15,
                                  child: GestureDetector(
                                    onTap: () => Container(
                                      // color: appColors.transparent,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 13.0),
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            // color: appColors.grey,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            // color: appColors.white,
                                            // : appColors.grey,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "I agree to Monthly's ",
                                        style: TextStyle(
                                          // color: appColors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Privacy policy ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            // color: appColors.green,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      TextSpan(
                                        text: 'and ',
                                        style: TextStyle(
                                          // color: appColors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Terms',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            // color: appColors.green,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 42),

                            // submit button
                            AppFilledButton(
                              buttonText: kCreateAccount,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  String fullName =
                                      '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';
                                  BlocProvider.of<AuthBloc>(context).add(
                                    SignUpUser(
                                      name: fullName,
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                            ),

                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/login'),
                              child: const Text(
                                  'Already have an account? $kLogin'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



  // void registerUser() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );

  //   await Auth.registerNewUser(
  //     firstNameController: _firstNameController,
  //     lastNameController: _lastNameController,
  //     emailController: _emailController,
  //     phoneNumberController: _phoneNumberController,
  //     addressController: _addressController,
  //     passwordController: _passwordController,
  //     context: context,
  //   );
  //   // ignore: use_build_context_synchronously
  //   await Database.createUser(
  //     firstName: _firstNameController.text.trim(),
  //     lastName: _lastNameController.text.trim(),
  //     email: _emailController.text.trim(),
  //     phoneNumber: _phoneNumberController.text.trim(),
  //     address: _addressController.text.trim(),
  //     context: context,
  //   );

  //   if (context.mounted) {
  //     Navigator.pop(context);
  //     Navigator.pop(context);
  //   }
  // }
