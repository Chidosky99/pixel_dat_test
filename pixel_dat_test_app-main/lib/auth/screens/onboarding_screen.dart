import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/utils/app_filled_button.dart';
import 'package:pixel_dat_test_app/utils/strings.dart';
import 'package:pixel_dat_test_app/utils/theme.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => OnboardingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              height: h,
              width: w,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: w,
                        height: h * 0.3,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                AssetImage("assets/onboarding_screen_logo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Text("Do all the transactions",
                      //     style: Theme.of(context).textTheme.headline2!.copyWith(
                      //           color: Colors.black,
                      //         )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("STAY FIT",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Colors.black,
                                  )),
                      const SizedBox(
                        height: 10,
                      ),
                      // Text("Enex",
                      //     style: Theme.of(context).textTheme.headline1!.copyWith(
                      //           color: Colors.black,
                      //         )),
                      const SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppFilledButton(
                                buttonText: kLogin,
                                height: 50,
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/login')),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: AppFilledButton(
                              buttonText: kRegister,
                              buttonColor: appColors.white,
                              textColor: appColors.purple,
                              height: 50,
                              isOutlined: true,
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                            ),
                          ),
                        ],
                      ),

                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushNamed(context, '/signup');
                      //   },
                      //   child: Container(
                      //     width: w * 0.2,
                      //     height: h * 0.08,
                      //     decoration: BoxDecoration(
                      //       color: Colors.indigo[900],
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         "Register Now",
                      //         style: Theme.of(context).textTheme.headline6!.copyWith(
                      //               color: Colors.black,
                      //             ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushNamed(context, '/login');
                      //   },
                      //   child: Container(
                      //     width: w * 0.5,
                      //     height: h * 0.08,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(30),
                      //         boxShadow: [
                      //           BoxShadow(
                      //               blurRadius: 10,
                      //               spreadRadius: 7,
                      //               offset: const Offset(1, 1),
                      //               color: Colors.green.withOpacity(0.2))
                      //         ]),
                      //     child: Center(
                      //       child: Text(
                      //         "Login Instead",
                      //         style: Theme.of(context).textTheme.headline2!.copyWith(
                      //               color: Colors.black,
                      //             ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ]),
                  )),
            )));
  }
}
