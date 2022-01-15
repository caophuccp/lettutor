import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/api/auth_apis.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/auth_screen_app_bar.dart';
import 'package:lettutor/components/auth_screen_text_field.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/extensions/validator.dart';
import 'package:lettutor/styles/button_styles.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      SizedBox(height: SpacingValue.extraLarge),
                      if (isLoading)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: CupertinoActivityIndicator(),
                          ),
                        ),
                      BarButton(
                        child: Text('Register'),
                        onPressed: isLoading ? null : signUp,
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
                            'Already have an account?',
                            style: TextStyles.subtitle2Regular,
                          ),
                          TextButton(
                            onPressed: signIn,
                            child: Text('Sign in'),
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
    print('sign_up_screen.dart - signInWithApple');
  }

  void signInWithGoogle() {
    print('sign_up_screen.dart - signInWithGoogle');
  }

  void signInWithFacebook() {
    print('sign_up_screen.dart - signInWithFacebook');
  }

  void signIn() {
    Navigator.of(context).pop();
  }

  void forgotPassword() {
    print('sign_up_screen.dart - forgotPassword');
  }

  void signUp() async {
    final email = emailController.text;
    final password = passwordController.text;
    final validateEmail = Validator.emailValidator(email) ??
        Validator.passwordValidator(password);
    if (validateEmail != null) {
      showSnackBarError(validateEmail);
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      final errorMessage = await AuthAPIs.register(email, password);
      if (errorMessage == null) {
        showSnackBarInfo('Sign up successful');
        Navigator.of(context).pop({
          'email': email,
          'password': password,
        });
        return;
      } else {
        showSnackBarError(errorMessage);
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
}
