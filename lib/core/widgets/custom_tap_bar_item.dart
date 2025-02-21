import 'package:flutter/material.dart';

import '../theme/color_palette.dart';

class CustomTapBarItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Color border;

  const CustomTapBarItem(
      {super.key,
      required this.text,
      required this.icon,
      required this.isSelected,
      this.border = ColorPalette.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? ColorPalette.white : ColorPalette.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.5, color: border)),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? ColorPalette.primaryColor : ColorPalette.white,
          ),
          Text(
            text,
            style: TextStyle(
                color: isSelected
                    ? ColorPalette.primaryColor
                    : ColorPalette.white),
          )
        ],
      ),
    );
  }
}
