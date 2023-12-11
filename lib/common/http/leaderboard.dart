import 'package:flutter/material.dart';
import 'package:mdaq/common/data/leaderboard.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getLeaderboard(BuildContext context, Function() refresh) async {
  leaderboard.clear();
  leaderboard.add(Leaderboard(
      id: 1,
      name: "Satya Bagas",
      username: "Satyabagas17",
      level: 32,
      score: 770342,
      image: null));
  leaderboard.add(Leaderboard(
      id: 2,
      name: "Agus Aji",
      username: "Agusaji19",
      level: 22,
      score: 370342,
      image: null));
  leaderboard.add(Leaderboard(
      id: 3,
      name: "Dewi Sartini",
      username: "DewiSartini99",
      level: 28,
      score: 532843,
      image: null));
  leaderboard.add(Leaderboard(
      id: 4,
      name: user.name,
      username: user.username,
      level: user.level,
      score: user.score,
      image: null));
  leaderboard.add(Leaderboard(
      id: 5,
      name: "Asri Ayu",
      username: "AsriAyu38",
      level: 51,
      score: 1432843,
      image: null));
  leaderboard.add(Leaderboard(
      id: 6,
      name: "Ahmad Putra",
      username: "Ahmadputra114",
      level: 64,
      score: 2178361,
      image: null));

  leaderboard.sort((a, b) => b.score.compareTo(a.score));
}
