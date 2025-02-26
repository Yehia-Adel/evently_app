import 'package:evently_app/core/extensions/padding.dart';
import 'package:evently_app/core/extensions/size.dart';
import 'package:evently_app/core/services/snack_bar_services.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/utils/firebase_services.dart';
import 'package:evently_app/core/widgets/custom_text_feild.dart';
import 'package:evently_app/main.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/modules/createEvent/widgets/custom_create_event_taps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../models/category_data.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  int selectedTap = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  List<EventCategory> eventCategories = [
    EventCategory(
      eventCategoryName: "Book Club",
      eventCategoryIcon: Icons.menu_book_outlined,
      eventCategoryImg: "assets/images/category/Book Club.png",
    ),
    EventCategory(
        eventCategoryName: "Sport",
        eventCategoryIcon: Icons.directions_bike,
        eventCategoryImg: "assets/images/category/Book Club-7.png"),
    EventCategory(
        eventCategoryName: "BirthDay",
        eventCategoryIcon: Icons.cake_outlined,
        eventCategoryImg: "assets/images/category/Book Club-6.png"),
    EventCategory(
        eventCategoryName: "Meeting",
        eventCategoryIcon: Icons.meeting_room_outlined,
        eventCategoryImg: "assets/images/category/Book Club-5.png"),
    EventCategory(
        eventCategoryName: "Holiday",
        eventCategoryIcon: Icons.holiday_village_outlined,
        eventCategoryImg: "assets/images/category/Book Club-3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: ColorPalette.primaryColor),
            title: Text(
              "Create event",
              style: theme.textTheme.titleLarge!
                  .copyWith(color: ColorPalette.primaryColor),
            ),
          ),
          body: DefaultTabController(
            length: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                5.spaceVertical,
                Container(
                  height: 0.20.height,
                  width: 0.9.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/category/Book Club.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                )
                    .setHorizontalPadding(context, 0.01)
                    .setVerticalPadding(context, 0.01)
                    .setHorizontalPadding(context, 0.03),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(15),
                //     child: Image.asset("assets/images/category/Book Club.png",
                //     height: 0.22.height,
                //     width: 0.9.width,fit: BoxFit.cover,)
                // ),
                SizedBox(
                  height: 0.05.height,
                  child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                            child: CustomCreateEventTaps(
                                text: "Book Club",
                                icon: Icons.menu_book_outlined,
                                isSelected: true)),
                        Tab(
                          child: CustomCreateEventTaps(
                              text: "Sport",
                              icon: Icons.directions_bike,
                              isSelected: false),
                        ),
                        Tab(
                            child: CustomCreateEventTaps(
                                text: "BirthDay",
                                icon: Icons.directions_bike,
                                isSelected: false)),
                        Tab(
                            child: CustomCreateEventTaps(
                                text: "Meeting",
                                icon: Icons.meeting_room_outlined,
                                isSelected: false)),
                        Tab(
                            child: CustomCreateEventTaps(
                                text: "Holiday",
                                icon: Icons.holiday_village_outlined,
                                isSelected: false)),
                      ]),
                ),
                5.spaceVertical,

                Text(
                  "Title",
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ).setHorizontalPadding(context, 0.04),
                CustomTextField(
                  controller: _titleController,
                  prefixIcon: Icon(
                    Icons.create,
                    color: ColorPalette.generalGreyColor,
                  ),
                  hint: "Event Title",
                  hintColor: ColorPalette.generalGreyColor,
                )
                    .setHorizontalPadding(context, 0.03)
                    .setVerticalPadding(context, 0.01),
                Text(
                  "Description",
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ).setHorizontalPadding(context, 0.04),
                CustomTextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  hint: "Event Description",
                  hintColor: ColorPalette.generalGreyColor,
                ).setHorizontalPadding(context, 0.03),
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: ColorPalette.black,
                    ),
                    Text(
                      "Event Date",
                      style: theme.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Choose Date",
                        style: theme.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.primaryColor),
                      ),
                    )
                  ],
                ).setHorizontalPadding(context, 0.03),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: ColorPalette.black,
                    ),
                    Text(
                      "Event Time",
                      style: theme.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Choose Time",
                        style: theme.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.primaryColor),
                      ),
                    )
                  ],
                ).setHorizontalPadding(context, 0.03),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        backgroundColor: ColorPalette.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side:
                                BorderSide(color: ColorPalette.primaryColor))),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Frame 78.png",
                          height: 40,
                        ),
                        5.spaceHorizontal,
                        Text(
                          "Choose Event Location",
                          style: theme.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPalette.primaryColor,
                        )
                      ],
                    )).setHorizontalPadding(context, 0.03),
                ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (selectedDate != null) {
                              EventDataModel data = EventDataModel(
                                  eventTitle: _titleController.text,
                                  eventDescription: _descriptionController.text,
                                  eventCategory: eventCategories[selectedTap]
                                      .eventCategoryName,
                                  eventImage: eventCategories[selectedTap]
                                      .eventCategoryImg,
                                  eventDate: selectedDate ?? DateTime.now(),
                                  eventTime: selectedTime!);
                              EasyLoading.show();

                              FirebaseServices.createNewEvent(data)
                                  .then((value) {
                                EasyLoading.dismiss();
                                if (value) {
                                  navigatorKey.currentState!.pop();
                                  SnackBarService.showSuccessMessage(
                                      "Event was successfully created");
                                } else {
                                  SnackBarService.showErrorMessage(
                                      "you must select event date");
                                }
                              });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPalette.primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "Add Event",
                          style: theme.textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.white),
                        ))
                    .setHorizontalPadding(context, 0.03)
                    .setVerticalPadding(context, 0.02)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectEventDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
      print(selectedDate);
    }
  }

  void selectEventTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
      print(selectedTime);
    }
  }
}
