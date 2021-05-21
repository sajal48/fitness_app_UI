import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarItem(
            title: "Today",
            svgsrc: "assets/icons/calendar.svg",
            navitempress: () {},
          ),
          NavBarItem(
            title: "All Exercise",
            svgsrc: "assets/icons/gym.svg",
            navitempress: () {},
            isActive: true,
          ),
          NavBarItem(
            title: "Settings",
            svgsrc: "assets/icons/Settings.svg",
            navitempress: () {},
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String svgsrc;
  final String title;
  final Function navitempress;
  final bool isActive;
  const NavBarItem({
    Key? key,
    required this.svgsrc,
    required this.title,
    required this.navitempress,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navitempress(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgsrc,
            color: isActive ? PActiceIconColor : PTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? PActiceIconColor : PTextColor),
          )
        ],
      ),
    );
  }
}
