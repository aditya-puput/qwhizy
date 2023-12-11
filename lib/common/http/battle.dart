import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mdaq/common/data/battle.dart';
import 'package:mdaq/common/data/question.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getBattle(BuildContext context, Function() refresh) async {
  battle.clear();
  loadLevels();
  battle.add(Battle(id: 1, title: "Cerdas Cermat", icon: "", questions: []));
  battle.add(Battle(id: 2, title: "Akurat", icon: "", questions: []));
}

void loadBattle(int id) {
  final random = Random();
  final randomLevel = getLevels[random.nextInt(getLevels.length)];
  final randomQuestions = List<Question>.generate(10, (index) {
    return randomLevel.questions[random.nextInt(randomLevel.questions.length)];
  });

  battle.firstWhere((element) => element.id == id).questions = randomQuestions;
}