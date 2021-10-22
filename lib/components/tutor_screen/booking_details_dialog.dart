import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/box_editor.dart';
import 'package:lettutor/components/box_info.dart';
import 'package:lettutor/components/dialog_title.dart';
import 'package:lettutor/components/row_info.dart';
import 'package:lettutor/styles/consts.dart';

class BookingDetailsDialog extends StatefulWidget {
  const BookingDetailsDialog({Key? key}) : super(key: key);

  @override
  _BookingDetailsDialogState createState() => _BookingDetailsDialogState();
}

class _BookingDetailsDialogState extends State<BookingDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        onTap: hideKeyboard,
        child: Column(
          children: [
            DialogTitle(title: 'Booking'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(PaddingValue.large),
                child: Column(
                  children: [
                    BoxInfo(
                      title: 'Booking Time',
                      content: '10:00-10:25\nThu 21 Oct 2021',
                    ),
                    SizedBox(
                      height: PaddingValue.large,
                    ),
                    Container(
                      padding: EdgeInsets.all(PaddingValue.large),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(CornerRadiusValue.medium),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      child: Column(
                        children: [
                          RowInfo(
                            title: 'Balance',
                            content: '10',
                          ),
                          SizedBox(
                            height: SpacingValue.large,
                          ),
                          RowInfo(
                            title: 'Price',
                            content: '2',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SpacingValue.large,
                    ),
                    BoxEditor(
                      title: 'Notes',
                      hintText: 'Notes',
                      textFieldHeight: 150,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(PaddingValue.large),
              child: BarButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                height: 40,
                child: Text('Book'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void hideKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
