import 'package:flutter/material.dart';

import 'package:fitness_app/constants.dart';
import 'package:fitness_app/searchbar.dart';
import 'package:flutter_svg/svg.dart';

class MeditateView extends StatelessWidget {
  const MeditateView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: PBlueLightColor,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.centerLeft,
                    image: AssetImage("assets/images/meditation_bg.png"))),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Daily 5 -10 Min",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * .6,
                    child: Text(
                        "Live a healthy life by doing a very small amount of meditation everday.Lead a very healty life"),
                  ),
                  SizedBox(width: size.width * .5, child: SearchBar()),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      SessionCard(
                        sessionnum: 1,
                        isDone: true,
                        sessionitempress: () {},
                      ),
                      SessionCard(
                        sessionnum: 2,
                        isDone: false,
                        sessionitempress: () {},
                      ),
                      SessionCard(
                        sessionnum: 3,
                        isDone: false,
                        sessionitempress: () {},
                      ),
                      SessionCard(
                        sessionnum: 4,
                        isDone: false,
                        sessionitempress: () {},
                      ),
                      SessionCard(
                        sessionnum: 5,
                        isDone: false,
                        sessionitempress: () {},
                      ),
                      SessionCard(
                        sessionnum: 6,
                        isDone: false,
                        sessionitempress: () {},
                      ),
                      SessionCard(
                        sessionnum: 7,
                        isDone: false,
                        sessionitempress: () {},
                      ),
                      SessionCard(
                        sessionnum: 8,
                        isDone: false,
                        sessionitempress: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 23,
                                spreadRadius: -13,
                                color: PShadowColor),
                          ]),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              "assets/icons/Meditation_women_small.svg"),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Basic 1",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text("Start practice here")
                            ],
                          )),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  const SessionCard({
    Key? key,
    required this.sessionnum,
    this.isDone = false,
    required this.sessionitempress,
  }) : super(key: key);

  final bool isDone;
  final Function sessionitempress;
  final int sessionnum;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: PShadowColor)
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                sessionitempress();
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                          color: isDone ? PBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: PBlueColor)),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : PBlueColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Session $sessionnum ",
                        style: Theme.of(context).textTheme.subtitle2!)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
