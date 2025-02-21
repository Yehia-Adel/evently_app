import 'package:flutter/cupertino.dart';

extension BorderOnWidget on Widget {

  Widget setBottomBorder(BuildContext context, double width, Color color) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: width, color: color))
      ),
      child: this,
    );
  }
}


