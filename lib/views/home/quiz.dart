import 'package:flutter/material.dart';
import 'package:mdaq/common/http/quiz.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/utils/transition_shift.dart';
import 'package:mdaq/common/widgets/circle_percent.dart';
import 'package:mdaq/common/widgets/loading.dart';
import 'package:mdaq/common/widgets/top_bar.dart';
import 'package:mdaq/views/quiz/quiz_assign.dart';
import 'package:mdaq/views/quiz/quiz_list.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _AlQuranListState();
}

class _AlQuranListState extends State<Quiz> {
  @override
  void initState() {
    super.initState();
    getQuiz(context, refresh);
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
              height: 320,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text('Kuis',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: darkMode
                            ? const Color(0xFF111D3B)
                            : const Color(0xFFE7EEF8),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        border: Border.all(
                          color: const Color(0xFF4F4F4F).withOpacity(0.31),
                          width: 1.5,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/icons/perform.png",
                              width: MediaQuery.of(context).size.width * .6,
                            ),
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              bottom: 0,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: CirclePercent(
                                          percent: .4,
                                          radius: 55,
                                          lineWidth: 15,
                                          fontSize: 30,
                                          fontColor: Color(0xFF00C0DA),
                                          colors: [
                                            Color(0xFF3CEAC1),
                                            Color(0xFF00C0DA)
                                          ]),
                                    ),
                                    const SizedBox(
                                      height: 28,
                                    ),
                                    Text("Skor Terbaik",
                                        style: AppFontStyle.boldText.copyWith(
                                          color: darkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16,
                                        )),
                                    Text("956",
                                        style: AppFontStyle.normalText.copyWith(
                                          color: darkMode
                                              ? Colors.white
                                              : Colors.black,
                                          height: 1.4,
                                          fontSize: 18,
                                        )),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text("Rekor Bertahan",
                                        style: AppFontStyle.boldText.copyWith(
                                          color: darkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16,
                                        )),
                                    Text("956",
                                        style: AppFontStyle.normalText.copyWith(
                                          color: darkMode
                                              ? Colors.white
                                              : Colors.black,
                                          height: 1.4,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              )),
                          Positioned(
                              top: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 22),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Skor",
                                          style: AppFontStyle.boldText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                          )),
                                      Text("956",
                                          style:
                                              AppFontStyle.normalText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            height: 1.2,
                                            fontSize: 34,
                                          )),
                                      Text("Waktu",
                                          style: AppFontStyle.boldText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                          )),
                                      Text("03:00",
                                          style:
                                              AppFontStyle.normalText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            height: 1.2,
                                            fontSize: 18,
                                          )),
                                    ]),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 420),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 750,
                  width: double.infinity,
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
                  child: Builder(
                    builder: (context) {
                      if (quiz.isEmpty) {
                        return const Loading();
                      }
                      return ListView.builder(
                        itemCount: quiz.length,
                        itemBuilder: (BuildContext context, int i) {
                          final item = quiz[i];
                          return GestureDetector(
                            onTap: () {
                              switch (i) {
                                case 1:
                                  loadJuzLevels();
                                    Navigator.of(context).push(TransitionShift(
                                      child: QuizList(
                                    quiz: item,
                                  )));
                                case 2:
                                  loadRandom();
                                  answers = List.generate(
                                      item.levels[0].questions.length,
                                      (index) => null);
                                  quizTime = DateTime.now();
                                  Navigator.of(context).push(TransitionShift(
                                      child: QuizAssign(
                                          id: 0, level: item.levels[0])));
                                default:
                                  Navigator.of(context).push(TransitionShift(
                                      child: QuizList(
                                    quiz: item,
                                  )));
                              }
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
                                        vertical: 4,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 2,
                                                  ),
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    item.title,
                                                    style: AppFontStyle.boldText
                                                        .copyWith(
                                                      height: 1.4,
                                                      fontSize: 18,
                                                      color: darkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                              visible: item.difficulty > 0,
                                              child: Row(
                                                children: [
                                                  for (int i = 4; i > 0; i--)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              top: 4,
                                                              bottom: 4),
                                                      child: Image.asset(
                                                        "assets/icons/star${i > item.difficulty ? '_empty' : ''}.png",
                                                        width: 24,
                                                      ),
                                                    ),
                                                ],
                                              ))
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
            ),
          ],
        ),
      ),
    );
  }
}
