import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class AuthScreenTextField extends StatelessWidget {
  const AuthScreenTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: SpacingValue.medium,
        children: [
          if (labelText != null)
            Text(
              labelText ?? '',
              style: TextStyles.subtitle1SemiBold,
            ),
          TextFormField(
            obscureText: obscureText,
            autocorrect: false,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16, 16, 0, 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                  width: 1,
                ),
              ),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
