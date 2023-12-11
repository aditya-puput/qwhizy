import 'package:mdaq/common/data/question.dart';

class Battle {
  final int id;
  final String title;
  final String icon;
  List<Question> questions;

  Battle({required this.id, required this.title, required this.icon, required this.questions});
}
