import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_dat_test_app/auth/bloc/auth_bloc.dart';
import 'package:pixel_dat_test_app/auth/screens/sign_up_screen.dart';
import 'package:pixel_dat_test_app/auth/screens/splash_screen.dart';
import 'package:pixel_dat_test_app/config/app_config.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarBrightness:
    //       !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarDividerColor: Colors.transparent,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // ));
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
          fontFamily: "SF-Pro",
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        // navigatorKey: AppRouter.router.navigatorKey,
        initialRoute: SplashScreen.routeName,
        home: BlocProvider(
          create: (context) => AuthBloc(),
          // child: const SignUpScreen(),
        ),
      ),
    );
  }
}
