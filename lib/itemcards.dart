import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

class ListCard extends StatelessWidget {
  final String svgsrc;
  final String title;
  final Function itempress;
  const ListCard({
    Key? key,
    required this.svgsrc,
    required this.title,
    required this.itempress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -23,
                  color: PShadowColor),
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              itempress();
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset(svgsrc),
                  Spacer(),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 15))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
