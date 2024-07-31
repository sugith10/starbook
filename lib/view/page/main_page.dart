import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:star_book/view/color/app_color.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List bottomBarPages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];

  int index = 0;
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        kIconSize: 24.0,
        notchBottomBarController: _controller,
        textOverflow: TextOverflow.visible,
        shadowElevation: 5,
        kBottomRadius: 28.0,

        maxLine: 1,
        color: Color.fromARGB(255, 255, 255, 255),
        blurOpacity: .2,
        elevation: 5,

        notchColor: AppColor.primary,

        /// restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: 500,
        showShadow: false,
        durationInMilliSeconds: 300,

        itemLabelStyle: const TextStyle(fontSize: 10),
        showLabel: true,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              IconlyLight.home,
              color: AppColor.inActive,
            ),
            activeItem: Icon(
              IconlyLight.home,
              color: AppColor.bg,
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: Icon(IconlyLight.calendar, color: AppColor.inActive),
            activeItem: Icon(
              IconlyLight.calendar,
              color: AppColor.bg,
            ),
            itemLabel: 'Page 2',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              color: AppColor.inActive,
              IconlyLight.profile,
            ),
            activeItem: Icon(
              IconlyLight.profile,
              color: AppColor.bg,
            ),
            itemLabel: 'Page 3',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
