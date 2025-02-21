import 'package:evently_app/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool borderRadius;
  final bool bgColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onTap,
    this.borderRadius = true,
    this.bgColor = true,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ? ColorPalette.primaryColor : ColorPalette
                .white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ? 16 : 0)
            )
        ),
        onPressed: onTap,
        child: Text(text, style: theme.textTheme.bodyLarge!.copyWith(
            color: ColorPalette.white,
            fontWeight: FontWeight.w500
        ),));
  }
}
