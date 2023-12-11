import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mdaq/common/data/battle.dart';
import 'package:mdaq/common/http/battle.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/utils/transtition_fade.dart';
import 'package:mdaq/views/battle/battle_found.dart';

class BattleSearch extends StatefulWidget {
  final Battle battle;
  const BattleSearch({super.key, required this.battle});

  @override
  State<BattleSearch> createState() => _BattleSearchState();
}

class _BattleSearchState extends State<BattleSearch> {
  double currentPosition = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      setState(() {
        currentPosition = (currentPosition + 1) % 4;
      });
    });

    final randomMilliseconds =
        1000 + (DateTime.now().millisecondsSinceEpoch % 14000);
    final randomDuration = Duration(milliseconds: randomMilliseconds);

    Future.delayed(randomDuration, () {
      if (mounted) {
        loadBattle(widget.battle.id);
        Navigator.of(context).pushReplacement(TransitionFade(
            child: BattleFound(
          battle: widget.battle,
        )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFD4E1F2),
            gradient: darkMode
                ? const LinearGradient(
                    colors: [
                      Color(0xFF0F2C48),
                      Color(0xFF122447),
                      Color(0xFF040E31),
                      Color(0xFF071336)
                    ],
                    stops: [0.0, 0.25, 0.75, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 65),
                child: Column(
                  children: [
                    Text('Battle Hafidz',
                        style: AppFontStyle.boldText.copyWith(
                            color: darkMode ? Colors.white : Colors.black,
                            fontSize: 30,
                            height: .1)),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/map.png",
                                  ),
                                  Image.asset(
                                    "assets/images/search.png",
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              Center(
                                child: Text('Mencari lawan...',
                                    style: AppFontStyle.boldText.copyWith(
                                        color: darkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 24,
                                        height: .4)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DotsIndicator(
                                dotsCount: 4,
                                position: currentPosition,
                                decorator: const DotsDecorator(
                                    color: Colors.transparent, // Inactive color
                                    activeColor: Colors.white,
                                    size: Size.square(10),
                                    activeSize: Size.square(10)),
                              ),
                            ],
                          )),
                    ),
                    Center(
                      child: Text(
                        'Tips : \nKerjakan soal battle dengan tenang!',
                        style: AppFontStyle.normalText.copyWith(
                            color: darkMode ? Colors.white : Colors.black,
                            fontSize: 16,
                            height: 1.4),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      width: MediaQuery.of(context).size.width * .5,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                            ),
                            child: Container(
                              height: 42.0,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFD20328),
                                    Color(0xFFA20925)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Batalkan",
                                  style: AppFontStyle.boldText.copyWith(
                                      color: Colors.white,
                                      height: 1.4,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
