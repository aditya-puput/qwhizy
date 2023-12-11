import 'package:flutter/material.dart';
import 'package:mdaq/common/enum/home_bottom_bar_state.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/utils/transition_shift.dart';
import 'package:mdaq/common/utils/transtition_fade.dart';
import 'package:mdaq/views/home/battle.dart';
import 'package:mdaq/views/home/home.dart';
import 'package:mdaq/views/home/leaderboard.dart';

class HomeBottomBar extends StatefulWidget {
  final HomeBottomBarState state;
  const HomeBottomBar({super.key, required this.state});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F6FB),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: darkMode
              ? [
                  const Color(0xFF122447),
                  const Color(0xFF040E31),
                ]
              : [
                  const Color(0xFF3CEAC1),
                  const Color(0xFF00C0DA),
                ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 1,
            ),
            GestureDetector(
              onTap: () {
                if (widget.state == HomeBottomBarState.leaderboard) {
                  Navigator.of(context)
                      .pushReplacement(TransitionFade(child: const Home()));
                }
              },
              child: Image.asset(
                'assets/icons/home${widget.state == HomeBottomBarState.home ? darkMode ? '-dark-active' : '-light-active' : ''}.png',
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                      TransitionShift(child: const Battle()));
              },
              child: Image.asset(
                'assets/icons/battle.png',
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.state == HomeBottomBarState.home) {
                  Navigator.of(context).pushReplacement(
                      TransitionFade(child: const Leaderboard()));
                }
              },
              child: Image.asset(
                'assets/icons/stats${widget.state == HomeBottomBarState.leaderboard ? darkMode ? '-dark-active' : '-light-active' : ''}.png',
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            )
          ]),
    );
  }
}
