import 'package:flutter/material.dart';
import 'package:lettutor/components/avatar.dart';

class UserAvatarEdit extends StatelessWidget {
  const UserAvatarEdit({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(1.2, 1),
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color:  Theme.of(context).cardTheme.shadowColor ??
                        Colors.transparent,
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: UserAvatar(
            size: 80,
            imageUrl: avatar,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Icon(
                Icons.camera,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
