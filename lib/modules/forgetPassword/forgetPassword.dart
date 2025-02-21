import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/padding.dart';
import 'package:flutter/material.dart';

import '../../core/theme/color_palette.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Column(
        children: [
          Image(image: AssetImage(AppAssets.forgetPassword)),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  // elevation: 0,
                  backgroundColor: ColorPalette.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              child: Text(
                "Reset Password",
                style: TextStyle(
                    color: ColorPalette.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
                  .setHorizontalPadding(context, 0.2)
                  .setVerticalPadding(context, 0.015)),
        ],
      ),
    );
  }
}
