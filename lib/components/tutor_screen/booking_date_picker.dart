import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class BookingDatePicker extends StatelessWidget {
  const BookingDatePicker({
    Key? key,
    this.selectDate
  }) : super(key: key);

  final void Function(DateTime)? selectDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: PaddingValue.medium),
            child: Text(
              'Pick your date',
              style: TextStyles.h6Bold,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(PaddingValue.extraLarge),
              child: Wrap(
                runSpacing: PaddingValue.medium,
                children: List.generate(
                  5,
                  (index) => BarButton(
                    height: 40,
                    onPressed: () {selectDate?.call(DateTime.now());},
                    child: Text(
                      '22/10/2021',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
