import 'package:evently_app/core/extensions/center.dart';
import 'package:evently_app/core/extensions/padding.dart';
import 'package:evently_app/core/extensions/validations.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_palette.dart';
import '../../core/utils/firebase_services.dart';
import '../../core/widgets/custom_text_feild.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameControler = TextEditingController();
  final _emailControler = TextEditingController();
  final _PasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppAssets.logo),
              width: 140,
            ),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please inter your name";
                }
                return null;
              },
              controller: _nameControler,
              hint: "Name",
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.personIcon),
                color: ColorPalette.generalGreyColor,
              ),
            )
                .setVerticalPadding(context, 0.01)
                .setHorizontalPadding(context, 0.04),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please inter your Email";
                }
                if (!Validations.validateEmail(value)) {
                  return "please inter your valid email";
                }
                return null;
              },
              controller: _emailControler,
              hint: "Email",
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.emailIcon),
                color: ColorPalette.generalGreyColor,
              ),
            )
                .setVerticalPadding(context, 0.01)
                .setHorizontalPadding(context, 0.04),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please inter your password";
                }
                if (!Validations.validatePassword(value)) {
                  return "please inter your valid Password";
                }
                return null;
              },
              controller: _PasswordControler,
              isPassword: true,
              maxLines: 1,
              hint: "Password",
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.passwordIcon,
                ),
                color: ColorPalette.generalGreyColor,
              ),
            )
                .setVerticalPadding(context, 0.01)
                .setHorizontalPadding(context, 0.04),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please inter your password";
                }
                if (value != _PasswordControler.text) {
                  return "re password not match";
                }
                return null;
              },
              isPassword: true,
              maxLines: 1,
              hint: "Re Password",
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.passwordIcon,
                ),
                color: ColorPalette.generalGreyColor,
              ),
            )
                .setVerticalPadding(context, 0.01)
                .setHorizontalPadding(context, 0.04),
            ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseServices.createAccount(
                                emailAddress: _emailControler.text,
                                password: _PasswordControler.text)
                            .then((value) {
                          EasyLoading.dismiss();
                          if (value == true) {
                            navigatorKey.currentState!.pushNamedAndRemoveUntil(
                                PagesRoutesNames.signIn, (route) => false);
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        // elevation: 0,
                        backgroundColor: ColorPalette.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: ColorPalette.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                        .setHorizontalPadding(context, 0.2)
                        .setVerticalPadding(context, 0.015))
                .setVerticalPadding(context, 0.01),
            Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                      text: "Already Have Account ? ",
                      style: TextStyle(color: ColorPalette.black)),
                  WidgetSpan(
                      child: GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: ColorPalette.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.primaryColor),
                    ),
                  ))
                ])),
          ],
        ).setCenter(),
      ),
    );
  }
}
