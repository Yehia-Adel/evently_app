import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppAssets.onboardingTop,
          ),
          Expanded(child: SizedBox()),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorPalette.primaryColor,
                  )),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: ColorPalette.primaryColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
