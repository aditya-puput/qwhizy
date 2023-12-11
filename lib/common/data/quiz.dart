import 'package:mdaq/common/data/level.dart';

class Quiz {
  final String title;
  final int difficulty;
  List<Level> levels;

  Quiz({required this.title, required this.difficulty, required this.levels});
}
