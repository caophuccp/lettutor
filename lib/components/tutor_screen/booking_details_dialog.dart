import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/box_editor.dart';
import 'package:lettutor/components/box_info.dart';
import 'package:lettutor/components/dialog_title.dart';
import 'package:lettutor/components/row_info.dart';
import 'package:lettutor/config/global.dart';
import 'package:lettutor/models/schedule/schedule.dart';
import 'package:lettutor/styles/consts.dart';

class BookingDetailsDialog extends StatefulWidget {
  const BookingDetailsDialog({
    Key? key,
    required this.schedule,
    required this.price,
  }) : super(key: key);

  final Schedule schedule;
  final int price;

  @override
  _BookingDetailsDialogState createState() => _BookingDetailsDialogState();
}

class _BookingDetailsDialogState extends State<BookingDetailsDialog> {
  final DateFormat dateFormat = DateFormat('EEE dd MMM yyyy');

  Schedule get schedule {
    return widget.schedule;
  }

  String get bookingTime {
    final date = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp));
    final start = schedule.startTime;
    final end = schedule.endTime;
    return '$start-$end\n$date';
  }

  String note = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        onTap: hideKeyboard,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogTitle(title: 'Booking'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(PaddingValue.large),
                child: Column(
                  children: [
                    BoxInfo(
                      title: 'Booking Time',
                      content: bookingTime,
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
                            content: Global.user?.walletInfo?.amount ?? '',
                          ),
                          SizedBox(
                            height: SpacingValue.large,
                          ),
                          RowInfo(
                            title: 'Price',
                            content: widget.price.toString(),
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
                      onChanged: (value){
                        note = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(PaddingValue.large),
              child: BarButton(
                onPressed: () {
                  Navigator.of(context).pop(note);
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
