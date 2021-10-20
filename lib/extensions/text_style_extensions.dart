
import 'package:flutter/material.dart';

extension TextStyleFontWeightCopy on TextStyle {
  TextStyle bold(){
    return this.copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle semiBold(){
    return this.copyWith(fontWeight: FontWeight.w600);
  }
}

extension StatefulWidgetGetTextTheme on State<StatefulWidget> {
  TextTheme textTheme(){
    return Theme.of(context).textTheme;
  }
}

extension StatelessWidgetGetTextTheme on StatelessWidget {
  TextTheme textTheme(BuildContext context){
    return Theme.of(context).textTheme;
  }
}