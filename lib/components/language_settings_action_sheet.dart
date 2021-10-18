
import 'package:flutter/cupertino.dart';
import 'package:lettutor/styles/text_styles.dart';

enum Language {
  vietnamese,
  english
}

class LanguageSettingsActionSheet extends StatelessWidget {
  const LanguageSettingsActionSheet({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final void Function(Language)? onChanged;
  
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Language', style: TextStyles.subtitle1Regular),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          child: const Text('Vietnamese'),
          onPressed: () {
            onChanged?.call(Language.vietnamese);
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('English'),
          onPressed: () {
            onChanged?.call(Language.english);
            Navigator.pop(context);
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    );
  }
}