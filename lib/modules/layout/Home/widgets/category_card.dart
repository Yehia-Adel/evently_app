import 'package:evently_app/core/extensions/padding.dart';
import 'package:evently_app/core/extensions/size.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color_palette.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      alignment: Alignment.topLeft,
      height: 0.25.height,
      width: 0.9.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image:
        AssetImage("assets/images/category/Book Club.png"), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                Text("21",
                  style: theme.textTheme.titleLarge!.copyWith(
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold
                  ),),
                Text("Nov", style: theme.textTheme.titleMedium!.copyWith(
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.bold))
              ],
            ).setHorizontalPadding(context, 0.015),
          ).setVerticalPadding(context, 0.01).setHorizontalPadding(
              context, 0.02),
          Spacer(),
          Container(
            height: 35,
            width: 1.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorPalette.white
            ),
            child: Row(
              children: [
                Text("This is a Birthday Party ", style:
                theme.textTheme.titleSmall!.copyWith(
                    color: ColorPalette.black,
                    fontWeight: FontWeight.bold
                ),).setHorizontalPadding(context, 0.02),
                Spacer(),
                Icon(Icons.favorite, color: ColorPalette.primaryColor,)
                    .setHorizontalPadding(context, 0.01)
              ],
            ),
          ).setHorizontalPadding(context, 0.02).setVerticalPadding(
              context, 0.02)
        ],
      ),


    ).setHorizontalPadding(context, 0.03).setVerticalPadding(context, 0.01)
    ;
  }
}
