import 'package:flutter/material.dart';
import 'package:mdaq/common/data/character.dart';

class User {
  final int id;
  final String name;
  final String username;
  final int coin;
  final int score;
  final int level;
  final int exp;
  final int maxExp;
  final Character curChar;
  final List<int> chars;
  final Image image;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.coin,
      required this.score,
      required this.level,
      required this.exp,
      required this.maxExp,
      required this.curChar,
      required this.chars,
      required this.image});
}
