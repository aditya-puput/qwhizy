import 'package:flutter/material.dart';
import 'package:mdaq/common/data/character.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getCharacter(BuildContext context, Function() refresh) async {
  character.clear();
  character.add(Character(
      id: 1, name: "Alif", frame: "alif_frame.png", char: "alif.png"));
  character.add(Character(
      id: 2, name: "Alif", frame: "alif_frame.png", char: "alif.png"));
  character.add(Character(
      id: 3, name: "Alif", frame: "alif_frame.png", char: "alif.png"));
  character.add(Character(
      id: 4, name: "Alif", frame: "alif_frame.png", char: "alif.png"));
}
