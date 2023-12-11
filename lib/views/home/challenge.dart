import 'package:flutter/material.dart';
import 'package:mdaq/common/data/level.dart';
import 'package:mdaq/common/http/challenge.dart';
import 'package:mdaq/common/http/quiz.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/utils/transition_shift.dart';
import 'package:mdaq/common/widgets/user_exp.dart';
import 'package:mdaq/common/widgets/loading.dart';
import 'package:mdaq/common/widgets/top_bar.dart';
import 'package:mdaq/views/quiz/quiz_assign.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  @override
  void initState() {
    super.initState();
    getChallenge(context, () => refresh());
    getQuiz(context, () => refresh());
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            const TopBar(),
            Container(
              margin: const EdgeInsets.only(top: 100),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text('Tantangan',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    'assets/icons/challenge2.png',
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 12, right: 12),
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: user.image),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: AppFontStyle.accountNameText.copyWith(
                                    color:
                                        darkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                                Text(
                                  '@${user.username}',
                                  style:
                                      AppFontStyle.accountUsernameText.copyWith(
                                    color: darkMode
                                        ? const Color(0xFF9EA3A2)
                                        : Colors.black.withOpacity(.5),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                SizedBox(
                                  height: 24,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 12),
                                        child: UserEXP(
                                          progress: (user.exp / user.maxExp)
                                              .toDouble(),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/level.png',
                                              width: 22,
                                            ),
                                            Text(
                                              '${user.level}',
                                              style: AppFontStyle.boldText
                                                  .copyWith(
                                                color: const Color(0xFF0F6EDE),
                                                height: 1.8,
                                                fontSize:
                                                    user.level >= 100 ? 10 : 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 12),
                                        child: Text(
                                          '${user.exp}/${user.maxExp}',
                                          style: AppFontStyle.boldText.copyWith(
                                            color: Colors.white,
                                            height: 2,
                                            fontSize:
                                                user.level >= 100 ? 10 : 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 2, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'assets/icons/coin.png',
                                    width: 28,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    summarizeDigits(user.coin),
                                    style: AppFontStyle.normalText.copyWith(
                                      height: 1.4,
                                      fontSize: 15,
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Skor',
                                    style: AppFontStyle.boldText.copyWith(
                                      height: 1.4,
                                      fontSize: 18,
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    summarizeDigits(user.score),
                                    style: AppFontStyle.normalText.copyWith(
                                      height: 1.4,
                                      fontSize: 15,
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
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
            Container(
              margin: const EdgeInsets.only(top: 390),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F6FB),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                gradient: darkMode
                    ? const LinearGradient(
                        colors: [
                          Color(0xFF122447),
                          Color(0xFF040E31),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.bottomCenter,
                child: Builder(
                  builder: (context) {
                    if (challenge.isEmpty) {
                      return const Loading();
                    }
                    return ListView.builder(
                      itemCount: challenge.length,
                      itemBuilder: (BuildContext context, int i) {
                        final item = challenge[i];
                        return GestureDetector(
                          onTap: () {
                            Level level = quiz[0].levels[0];
                            switch (item.id) {
                              case 1:
                                level = quiz[0].levels[0];
                              case 2:
                                level = quiz[0].levels[1];
                              case 3:
                                level = quiz[0].levels[2];
                              case 4:
                                level = quiz[0].levels[3];
                            }
                            answers.clear();
                            answers = List.generate(
                                level.questions.length, (index) => null);
                            quizTime = DateTime.now();
                            Navigator.of(context).push(TransitionShift(
                                child: QuizAssign(id: 0, level: level)));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: darkMode
                                  ? const Color(0xFF233256)
                                  : const Color(0xFFE7EEF8),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              border: Border.all(
                                color:
                                    const Color(0xFF4F4F4F).withOpacity(0.31),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
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
                                        Image.asset(
                                          'assets/icons/challenge-${item.status}.png',
                                          color: !item.status && !darkMode
                                              ? Colors.black
                                              : null,
                                          width: 60,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.title,
                                                style: AppFontStyle.boldText
                                                    .copyWith(
                                                  height: 1.2,
                                                  fontSize: 17,
                                                  color: darkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                item.instruction,
                                                style: AppFontStyle.normalText
                                                    .copyWith(
                                                  height: 1.2,
                                                  fontSize: 12,
                                                  color: darkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 2, left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/challenge-xp.png',
                                                        width: 20,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        '+${item.xp}',
                                                        style: AppFontStyle
                                                            .normalText
                                                            .copyWith(
                                                          height: 1.4,
                                                          fontSize: 13,
                                                          color: darkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/check.png',
                                                        width: 20,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        '+${item.success}',
                                                        style: AppFontStyle
                                                            .normalText
                                                            .copyWith(
                                                          height: 1.4,
                                                          fontSize: 13,
                                                          color: darkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/coin.png',
                                                        width: 20,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        '+${item.coin}',
                                                        style: AppFontStyle
                                                            .normalText
                                                            .copyWith(
                                                          height: 1.4,
                                                          fontSize: 13,
                                                          color: darkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/cross.png',
                                                        width: 20,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        '+${item.failed}',
                                                        style: AppFontStyle
                                                            .normalText
                                                            .copyWith(
                                                          height: 1.4,
                                                          fontSize: 13,
                                                          color: darkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
