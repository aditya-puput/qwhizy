import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mdaq/common/data/level.dart';
import 'package:mdaq/common/data/question.dart';
import 'package:mdaq/common/data/quiz.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getQuiz(BuildContext context, Function() refresh) async {
  quiz.clear();
  loadLevels();
  quiz.add(Quiz(title: "Tingkat Surah", difficulty: 2, levels: getLevels));
  quiz.add(Quiz(title: "Tingkat Juz", difficulty: 3, levels: []));
  quiz.add(Quiz(title: "Random", difficulty: 4, levels: []));
  quiz.add(Quiz(title: "Mode Bertahan", difficulty: 0, levels: []));
}

void loadRandom() {
  final random = Random();
  final randomLevel = getLevels[random.nextInt(getLevels.length)];
  final randomQuestions = List<Question>.generate(5, (index) {
    return randomLevel.questions[random.nextInt(randomLevel.questions.length)];
  });

  quiz[2].levels = [
    Level(
      title: "Random",
      juz: 0,
      questions: randomQuestions,
    )
  ];
}

void loadJuzLevels() {
  List<Level> juzLevels = [];
  Set<int> uniqueJuzValues = {};

  for (Level surahLevel in getLevels) {
    uniqueJuzValues.add(surahLevel.juz);
  }

  final random = Random();

  for (int juzValue in uniqueJuzValues) {
    Level juzLevel =
        Level(title: "Juz $juzValue", juz: juzValue, questions: []);
    List<Level> levelsInJuz =
        getLevels.where((level) => level.juz == juzValue).toList();
    List<Question> randomQuestionsForJuz = [];

    if (levelsInJuz.isNotEmpty) {
      for (var i = 0; i < 5; i++) {
        Level randomLevel = levelsInJuz[random.nextInt(levelsInJuz.length)];
        Question randomQuestion =
            randomLevel.questions[random.nextInt(randomLevel.questions.length)];
        randomQuestionsForJuz.add(randomQuestion);
      }
    }

    juzLevel.questions = randomQuestionsForJuz;
    juzLevels.add(juzLevel);
  }

  quiz[1].levels = juzLevels;
}
