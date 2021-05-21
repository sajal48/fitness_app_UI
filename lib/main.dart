import 'package:fitness_app/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fitness_app/constants.dart';

import 'bottom_navbar.dart';
import 'itemcards.dart';
import 'meditate_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: PBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: PTextColor),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xfff5ceb8),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image:
                        AssetImage("assets/images/undraw_pilates_gpdb.png"))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                          color: Color(0xfff2bea1), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text("Good Morning",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w900)),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        ListCard(
                          title: "Diet List",
                          svgsrc: "assets/icons/Hamburger.svg",
                          itempress: () {},
                        ),
                        ListCard(
                          title: "Exercise",
                          svgsrc: "assets/icons/Excrecises.svg",
                          itempress: () {},
                        ),
                        ListCard(
                          title: "Meditatioin",
                          svgsrc: "assets/icons/Meditation.svg",
                          itempress: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MeditateScreen();
                            }));
                          },
                        ),
                        ListCard(
                          title: "Yoga",
                          svgsrc: "assets/icons/yoga.svg",
                          itempress: () {},
                        ),
                        ListCard(
                          title: "Diet LIst",
                          svgsrc: "assets/icons/Hamburger.svg",
                          itempress: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
