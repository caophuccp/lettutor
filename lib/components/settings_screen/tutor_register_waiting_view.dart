import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorRegisterWaitingView extends StatelessWidget {
  const TutorRegisterWaitingView({
    Key? key,
    this.back,

  }) : super(key: key);
  final void Function()? back;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: PaddingValue.extraLarge),
          child: NavigationBackButton(
            title: 'Settings',
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.speaker_outlined,
                  size: 60,
                ),
                SizedBox(
                  height: SpacingValue.large,
                ),
                Text(
                  'You have done all the steps\nPlease, wait for the operator\'s approval',
                  style: TextStyles.subtitle1SemiBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SpacingValue.large,
                ),
                Container(
                  padding: EdgeInsets.all(PaddingValue.extraLarge),
                  child: BarButton(
                    height: 40,
                    onPressed: back,
                    child: Text('Back'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
