import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/box_editor.dart';
import 'package:lettutor/components/dialog_title.dart';
import 'package:lettutor/components/tutor_review_card.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorReportDialog extends StatefulWidget {
  TutorReportDialog({Key? key}) : super(key: key);

  @override
  _TutorReportDialogState createState() => _TutorReportDialogState();
}

class _TutorReportDialogState extends State<TutorReportDialog> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 440,
        child: Column(
          children: [
            DialogTitle(title: 'Report'),
            CheckboxListTile(
              title: Text(
                'This tutor is annoying me',
                style: TextStyles.subtitle2Regular,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkboxValue1,
              onChanged: setCheckboxValue1,
            ),
            CheckboxListTile(
              title: Text(
                'This profile is pretending be someone or is fake',
                style: TextStyles.subtitle2Regular,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkboxValue2,
              onChanged: setCheckboxValue2,
            ),
            CheckboxListTile(
              title: Text(
                'Inappropriate profile photo',
                style: TextStyles.subtitle2Regular,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkboxValue3,
              onChanged: setCheckboxValue3,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: BoxEditor(
                hintText: 'Please let us know details about your problem',
                textFieldHeight: 150,
              ),
            ),
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: BarButton(
                      height: 40,
                      child: Text('Cancel'),
                      onPressed: cancel,
                      style: BarButtonStyle.secondary,
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    flex: 1,
                    child: BarButton(
                      height: 40,
                      child: Text('Submit'),
                      onPressed: submit,
                      style: BarButtonStyle.primary,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void cancel(){
    Navigator.of(context).pop();
  }

  void submit(){
    Navigator.of(context).pop();
  }

  void setCheckboxValue1(bool? newValue) {
    if (newValue != null) {
      setState(() {
        checkboxValue1 = newValue;
      });
    }
  }

  void setCheckboxValue2(bool? newValue) {
    if (newValue != null) {
      setState(() {
        checkboxValue2 = newValue;
      });
    }
  }

  void setCheckboxValue3(bool? newValue) {
    if (newValue != null) {
      setState(() {
        checkboxValue3 = newValue;
      });
    }
  }
}

// class ReportCheckbox extends StatelessWidget {
//   const ReportCheckbox({
//     Key? key,
//   }) : super(key: key);

//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Checkbox(
//           value: false,
//           onChanged: (_) {},
//         ),
//         Text(
//           'Report',
//           style: TextStyles.subtitle1Regular,
//         ),
//       ],
//     );
//   }
// }
