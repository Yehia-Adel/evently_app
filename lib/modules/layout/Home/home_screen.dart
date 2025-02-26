import 'package:evently_app/core/extensions/padding.dart';
import 'package:evently_app/core/extensions/size.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/widgets/custom_tap_bar_item.dart';
import 'package:evently_app/modules/layout/Home/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/category_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTapIndex = 0;
  List<EventCategory> eventCategories = [
    EventCategory(
      eventCategoryName: "Book Club",
      eventCategoryIcon: Icons.menu_book_outlined,
      eventCategoryImg: "assets/images/book_club_img.png",
    ),
    EventCategory(
        eventCategoryName: "Sport",
        eventCategoryIcon: Icons.directions_bike,
        eventCategoryImg: "assets/images/sport_img.png"),
    EventCategory(
        eventCategoryName: "BirthDay",
        eventCategoryIcon: Icons.cake_outlined,
        eventCategoryImg: "assets/images/birthday_img.png"),
    EventCategory(
        eventCategoryName: "Meeting",
        eventCategoryIcon: Icons.meeting_room_outlined,
        eventCategoryImg: "assets/images/meeting_img.png"),
    EventCategory(
        eventCategoryName: "Holiday",
        eventCategoryIcon: Icons.holiday_village_outlined,
        eventCategoryImg: "assets/images/holiday_img.png"),
  ];
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
                length: 5,
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
                                    text: "Book Club",
                                    icon: Icons.menu_book_outlined,
                                    isSelected: true)),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "Sport",
                                  icon: Icons.directions_bike,
                                  isSelected: false),
                            ),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "BirthDay",
                                  icon: Icons.cake_outlined,
                                  isSelected: false),
                            ),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "Meeting",
                                  icon: Icons.meeting_room_outlined,
                                  isSelected: false),
                            ),
                            Tab(
                              child: CustomTapBarItem(
                                  text: "Holiday",
                                  icon: Icons.holiday_village_outlined,
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
