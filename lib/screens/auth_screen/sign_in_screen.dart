import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/api/auth_apis.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/auth_screen_app_bar.dart';
import 'package:lettutor/components/auth_screen_text_field.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/screens/auth_screen/forgot_password_screen.dart';
import 'package:lettutor/screens/auth_screen/sign_up_screen.dart';
import 'package:lettutor/screens/main_tab.dart';
import 'package:lettutor/styles/button_styles.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AuthScreenAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(PaddingValue.extraLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthScreenTextField(
                        labelText: 'Email',
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      SizedBox(height: SpacingValue.large),
                      AuthScreenTextField(
                        labelText: 'Password',
                        hintText: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: SpacingValue.small),
                      TextButton(
                        onPressed: forgotPassword,
                        child: Text('Forgot password?'),
                        style: ButtonStyles.textButtonStyle(),
                      ),
                      BarButton(
                        child: Text('Sign in'),
                        onPressed: signIn,
                        height: 48,
                        cornerRadius: CornerRadiusValue.medium,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: PaddingValue.extraLarge),
                        alignment: Alignment.center,
                        child: Text(
                          'OR CONTINUE WITH',
                          style: TextStyles.subtitle2Regular,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BarButton(
                            onPressed: signInWithGoogle,
                            cornerRadius: CornerRadiusValue.medium,
                            style: BarButtonStyle.secondary,
                            child: Image.asset(
                              'assets/images/sign_in/google_logo.png',
                              width: 50,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          BarButton(
                            onPressed: signInWithFacebook,
                            cornerRadius: CornerRadiusValue.medium,
                            style: BarButtonStyle.secondary,
                            child: Image.asset(
                              'assets/images/sign_in/facebook_logo.png',
                              width: 50,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          if (Platform.isIOS)
                            BarButton(
                              onPressed: signInWithApple,
                              cornerRadius: CornerRadiusValue.medium,
                              style: BarButtonStyle.secondary,
                              child: Image.asset(
                                'assets/images/sign_in/apple_white_logo.png',
                                width: 50,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: SpacingValue.large),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account yet?',
                            style: TextStyles.subtitle2Regular,
                          ),
                          TextButton(
                            onPressed: signUp,
                            child: Text('Register now'),
                            style: ButtonStyles.textButtonStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void signInWithApple() {
    print('sign_in_screen.dart - signInWithApple');
  }

  void signInWithGoogle() {
    print('sign_in_screen.dart - signInWithGoogle');
  }

  void signInWithFacebook() {
    print('sign_in_screen.dart - signInWithFacebook');
  }

  void signIn() async {
    final email = emailController.text;
    final password = passwordController.text;
    if (email.isEmpty) {
      showSnackBarError('Email must not be empty');
    } else if (password.isEmpty) {
      showSnackBarError('Password must not be empty');
    }
    setState(() {
      isLoading = true;
    });
    try {
      final response = await AuthAPIs.login(email, password);
      if (response.message != null) {
        showSnackBarError(response.message ?? '');
      } else {
        pushReplacementWithoutAnimation(MainTab());
      }
    } catch (e, s) {
      showSnackBarError(e.toString());
      print(e);
      print(s);
    }
    setState(() {
      isLoading = false;
    });
  }

  void forgotPassword() {
    navigate(ForgotPasswordScreen());
  }

  void signUp() async {
    final registerInfo = await navigate(SignUpScreen());
    if (registerInfo != null) {
      emailController.text = registerInfo['email'] ?? '';
      passwordController.text = registerInfo['password'] ?? '';
    }
  }
}
