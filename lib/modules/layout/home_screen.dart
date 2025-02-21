import 'package:evently_app/core/extensions/padding.dart';
import 'package:evently_app/core/extensions/size.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/widgets/custom_tap_bar_item.dart';
import 'package:evently_app/modules/layout/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              height: 0.23.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                color: ColorPalette.primaryColor,
              ),
              child: DefaultTabController(
                length: 6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome back",
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: ColorPalette.white,
                              ),
                            ),
                            Text("Yehia Adel",
                                style: theme.textTheme.titleLarge!.copyWith(
                                    color: ColorPalette.white,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          "assets/icons/Vector.svg",
                          width: 22,
                        ).setHorizontalPadding(context, 0.01),
                        // Container(
                        //   padding: EdgeInsets.all(2),
                        //   decoration: BoxDecoration(
                        //     color: ColorPalette.white,
                        //     borderRadius: BorderRadius.circular(5)
                        //   ),
                        //   child: Text("EN",
                        //     style: theme.textTheme.titleSmall!.copyWith(
                        //       color: ColorPalette.primaryColor,
                        //
                        //     ),),
                        // )
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0),
                                backgroundColor: ColorPalette.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              "EN",
                              style: theme.textTheme.titleMedium!.copyWith(
                                  color: ColorPalette.primaryColor,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    )
                        .setVerticalPadding(context, 0.01)
                        .setHorizontalPadding(context, 0.03),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: ColorPalette.white,
                        ).setHorizontalPadding(context, 0.03),
                        Text("cairo, Egypt",
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: ColorPalette.white,
                            ))
                      ],
                    ),
                    Expanded(
                      child: TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          indicatorColor: ColorPalette.primaryColor,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(
                                child: CustomTapBarItem(
                                    text: "yehia",
                                    icon: Icons.add_alert,
                                    isSelected: true)),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "adel",
                                  icon: Icons.add_alert,
                                  isSelected: false),
                            ),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "fares",
                                  icon: Icons.add_alert,
                                  isSelected: false),
                            ),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "fares",
                                  icon: Icons.add_alert,
                                  isSelected: false),
                            ),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "fares",
                                  icon: Icons.add_alert,
                                  isSelected: false),
                            ),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "fares",
                                  icon: Icons.add_alert,
                                  isSelected: false),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            16.spaceVertical,
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CategoryCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
