import 'package:flutter/material.dart';
import 'package:lettutor/components/auth_screen_text_field.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              NavigationBackButton(title: 'Sign in',),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: PaddingValue.extraLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: PaddingValue.extraLarge),
                      Text(
                        'Fogot password',
                        style: TextStyles.h5Bold,
                      ),
                      SizedBox(height: PaddingValue.medium),
                      Text(
                        'Enter your email address to search for your account.',
                        style: TextStyles.subtitle1Regular.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: PaddingValue.extraLarge),
                      AuthScreenTextField(
                        labelText: 'Email',
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      Spacer(),
                      BarButton(
                        height: 52,
                        onPressed: resetPassword,
                        child: Text('Continue'),
                      ),
                      SizedBox(height: PaddingValue.extraLarge),
                      SizedBox(height: PaddingValue.extraLarge),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void resetPassword(){
    print('forgot_password_screen.dart - resetPassword - ${emailController.text}');
  }
}
