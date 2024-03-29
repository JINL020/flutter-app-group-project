import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:hci_m3_app/maps_page/google_maps_page.dart';

import 'package:hci_m3_app/home_page/home_page.dart';
import 'package:hci_m3_app/info_page/info_page.dart';
import 'package:hci_m3_app/settings_page/settings_page.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

// when a BottomNavigationBarItem is taped _currentIndex is set
//to the respective index and the body is updated to the corresponding screen
class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  var _screens = [HomePage(), GoogleMapsPage(), InfoPage(), SettingsPage()];
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    final backToHome = Provider.of<AlarmSettings>(context).backToHome;
    final toggleBackHome = Provider.of<AlarmSettings>(context).toogleBackToHome;
    final primaryColor =
        isAlarm ? AppColors.backgroundRed : AppColors.backgroundBlue;
    if (backToHome) {
      setState(() {
        _selectedIndex = 0;
      });
      _pageController.jumpToPage(_selectedIndex);
      toggleBackHome();
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          AppColors.backgroundGradient,
          PageView(
            controller: _pageController,
            children: _screens,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 8.0,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.4),
        items: bottomNavigationItems,
        onTap: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
          _pageController.jumpToPage(newIndex);
        },
      ),
    );
  }
}

// here are the BottomNavigationBarItems
var bottomNavigationItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_rounded),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.map_rounded),
    label: "Maps",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.info_rounded),
    label: "Info",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: "Einstellungen",
  )
];
