import 'package:flutter/material.dart';

import '../../../core/theme/color_palette.dart';

class CustomCreateEventTaps extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;


  const CustomCreateEventTaps({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? ColorPalette.primaryColor : ColorPalette.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1.5,
              color: ColorPalette.primaryColor
          )
      ),
      child: Row(
        children: [
          Icon(icon,
              color: isSelected ? ColorPalette.white : ColorPalette
                  .primaryColor),
          Text(text, style: TextStyle(
              color: isSelected ? ColorPalette.white : ColorPalette.primaryColor
          ),)
        ],
      ),
    );
  }
}
