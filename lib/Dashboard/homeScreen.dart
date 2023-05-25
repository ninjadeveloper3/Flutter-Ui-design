import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_uidesign/Dashboard/Screens/blank.dart';
import 'package:flutter_uidesign/Dashboard/Screens/home.dart';
import 'package:flutter_uidesign/Dashboard/Screens/projects.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../helper/fontSize/appfontSize.dart';
import '../resource/colors.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  late PersistentTabController controllerPersistent;
  PageController? pageController;
  var rxIndex = 0;

  Future<bool> onWillPop(context) async {
    return true;
  }

  @override
  void initState() {
    controllerPersistent = PersistentTabController(initialIndex: 0);
    controllerPersistent.addListener(() {
      rxIndex = controllerPersistent.index;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controllerPersistent,
      screens: _buildScreens(),
      items: _navBarsItems(rxIndex, context),
      navBarHeight: AppDynamic.dynamicSize(context, 50),
      padding: const NavBarPadding.all(0),

      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
      onItemSelected: (int index) {
        if (index == 3) {
          rxIndex = 0;
          setState(() {});
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Projects()),
          );
        }
      },
      // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const home(),
    const blank(),
    const blank(),
    const home(),
    const blank(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems(
    int index, BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      contentPadding: 0,
      activeColorPrimary: Col.primaryColor,
      activeColorSecondary: Col.primaryColor,

      // title: ("Home".tr()),
      inactiveColorPrimary: Col.grey,

      icon: SvgPicture.asset(
        'assets/svgBottomNav/dashboard.svg',
        color: index == 0 ? Col.primaryColor : Col.grey,
        height: 25,
      ),
    ),
    PersistentBottomNavBarItem(
      contentPadding: 0,
      activeColorPrimary: Col.primaryColor,
      icon: SvgPicture.asset(
        'assets/svgBottomNav/arrow.svg',
        color: index == 1 ? Col.primaryColor : Col.grey,
        height: 25,
      ),
      // title: ("Order History".tr()),
      inactiveColorPrimary: Col.black,
      activeColorSecondary: Col.primaryColor,
    ),
    PersistentBottomNavBarItem(
      contentPadding: 0,
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      //
      // title: ("Notifications".tr()),
      activeColorPrimary: Col.primaryColor,
      inactiveColorPrimary: Col.black,
      activeColorSecondary: Col.primaryColor,
    ),
    PersistentBottomNavBarItem(
      contentPadding: 0,
      icon: SvgPicture.asset(
        'assets/svgBottomNav/report.svg',
        height: 25,
        color: index == 3 ? Col.primaryColor : Col.grey,
      ),
      // title: ("Settings".tr()),
      activeColorPrimary: Col.primaryColor,
      activeColorSecondary: Col.primaryColor,
      inactiveColorPrimary: Col.black,
    ),
    PersistentBottomNavBarItem(
      contentPadding: 0,

      icon: SvgPicture.asset(
        'assets/svgBottomNav/profile.svg',
        height: 25,
        color: index == 4 ? Col.primaryColor : Col.grey,
      ),
      // ),
      // title: ("Settings".tr()),
      activeColorPrimary: Col.primaryColor,
      activeColorSecondary: Col.primaryColor,
      inactiveColorPrimary: Col.grey,
    ),
  ];
}
