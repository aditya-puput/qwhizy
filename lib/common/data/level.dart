import 'package:mdaq/common/data/question.dart';

class Level {
  final String title;
  final int juz;
  List<Question> questions;

  Level({required this.title, required this.juz, required this.questions});
}
