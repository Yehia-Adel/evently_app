import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/center.dart';
import 'package:evently_app/core/extensions/padding.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/utils/firebase_services.dart';
import 'package:evently_app/core/widgets/custom_text_feild.dart';
import 'package:evently_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailControler = TextEditingController();
  final _PasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
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
                    return "please inter your Email";
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
                  .setVerticalPadding(context, 0.02)
                  .setHorizontalPadding(context, 0.04),
              CustomTextField(
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please inter your Password";
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      navigatorKey.currentState!
                          .pushNamed(PagesRoutesNames.forgetPassword);
                    },
                    child: Text(
                      "Forger Password?",
                      style: TextStyle(
                          color: ColorPalette.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.primaryColor),
                    )),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseServices.login(
                              email: _emailControler.text,
                              password: _PasswordControler.text)
                          .then((value) {
                        if (value) {
                          EasyLoading.dismiss();
                          navigatorKey.currentState!.pushNamedAndRemoveUntil(
                              PagesRoutesNames.layout, (route) => false);
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
                    "Login",
                    style: TextStyle(
                        color: ColorPalette.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                      .setHorizontalPadding(context, 0.3)
                      .setVerticalPadding(context, 0.015)),
              Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                        text: "Don’t Have Account ? ",
                        style: theme.textTheme.titleSmall),
                    WidgetSpan(
                        child: GestureDetector(
                      onTap: () {
                        navigatorKey.currentState!
                            .pushNamed(PagesRoutesNames.signUp);
                      },
                      child: Text(
                        "Create Account",
                        style: theme.textTheme.titleSmall?.copyWith(
                            color: ColorPalette.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorPalette.primaryColor),
                      ),
                    ))
                  ])).setVerticalPadding(context, 0.01),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    indent: 30,
                    endIndent: 20,
                    thickness: .8,
                    color: ColorPalette.primaryColor,
                  )),
                  Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    indent: 20,
                    endIndent: 30,
                    thickness: .8,
                    color: ColorPalette.primaryColor,
                  ))
                ],
              ).setVerticalPadding(context, 0.01),
              ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                  color: ColorPalette.primaryColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.googleIcon,
                            width: 20,
                          ),
                          Text(
                            " Login With Google",
                            style: TextStyle(
                                color: ColorPalette.primaryColor, fontSize: 20),
                          )
                        ],
                      ).setVerticalPadding(context, 0.015))
                  .setHorizontalPadding(context, 0.06)
            ],
          ).setCenter(),
        ),
      ),
    );
  }
}
