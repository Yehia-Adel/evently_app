import 'package:flutter/cupertino.dart';

extension PaddingOnWidget on Widget {
  Widget setHorizontalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: enableMediaQuery ? mediaQuery.size.width * value : value),
      child: this,
    );
  }

  Widget setVerticalPadding(BuildContext context, value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: enableMediaQuery ? mediaQuery.size.height * value : value),
      child: this,
    );
  }

  Widget setAllPadding(BuildContext context, value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding:
          EdgeInsets.all(enableMediaQuery ? mediaQuery.size * value : value),
      child: this,
    );
  }
}
