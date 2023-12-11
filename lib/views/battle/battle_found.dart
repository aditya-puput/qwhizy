import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mdaq/common/data/battle.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/utils/transtition_fade.dart';
import 'package:mdaq/views/battle/battle_quiz.dart';

class BattleFound extends StatefulWidget {
  final Battle battle;
  const BattleFound({super.key, required this.battle});

  @override
  State<BattleFound> createState() => _BattleFoundState();
}

class _BattleFoundState extends State<BattleFound> {
  @override
  void initState() {
    super.initState();
    final randomMilliseconds =
        2000 + (DateTime.now().millisecondsSinceEpoch % 3000);
    final randomDuration = Duration(milliseconds: randomMilliseconds);

    Future.delayed(randomDuration, () {
      if (mounted) {
        answers.clear();
        answers =
            List.generate(widget.battle.questions.length, (index) => null);
        quizTime = DateTime.now();
        Navigator.of(context).pushReplacement(TransitionFade(
            child: BattleQuiz(
          id: 0,
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
                      height: 46,
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: double.infinity,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Fawwas Dzaki',
                                                  style: AppFontStyle.boldText
                                                      .copyWith(
                                                    height: 1.2,
                                                    fontSize: 22,
                                                    color: darkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '@FDzakii3837',
                                                  style: AppFontStyle.normalText
                                                      .copyWith(
                                                    height: 1.2,
                                                    fontSize: 14,
                                                    color: darkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          SizedBox(
                                            height: 62,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 3,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                      child: Image.asset(
                                                          "assets/images/user_default.png",
                                                          fit: BoxFit.cover)),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/level.png',
                                                        width: 22,
                                                      ),
                                                      Text(
                                                        '10',
                                                        style: AppFontStyle
                                                            .boldText
                                                            .copyWith(
                                                          color: const Color(
                                                              0xFF0F6EDE),
                                                          height: 1.8,
                                                          fontSize:
                                                              user.level >= 100
                                                                  ? 10
                                                                  : 11,
                                                        ),
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
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/images/vs.png",
                                  width: 110,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 62,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 3,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                      child: Image.asset(
                                                          "assets/images/user_default.png",
                                                          fit: BoxFit.cover)),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/level.png',
                                                        width: 22,
                                                      ),
                                                      Text(
                                                        '${user.level}',
                                                        style: AppFontStyle
                                                            .boldText
                                                            .copyWith(
                                                          color: const Color(
                                                              0xFF0F6EDE),
                                                          height: 1.8,
                                                          fontSize:
                                                              user.level >= 100
                                                                  ? 10
                                                                  : 11,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  user.name,
                                                  style: AppFontStyle.boldText
                                                      .copyWith(
                                                    height: 1.2,
                                                    fontSize: 22,
                                                    color: darkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '@${user.username}',
                                                  style: AppFontStyle.normalText
                                                      .copyWith(
                                                    height: 1.2,
                                                    fontSize: 14,
                                                    color: darkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              Center(
                                child: Text('Lawan Ditemukan...',
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
                            ],
                          )),
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
