import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

enum navitem { today, exercise, settrings }

final navitemProvider = StateProvider((ref) => navitem.settrings);

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
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
              isActive: watch(navitemProvider).state == navitem.today,
              navitempress: () {
                context.read(navitemProvider).state = navitem.today;
              }),
          NavBarItem(
            title: "All Exercise",
            svgsrc: "assets/icons/gym.svg",
            navitempress: () {
              context.read(navitemProvider).state = navitem.exercise;
            },
            isActive: watch(navitemProvider).state == navitem.exercise,
          ),
          NavBarItem(
            title: "Settings",
            svgsrc: "assets/icons/Settings.svg",
            navitempress: () {
              context.read(navitemProvider).state = navitem.settrings;
            },
            isActive: watch(navitemProvider).state == navitem.settrings,
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
      onTap: () {
        navitempress();
      },
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
