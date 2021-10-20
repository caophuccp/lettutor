import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class BookingTimePicker extends StatelessWidget {
  const BookingTimePicker({Key? key, this.selectTime}) : super(key: key);

  final void Function(DateTime)? selectTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: PaddingValue.medium),
            child: Text(
              'Pick your time',
              style: TextStyles.h6Bold,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 40,
                  crossAxisSpacing: SpacingValue.large,
                  mainAxisSpacing: SpacingValue.large,
                ),
                itemBuilder: (_, index) => BarButton(
                  height: 40,
                  onPressed: () {
                    selectTime?.call(DateTime.now());
                  },
                  child: Text(
                    '07:00-07:25',
                  ),
                ),
                itemCount: 20,
                // children: List.generate(
                //   5,
                //   (index) => BarButton(
                //     height: 40,
                //     onPressed: () {
                //       selectTime?.call(DateTime.now());
                //     },
                //     child: Text(
                //       '07:00-07:25',
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
