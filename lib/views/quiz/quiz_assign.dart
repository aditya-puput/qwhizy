import 'package:flutter/material.dart';
import 'package:mdaq/common/data/level.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/utils/transtition_fade.dart';
import 'package:mdaq/common/widgets/quiz_top_bar.dart';
import 'package:mdaq/views/quiz/quiz_result.dart';

class QuizAssign extends StatefulWidget {
  final int id;
  final Level level;
  final bool review;
  const QuizAssign(
      {super.key, required this.id, required this.level, this.review = false});

  @override
  State<QuizAssign> createState() => _QuizAssignState();
}

class _QuizAssignState extends State<QuizAssign> {
  @override
  Widget build(BuildContext context) {
    final begin = widget.level.questions[widget.id].begin;
    final end = widget.level.questions[widget.id].end;

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
                  title: widget.review ? 'Ulas Soal' : widget.level.title,
                  subTitle: widget.review ? widget.level.title : '',
                  content: Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 30),
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
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(
                                  child: Text(
                                      widget.level.questions[widget.id].title,
                                      style: AppFontStyle.boldText.copyWith(
                                          color: darkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 22,
                                          height: 1.4)),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                 RichText(
                                  textAlign: TextAlign.start,
                                  textDirection: TextDirection.rtl,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: begin,
                                      ),
                                      WidgetSpan(
                                        child: Container(
                                          width: 80,
                                          height: 2,
                                          color: const Color(0xFFFFC700),
                                        ),
                                      ),
                                      TextSpan(
                                        text: end,
                                      ),
                                    ],
                                    style: AppFontStyle.boldText.copyWith(
                                        color: darkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 24,
                                        height: 1.8),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text('Isilah ayat rumpang di atas dengan tepat!',
                      style: AppFontStyle.normalText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 14,
                          height: .4)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 400),
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
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: double.infinity,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              itemCount: widget
                                  .level.questions[widget.id].answers.length,
                              itemBuilder: (BuildContext context, int i) {
                                final item = widget
                                    .level.questions[widget.id].answers[i];
                                final answer = answers[widget.id];
                                return GestureDetector(
                                  onTap: () {
                                    if (!widget.review) {
                                      setState(() {
                                        answers[widget.id] = i;
                                      });
                                      if (answers
                                          .every((answer) => answer != null)) {
                                        Navigator.of(context)
                                            .pushReplacement(TransitionFade(
                                                child: QuizResult(
                                          level: widget.level,
                                          endTime: DateTime.now(),
                                        )));
                                      }
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: widget.review && answer == i && answer != widget.level.questions[widget.id].correct ? const Color(0xFFFF6464) : darkMode
                                          ? const Color(0xFF233256)
                                          : const Color(0xFFE7EEF8),
                                      gradient: answer == i && !widget.review || widget.review && answer == i && answer == widget.level.questions[widget.id].correct || widget.review && i == widget.level.questions[widget.id].correct
                                          ? const LinearGradient(
                                              colors: [
                                                  Color(0xFF3CEAC1),
                                                  Color(0xFF00C0DA)
                                                ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter)
                                          : null,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      border: Border.all(
                                        color: answer == i
                                            ? const Color(0xFF233256)
                                            : darkMode
                                                ? const Color(0xFF3CEAC1)
                                                    .withOpacity(0.5)
                                                : const Color(0xFF4F4F4F)
                                                    .withOpacity(0.31),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 8,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  item,
                                                  style: AppFontStyle.normalText
                                                      .copyWith(
                                                          color: answer == i && !widget.review || widget.review && answer == i && answer == widget.level.questions[widget.id].correct || widget.review && i == widget.level.questions[widget.id].correct
                                                              ? Colors.black
                                                              : darkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                          fontSize: 28,
                                                          height: 1.4),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16, top: 8),
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (widget.id > 0) {
                                    Navigator.of(context)
                                        .pushReplacement(TransitionFade(
                                            child: QuizAssign(
                                      id: widget.id - 1,
                                      level: widget.level,
                                      review: widget.review,
                                    )));
                                  }
                                },
                                child: Image.asset(
                                  'assets/icons/previous.png',
                                  color: widget.id <= 0
                                      ? const Color(0xFF233256)
                                      : null,
                                  width: 28,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/question_frame.png',
                                      width: 55,
                                    ),
                                    Center(
                                      child: Text(
                                        '${widget.id + 1}',
                                        style: AppFontStyle.boldText.copyWith(
                                            color: const Color(0xFF233256),
                                            fontSize: 28,
                                            height: 1.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (widget.id <
                                      widget.level.questions.length - 1) {
                                    Navigator.of(context)
                                        .pushReplacement(TransitionFade(
                                            child: QuizAssign(
                                      id: widget.id + 1,
                                      level: widget.level,
                                      review: widget.review,
                                    )));
                                  }
                                },
                                child: Image.asset(
                                  'assets/icons/next.png',
                                  color: widget.id >=
                                          widget.level.questions.length - 1
                                      ? const Color(0xFF233256)
                                      : null,
                                  width: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
