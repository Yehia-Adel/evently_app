import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/main.dart';
import 'package:evently_app/modules/layout/Home/home_screen.dart';
import 'package:evently_app/modules/layout/favorites_screen.dart';
import 'package:evently_app/modules/layout/map_screen.dart';
import 'package:evently_app/modules/layout/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int selectedIndex = 0;

  List<Widget> tap = [
    const HomeScreen(),
    const MapScreen(),
    const SizedBox(),
    const FavoritesView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigatorKey.currentState!.pushNamed(PagesRoutesNames.createEvent);
        },
        shape:
            CircleBorder(side: BorderSide(color: ColorPalette.white, width: 5)),
        backgroundColor: ColorPalette.primaryColor,
        child: Icon(
          Icons.add,
          color: ColorPalette.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onBottonmNavTapped,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorPalette.primaryColor,
          selectedItemColor: ColorPalette.white,
          unselectedItemColor: ColorPalette.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                activeIcon: Icon(Icons.location_on),
                label: "Map"),
            BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                activeIcon: Icon(Icons.favorite),
                label: "Likes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: "Profile"),
          ]),
      body: tap[selectedIndex],
    );
  }

  _onBottonmNavTapped(int index) {
    selectedIndex = index;
    setState(() {});
  }
}
