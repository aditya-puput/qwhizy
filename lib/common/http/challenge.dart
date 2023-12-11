import 'package:flutter/material.dart';
import 'package:mdaq/common/data/challenge.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getChallenge(BuildContext context, Function() refresh) async {
  challenge.clear();
  challenge.add(Challenge(
      id: 1,
      title: "Kerjakan Quiz",
      instruction: "Surat Al-Fatihah",
      xp: 100,
      coin: 150,
      success: 70,
      failed: 30,
      status: false));
  challenge.add(Challenge(
      id: 2,
      title: "Kerjakan Quiz",
      instruction: "Surat Al-Baqarah",
      xp: 240,
      coin: 70,
      success: 280,
      failed: 200,
      status: false));
  challenge.add(Challenge(
      id: 3,
      title: "Kerjakan Quiz",
      instruction: "Surat Al-Imran",
      xp: 100,
      coin: 150,
      success: 70,
      failed: 30,
      status: false));
  challenge.add(Challenge(
      id: 4,
      title: "Kerjakan Quiz",
      instruction: "Surat An-Nisa",
      xp: 240,
      coin: 70,
      success: 280,
      failed: 200,
      status: false));
}
