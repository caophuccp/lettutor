import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lettutor/components/avatar.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/styles/consts.dart';

class TutorMessageScreen extends StatefulWidget {
  const TutorMessageScreen({Key? key}) : super(key: key);

  @override
  _TutorMessageScreenState createState() => _TutorMessageScreenState();
}

class _TutorMessageScreenState extends State<TutorMessageScreen> {
  final userAvatar =
      'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg';
  final message =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam';
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        child: Column(
          children: [
            NavigationBackButton(
              title: 'April Corpuz',
            ),
            Expanded(
              child: GestureDetector(
                onTap: hideKeyboard,
                child: ListView.separated(
                  reverse: true,
                  padding: EdgeInsets.all(PaddingValue.large),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) => _messageWidget(index),
                  separatorBuilder: (_, index) => SizedBox(
                    height: PaddingValue.extraLarge,
                  ),
                  itemCount: 3,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingValue.extraLarge,
                vertical: PaddingValue.large,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).cardTheme.shadowColor ??
                        Colors.transparent,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          CornerRadiusValue.medium,
                        ),
                      ),
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(
                            PaddingValue.large,
                          ),
                          hintText: 'Message',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          Icons.send_rounded,
                          color: Colors.blue,
                          size: 32,
                        ),
                        onPressed: sendMessage,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageWidget(int index) {
    return random.nextBool()
        ? _leadingMessageWidget(index)
        : _trailingMessageWidget(index);
  }

  Widget _leadingMessageWidget(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        UserAvatar(
          imageUrl: userAvatar,
          size: 32,
        ),
        SizedBox(
          width: SpacingValue.medium,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
            ),
            padding: EdgeInsets.all(PaddingValue.large),
            child: Text(
              message,
            ),
          ),
        ),
        Container(
          width: 64,
        ),
      ],
    );
  }

  Widget _trailingMessageWidget(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 64,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
            ),
            padding: EdgeInsets.all(PaddingValue.large),
            child: Text(
              message,
            ),
          ),
        ),
        SizedBox(
          width: SpacingValue.medium,
        ),
        UserAvatar(
          imageUrl: userAvatar,
          size: 32,
        ),
      ],
    );
  }

  void dismiss() {
    Navigator.of(context).pop();
  }

  void hideKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void sendMessage(){
    print('tutor_message_screen.dart - sendMessage');
  }
}
