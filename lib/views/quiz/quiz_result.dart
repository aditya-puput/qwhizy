import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdaq/common/data/level.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/utils/transition_shift.dart';
import 'package:mdaq/common/utils/transtition_fade.dart';
import 'package:mdaq/common/widgets/quiz_top_bar.dart';
import 'package:mdaq/views/quiz/quiz_assign.dart';

class QuizResult extends StatefulWidget {
  final Level level;
  final DateTime endTime;
  const QuizResult({super.key, required this.level, required this.endTime});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  int benar = 0;

  @override
  void initState() {
    super.initState();

    widget.level.questions.asMap().forEach((index, question) {
      if (question.correct == answers[index]) {
        benar++;
      }
    });
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
            Column(
              children: [
                QuizTopBar(
                  title: widget.level.title,
                  height: 360,
                  content: Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
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
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${(benar / widget.level.questions.length * 100).toStringAsFixed(0)}%',
                                        style: AppFontStyle.boldText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 65,
                                            height: .8)),
                                    Text(
                                        '$benar/${widget.level.questions.length}',
                                        style: AppFontStyle.normalText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 25,
                                            height: .8)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text('Skor : ',
                                        style: AppFontStyle.normalText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 25,
                                            height: .8)),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text('${20 * benar}',
                                        style: AppFontStyle.boldText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 65,
                                            height: .8)),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/check.png",
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text('$benar',
                                        style: AppFontStyle.boldText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20,
                                            height: 1.4)),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/cross.png",
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text('${widget.level.questions.length - benar}',
                                        style: AppFontStyle.boldText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20,
                                            height: 1.4)),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/time.png",
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      DateFormat('mm:ss').format(DateTime(0).add(widget.endTime.difference(quizTime!))),
                                        style: AppFontStyle.boldText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20,
                                            height: 1.4)),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/coin.png",
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text('38',
                                        style: AppFontStyle.boldText.copyWith(
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20,
                                            height: 1.4)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              height: 30,
                              width: 180,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(TransitionShift(
                                      child: QuizAssign(
                                    id: 0,
                                    level: widget.level,
                                    review: true,
                                  )));
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                ),
                                child: Container(
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF3CEAC1),
                                        Color(0xFF00C0DA)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Ulas Soal",
                                      style: AppFontStyle.boldText.copyWith(
                                          color: Colors.black,
                                          height: 1.4,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text('Tingkatkan lagi!! Semangat!!',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          height: .4)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          answers.clear();
                          quizTime = DateTime.now();
                          answers = List.generate(
                              widget.level.questions.length, (index) => null);
                          Navigator.of(context).pushReplacement(TransitionFade(
                              child: QuizAssign(
                            id: 0,
                            level: widget.level,
                          )));
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        child: Container(
                          height: 42.0,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF3CEAC1), Color(0xFF00C0DA)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Text(
                              "Coba Lagi",
                              style: AppFontStyle.boldText.copyWith(
                                  color: Colors.black,
                                  height: 1.4,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        child: Container(
                          height: 42.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF233256),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Text(
                              "Kembali",
                              style: AppFontStyle.boldText.copyWith(
                                  color: Colors.white,
                                  height: 1.4,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
