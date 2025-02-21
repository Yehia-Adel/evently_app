import 'package:evently_app/core/extensions/padding.dart';
import 'package:evently_app/core/extensions/size.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/widgets/custom_text_feild.dart';
import 'package:evently_app/modules/createEvent/widgets/custom_create_event_taps.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorPalette.primaryColor),
          title: Text("Create event", style:
          theme.textTheme.titleLarge!.copyWith(
              color: ColorPalette.primaryColor
          ),),
        ),
        body: DefaultTabController(
          length: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              5.spaceVertical,
              Container(
                height: 0.20.height,
                width: 0.9.width,
                decoration: BoxDecoration(
                    image: DecorationImage(image:
                    AssetImage("assets/images/category/Book Club.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15)),
              ).setHorizontalPadding(context, 0.01
              ).setVerticalPadding(context, 0.01).setHorizontalPadding(
                  context, 0.03),
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
                              text: "text",
                              icon: Icons.add_alert,
                              isSelected: true)
                      ),
                      Tab(
                          child: CustomCreateEventTaps(
                              text: "text",
                              icon: Icons.add_alert,
                              isSelected: false)
                      ),
                      Tab(
                          child: CustomCreateEventTaps(
                              text: "text",
                              icon: Icons.add_alert,
                              isSelected: false)
                      ),
                      Tab(
                          child: CustomCreateEventTaps(
                              text: "text",
                              icon: Icons.add_alert,
                              isSelected: false)
                      ),
                      Tab(
                          child: CustomCreateEventTaps(
                              text: "text",
                              icon: Icons.add_alert,
                              isSelected: false)
                      ),
                      Tab(
                          child: CustomCreateEventTaps(
                              text: "text",
                              icon: Icons.add_alert,
                              isSelected: false)
                      ),
                    ]
                ),
              ),
              5.spaceVertical,

              Text("Title", style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500
              ),).setHorizontalPadding(context, 0.04),
              CustomTextField(
                prefixIcon: Icon(
                  Icons.create, color: ColorPalette.generalGreyColor,),
                hint: "Event Title",
                hintColor: ColorPalette.generalGreyColor,
              ).setHorizontalPadding(context, 0.03).setVerticalPadding(
                  context, 0.01),
              Text("Description", style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500
              ),).setHorizontalPadding(context, 0.04),
              CustomTextField(
                maxLines: 3,
                hint: "Event Description",
                hintColor: ColorPalette.generalGreyColor,
              ).setHorizontalPadding(context, 0.03),
              Row(
                children: [
                  Icon(Icons.date_range, color: ColorPalette.black,),
                  Text(
                    "Event Date", style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500
                  ),),
                  Spacer(),
                  TextButton(onPressed: () {},
                    child: Text("Choose Date",
                      style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.primaryColor
                      ),),)

                ],
              ).setHorizontalPadding(context, 0.03),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined, color: ColorPalette.black,),
                  Text(
                    "Event Time", style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500
                  ),),
                  Spacer(),
                  TextButton(onPressed: () {},
                    child: Text("Choose Time",
                      style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.primaryColor
                      ),),)

                ],
              ).setHorizontalPadding(context, 0.03),
              ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      backgroundColor: ColorPalette.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: ColorPalette.primaryColor)
                      )
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/Frame 78.png", height: 40,),
                      5.spaceHorizontal,
                      Text("Choose Event Location",
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.primaryColor,
                        ),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,
                        color: ColorPalette.primaryColor,)

                    ],
                  )).setHorizontalPadding(context, 0.03),
              ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  child:
                  Text("Add Event", style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: ColorPalette.white
                  ),)).setHorizontalPadding(context, 0.03).setVerticalPadding(
                  context, 0.02)


            ],
          ),
        ),
      ),
    );
  }
}
