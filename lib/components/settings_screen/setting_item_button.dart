import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class SettingItemButton extends StatelessWidget {
  const SettingItemButton({
    Key? key,
    required this.title,
    this.icon,
    this.onTap,
    this.margin = const EdgeInsets.only(top: PaddingValue.large),
  }) : super(key: key);

  final IconData? icon;
  final String title;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        border: Border.all(
          color: Theme.of(context).cardTheme.shadowColor ?? Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
        boxShadow: [
          BoxShadow(
            color:
                Theme.of(context).cardTheme.shadowColor ?? Colors.transparent,
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
        color: Theme.of(context).cardTheme.color,
        child: InkWell(
          borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(PaddingValue.large),
            child: Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 20,
                  ),
                SizedBox(
                  width: PaddingValue.medium,
                ),
                Text(
                  title,
                  style: TextStyles.subtitle1SemiBold,
                ),
                Spacer(),
                Icon(
                  Icons.chevron_right,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
